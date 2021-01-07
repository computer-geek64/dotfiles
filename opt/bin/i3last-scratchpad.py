#!/usr/bin/python3
# last_scratchpad.py

import i3ipc


class Stack:
    def __init__(self, l):
        self.stack = l
        self.size = len(l)

    def push(self, e):
        self.stack.append(e)
        self.size += 1

    def pop(self):
        self.size -= 1
        self.stack.pop(size)

    def peek(self):
        return self.stack[self.size - 1]


i3 = i3ipc.Connection()
stack = Stack(i3.get_tree().scratchpad().leaves())
i3.command('[con_id={id}] scratchpad show'.format(id=stack.peek().id))

