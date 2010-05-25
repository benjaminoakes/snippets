# Retrieve book information from the Library of Congress and Amazon.
# 
# Date: 2004/08/04
# Author: Benjamin Oakes <hello@benjaminoakes.com>

from urllib import *
import string

def getAltIsbn(isbn):
    """
    Retrieves alternate ISBN's from the xISBN web service, which are provided
    in an XML format. Parses the XML and appends each ISBN to a list.

    Returns a list of ISBN's.
    """

    isbnList = [] # Stores ISBN's for future use

    try:
        # Check to see if it's a valid ISBN
        if not( (len(isbn) == 10) or (len(isbn) == 13) ):
            raise
    except:
        print "The ISBN that you entered has an invalid length."
    else:
        try:
            xIsbn = urlopen("http://labs.oclc.org/xisbn/" + isbn)
        except:
            print "Connection failed."
        else:
            for line in xIsbn.readlines():
                # Make sure the ISBN is a string becaue some contain 'x'
                isbnList.append(str(line))
            xIsbn.close()

            return isbnList

def retrieveXml(number, type):
    """
    Retrieves LOC record data (in Mods format) from the LOC's Z39.50 service.
    Writes the XML file to disk, in "xml/[number].xml".

    Arguments: the number to look up and the type of number it
    is (ISBN, LCCN, or ISSN)
    """

    print ""
    print string.upper(type) + ": " + number
    
    try:
        xml = urlopen("http://z3950.loc.gov:7090/voyager?operation=searchRetrieve&version=1.1&query=bath." + type + "=" + number + "&maximumRecords=1&recordSchema=mods")
    except:
        print "Connection failed."
    else:
        print "Saving..."
        file = open("xml/" + number + ".xml","w")
        for line in xml.readlines():
            file.write(line)
        file.close()
        xml.close()

def retrieveImg(isbn):
    """
    Retrieves jpeg image from Amazon, CAN ONLY USE ISBN.
    Saves the image to "img/[isbn].jpg.
    """

    try:
        amazon = URLopener()
        print "Retrieving image..."
        amazon.retrieve("http://images.amazon.com/images/P/" + isbn + ".01.MZZZZZZZ.jpg","img/" + isbn + ".jpg")
    except:
        print "Connection failed."
    else:
        amazon.close()
    
numberList = []

while True:
    print ""
    print "1) Enter an LCCN"
    print "2) Enter an ISBN"
    print "3) Enter an ISSN"
    print "4) Lookup the numbers"
    print ""
    print "0) Quit"
    print ""
    
    choice = raw_input("What do you want to do? ")
    
    if choice == "1":
        myLccn = raw_input("Enter an LCCN: ")
        numberList.append([myLccn, "lccn"])
    elif choice == "2":
        myIsbn = raw_input("Enter an ISBN: ")
        numberList.append([myIsbn, "isbn"])
    elif choice == "3":
        myIssn = raw_input("Enter an ISSN: ")
        numberList.append([myIssn, "issn"])
    elif choice == "4":
        for i in range(0,len(numberList)):
            retrieveXml(numberList[0][0],numberList[0][1])
            if numberList[0][1] == "isbn":
                retrieveImg(numberList[0][0])                
            # If no errors, remove from the list after lookup
            del numberList[0]
    elif choice == "0":
        import sys
        sys.exit()
    else:
        print "Invalid choice."
        
try:
    print "%d alternate ISBN's found." % (len(getAltIsbn(myIsbn)))
except:
    print "TODO"
    
