package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"time"
)

const apiURL = "https://api.api-ninjas.com/v1/holidays"

type Holiday struct {
	Name string `json:"name"`
	Date string `json:"date"`
	Type string `json:"type"`
}

func main() {
	apiKey := "DdDo6ryky53G2+meJ6oUSA==EADiejjnVECUC4OI"
	country := "RU"

	holidays, err := getHolidays(country, apiKey)
	if err != nil {
		fmt.Println("ERROR")
		return
	}

	today := time.Now().Format("2006-01-02")
	var todayHoliday *Holiday
	var nearestHoliday *Holiday

	for _, holiday := range holidays {
		if holiday.Date == today {
			todayHoliday = &holiday
			break
		}

		if holiday.Date > today {
			if nearestHoliday == nil || holiday.Date < nearestHoliday.Date {
				nearestHoliday = &holiday
			}
		}
	}

	if todayHoliday != nil {
		fmt.Println(todayHoliday.Name)
	} else if nearestHoliday != nil {
		fmt.Println(nearestHoliday.Name)
	} else {
		fmt.Println("NO HOLIDAYS")
	}
}

func getHolidays(country, apiKey string) ([]Holiday, error) {
	client := &http.Client{}
	req, err := http.NewRequest("GET", apiURL, nil)
	if err != nil {
		return nil, err
	}

	req.Header.Set("X-Api-Key", apiKey)
	q := req.URL.Query()
	q.Add("country", country)
	req.URL.RawQuery = q.Encode()

	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("ERROR\n")
	}

	var holidays []Holiday
	if err := json.Unmarshal(body, &holidays); err != nil {
		return nil, err
	}

	return holidays, nil
}
