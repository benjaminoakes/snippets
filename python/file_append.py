# Date: 2004
# Author: Benjamin Oakes <hello@benjaminoakes.com>

file = open("errors.log","a")
myMsg = raw_input("Enter the message: ")
file.write(myMsg)
file.close()

