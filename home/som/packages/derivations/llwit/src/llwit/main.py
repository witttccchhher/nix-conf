import os
import sys

env = os.path.join(os.path.expanduser("~"), ".config", "llwit")
sys.path.insert(0, env)

from config import EMAIL, PASSWD

from hugchat import hugchat
from hugchat.login import Login

from rich.console import Console
from rich.markdown import Markdown
from rich.prompt import Prompt

console = Console()


def getPrompt(chatbot):
    prompt = Prompt.ask("[bold blue]Enter prompt[/bold blue]")
    if prompt.lower() == "exit":
        with console.status("[bold blue]Delete all conversations..."):
            chatbot.delete_all_conversations()
        exit(0)
    with console.status("[bold blue]Wait to llama response..."):
        response = Markdown(chatbot.chat(prompt).wait_until_done())

    console.print(response)


def main():
    with console.status("[bold blue]Loading llama..."):
        cookie_path_dir = "./cookies/"
        sign = Login(EMAIL, PASSWD)
        try:
            cookies = sign.login(cookie_dir_path=cookie_path_dir, save_cookies=True)
        except Exception:
            console.print("[bold blue]Please set correct password and login in config.py file[/bold blue] :folded_hands:")
            exit(1)

        chatbot = hugchat.ChatBot(cookies=cookies.get_dict())
        chatbot.new_conversation(switch_to = True)

    while True:
        getPrompt(chatbot)
