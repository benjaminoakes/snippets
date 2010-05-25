# Date: 2004
# Author: Benjamin Oakes <ben@benjaminoakes.com>

class Character:
    def __init__(self, name, hp, mp, strength, magic, defense, magicDefense):
        self.name = name
        self.hp = hp
        self.mp = mp
        self.strength = strength
        self.magic = magic
        self.defense = defense
        self.magicDefense = magicDefense

    def talk(self, dialogue):
        print self.name + ":  " + dialogue

numOfCharacters = raw_input("How many characters? ")

character = {}

for i in range(1, int(numOfCharacters) + 1):
    print ""
    print "Character #", i
    print ""
    name = raw_input("Name: ")

    character[name] = Character(name, 0, 0, 0, 0, 0, 0)
    character[name].talk("Hi there!")

print character.keys()

