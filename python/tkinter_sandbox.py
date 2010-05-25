# Tk-based GUI.
# 
# Date: 2004
# Author: Benjamin Oakes <hello@benjaminoakes.com>

from Tkinter import *

class App:

    def __init__(self, master):

        frame = Frame(master)
        frame.pack()

        self.leftEntry = Entry(frame)
        self.leftEntry.pack(side = LEFT)

        self.rightEntry = Entry(frame)
        self.rightEntry.pack(side = LEFT)

        self.ok = Button(frame, text = "OK", command = self.combineEntry)
        self.ok.pack(side = LEFT)

    def combineEntry():

        print self.leftEntry.get()
        
root = Tk()

app = App(root)

root.mainloop()

