package main

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"strings"
)

func main() {
	interfaceName := os.Args[1]
	serviceName := fmt.Sprintf("wg-quick-%s.service", interfaceName)
	_, err := isServiceActive(serviceName)
	if err != nil {
		fmt.Println(false)
	} else {
		fmt.Println(true)
	}
}

func isServiceActive(serviceName string) (bool, error) {
	cmd := exec.Command("systemctl", "is-active", serviceName)
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out

	err := cmd.Run()
	if err != nil {
		return false, err
	}

	status := strings.TrimSpace(out.String())
	return status == "active", nil
}
