# Date: 2004
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Book:
    def __init__(self):
        print "Book instance created."

    def addAttribute(self, type, value):
        print "Received",type,",",value
        if type == 'nonSort':
            self.nonSort = value
        elif type == 'title':
            self.title = value
        elif type == 'namePart':
            self.namePart = value        

isbn = {}

isbn['0201353776'] = [ {'nonSort':'The'},\
                        {'title':'BeOS bible'},\
                        {'namePart':'Hacker, Scot.'} ]
isbn['039440095x'] = [ {'title':'Jazz is'},\
                        {'namePart':'Hentoff, Nat.'} ]
isbn['025617217x'] = [ {'title':'Economics'},\
                        {'namePart':'Colander, David C.'} ]
isbn['0393972992'] = [ {'nonSort':'The'},\
                        {'title':'enjoyment of music'},\
                        {'subTitle':'an introduction to perceptive listening'}, \
                        {'namePart':'Machlis, Joseph'} ]
isbn['0764551493'] = [ {'title':'Bicycling for dummies'},\
                        {'namePart':'St. John, Allen.'} ]


print isbn.keys()

listOfBooks = []

for number in isbn.keys():
    print "ISBN:",number
    print isbn[number]
    this = Book()
    for item in isbn[number]:
        for category in item.keys():
            this.addAttribute(category, item[category])
    listOfBooks.append(this)
    print ""

print listOfBooks

for entry in listOfBooks:
    print "Title: " + str(entry.title)
    print "Creator: " + str(entry.namePart)
    print ""

