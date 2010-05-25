# Date: 2004
# Author: Benjamin Oakes <hello@benjaminoakes.com>

isbn = {}

isbn['0201353776'] = [ {'nonSort':'The'},\
                        {'title':'BeOS bible'},\
                        {'namePart':'Hacker, Scot.'} ]
isbn['039440095x'] = [ {'title':'Jazz is'},\
                        {'namePart':'Hentoff, Nat.'} ]
isbn['025617217x'] = [ {'title':'Economics'},\
                        {'namepart':'Colander, David C.'} ]
isbn['0393972992'] = [ {'nonSort':'The'},\
                        {'title':'enjoyment of music'},\
                        {'subTitle':'an introduction to perceptive listening'}, \
                        {'namePart':'Machlis, Joseph'} ]

for number in isbn.keys():
    print "ISBN:",number
    for item in isbn[number]:
        for category in item.keys():
            if item.has_key('nonSort'):
                print "Has nonSort"
            print str(category) + ":", item[category]
    print ""

