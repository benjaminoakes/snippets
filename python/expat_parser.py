# Basic idea of an expat based XML parser.
# 
# Date: 2004
# Author: Benjamin Oakes <hello@benjaminoakes.com>

import xml.parsers.expat

class Book:
    def __init__(self, title):
        self.title = title

# 3 handler functions
def start_element(name, attrs):
    print 'Start element:', name, attrs
def end_element(name):
    print 'End element:', name
def char_data(data):
    print 'Character data:', repr(data)

record = xml.parsers.expat.ParserCreate()

record.StartElementHandler = start_element
record.EndElementHandler = end_element
record.CharacterDataHandler = char_data

record.Parse("""<?xml version="1.0"?>
  <titleInfo>
    <nonSort>The </nonSort>
    <title>BeOS bible</title>
  </titleInfo>
""", 1)

