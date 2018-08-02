import os
from erlport.erlterms import Atom
from erlport.erlang import set_message_handler, cast


def sender(dest, message):
    if(message == "Hello Human"):
        cast(dest, Atom("human_msg"))
    else:
        cast(dest, Atom("hi_msg"))


def message_init(dest):
    def handler(message):
        sender(dest, message)
    set_message_handler(handler)
    return Atom("ok")


def willBuy(age):
    if(age > 20):
        return True
    else:
        return False
    return False
