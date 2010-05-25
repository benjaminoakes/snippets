# -*- coding: cp1252 -*-
# 
# Conjugate verbs in Spanish.
# 
# This mostly works (and demonstrates how early on I was interested in Computational Linguistics), but it isn't entirely reliable.
# 
# It didn't seem to hande non-ASCII characters very well either (at least on OS X), which I think the coding directive above was supposed to take care of.  I ended up making cetain strings unicode.  Otherwise, this is exactly what I wrote in 2003 (or maybe 2004).
# 
# Date: 2003
# Author: Benjamin Oakes <hello@benjaminoakes.com>

class Verb:
    "Holds an infinitive and its meaning. Can conjugate."
    def __init__(self, infinitive, meaning):
        self.infinitive = infinitive
        self.stem = infinitive[:-2]
        self.ending = infinitive[-2:]
        self.meaning = meaning

    def IsStemChanger(self):
        eToI = ["competir","despedir","pedir","reír","repetir","seguir","servir",u"sonreír", \
                "vestir"]
        eToIe = ["atender","calentar","cerrar","comenzar","divertir","empezar","encender", \
                 "entender","mentir","negar","pensar","perder","preferir","querer","recomendar", \
                 "sentar","sentir","sugerir","venir"]
        oToUe = ["acostar","almorzar","colgar","contar","costar","descolgar","desenvolver", \
                 "devolver","doler","dormir","encontrar","envolver","llover","morir", \
                 "mostrar","poder","probar","recordar","sonar","volar","volver"]
        uToUe = ["jugar"]

        # Notice the structure of these "if" and "elif" statements.
        # Since the "u-ue" class will only ever have one verb to check for, it's put first,
        # so that the interpreter doesn't have to check through all the big sections.
        #
        # It's meant to increase speed (some) by not having to check as many things.
        if self.infinitive in uToUe:
            return "u-ue"
        elif self.infinitive in eToI:
            return "e-i"
        elif self.infinitive in oToUe:
            return "o-ue"
        elif self.infinitive in eToIe:
            return "e-ie"

    def GetSpecialStem(self):
        """
        Returns the irregular stems that future and conditional use.
        Returns -1 if stem is regular.
        """
        # Because both the "future" and "conditional" tenses have very similar irregulars,
        # we create a function that both those functions can use

        irregulars = {"saber":"sabr", \
                      "poner":"pondr", \
                      "poder":"podr", \
                      "salir":"saldr", \
                      "tener":"tendr", \
                      "venir":"vendr", \
                      "hacer":"har", \
                      "querer":"querr", \
                      "decir":"dir", \
                      "haber":"habr"}

        if irregulars.has_key(self.infinitive):
            return irregulars[self.infinitive]
        else:
            return -1

    def PastParticiple(self):
        irregulars = {"abrir":"abierto", \
                      "cubrir":"cubierto", \
                      "decir":"dicho", \
                      "describir":"descrito", \
                      "escribir":"escrito", \
                      "hacer":"hecho", \
                      "ir":"ido", \
                      "morir":"muerto", \
                      "poner":"puesto", \
                      "romper":"roto", \
                      "ser":"sido", \
                      "ver":"visto", \
                      "volver":"vuelto"}

        ## Check to see if the verb is irregular
        if irregulars.has_key(self.infinitive):
            return irregulars[self.infinitive]
        else:
            if self.ending == "ar":
                return self.stem + "ado"
            elif self.ending == "er" or "ir":
                return self.stem + "ido"
            
    def PresentIndicative(self, person, number):
        # We have to change the stem a lot in this tense, so
        # we create a copy of it so it doesn't change the original
        myStem = self.stem

        # The stem doesn't change in nosotros or vosotros forms
        if not(( person == "first" or person == "second") and number == "plural"):          
            if self.ending == "ir" and self.IsStemChanger() == "e-i":
                # (The "e" to "i" change only happens in -ir verbs)
                # Find where the "e" is in the stem and change it to "i"
                location = myStem.rfind("e")
                myStem = myStem[:location] + "i" + myStem[location + 1:]
            elif self.IsStemChanger() == "u-ue":
                # Find where the "u" is and change it to "ue"
                location = myStem.rfind("u")
                myStem = myStem[:location] + "ue" + myStem[location + 1:]
            elif self.IsStemChanger() == "o-ue":
                location = myStem.rfind("o")
                myStem = myStem[:location] + "ue" + myStem[location + 1:]
            elif self.IsStemChanger() == "e-ie":
                location = myStem.rfind("e")
                myStem = myStem[:location] + "ie" + myStem[location + 1:]

        if self.ending == "ar":
            if person == "first" and number == "singular":
                return myStem + "o"
            elif person == "second" and number == "singular":
                return myStem + "as"
            elif person == "third" and number == "singular":
                return myStem + "a"
            elif person == "first" and number == "plural":
                return myStem + "amos"
            elif person == "second" and number == "plural":
                return myStem + u"áis"
            elif person == "third" and number == "plural":
                return myStem + "an"
            
        elif self.ending == "er":
            if person == "first" and number == "singular":
                return myStem + "o"
            elif person == "second" and number == "singular":
                return myStem + "es"
            elif person == "third" and number == "singular":
                return myStem + "e"
            elif person == "first" and number == "plural":
                return myStem + "emos"
            elif person == "second" and number == "plural":
                return myStem + u"éis"
            elif person == "third" and number == "plural":
                return myStem + "en"

        elif self.ending == "ir":
            if person == "first" and number == "singular":
                return myStem + "o"
            elif person == "second" and number == "singular":
                return myStem + "es"
            elif person == "third" and number == "singular":
                return myStem + "e"
            elif person == "first" and number == "plural":
                return myStem + "imos"
            elif person == "second" and number == "plural":
                return myStem + u"ís"
            elif person == "third" and number == "plural":
                return myStem + "en"

    def PresentParticiple(self):
        irregulars = {"reír":"riendo", \
                      "sonreír":"sonriendo", \
                      "ir":"yendo", \
                      "poder":"pudiendo", \
                      "venir":"viniendo", \
                      "decir":"diciendo"}

        if irregulars.has_key(self.infinitive):
            return irregulars[self.infinitive]
        
        # Because we return a value with the previous statement, it's not worth all the indentation
        # to use an "else" clause
 
        if self.ending == "ar":
            return self.stem + "ando"
        elif self.ending == "er":
            if IsVowel(self.stem[-1]):
                return self.stem + "yendo"
            else:
                return self.stem + "iendo"
        elif self.ending == "ir":
            # Because we want to modify the stem, not actually change it, we make a copy
            myStem = self.stem
            
            # Only "ir" verbs change stems in this form, and only two kinds of stem change
            if self.IsStemChanger() == "e-i":
                # Find the last "e" and change to an "i"
                location = myStem.rfind("e")
                myStem = myStem[:location] + "i" + myStem[location + 1:]
            elif self.IsStemChanger() == "o-ue":
                location = myStem.rfind("o")
                myStem = myStem[:location] + "u" + myStem[location + 1:]

            # If the last letter of the stem is a vowel, it changes from "iendo" to "yendo"                
            if IsVowel(myStem[-1]):
                return myStem + "yendo"
            else:
                return myStem + "iendo"

    def FutureIndicative(self, person, number):
        myStem = self.infinitive
        
        if self.GetSpecialStem() != -1:  # Function uses -1 if there is no special stem
            myStem = self.GetSpecialStem()

        # The verb endings are the same for all verb types (-ar, -er, -ir)
        if person == "first" and number == "singular":
            return myStem + u"é"
        elif person == "second" and number == "singular":
            return myStem + u"ás"
        elif person == "third" and number == "singular":
            return myStem + u"á"
        elif person == "first" and number == "plural":
            return myStem + u"emos"
        elif person == "second" and number == "plural":
            return myStem + u"éis"
        elif person == "third" and number == "plural":
            return myStem + u"án"

    def Conditional(self, person, number):
        myStem = self.infinitive
        
        if self.GetSpecialStem() != -1:  # Function uses -1 if there is no special stem
            myStem = self.GetSpecialStem()

        # The verb endings are the same for all verb types (-ar, -er, -ir)

        # The endings are same for first person singular and third person singular
        if ( person == "first" or person == "third" ) and number == "singular":
            return myStem + u"ía"
        elif person == "second" and number == "singular":
            return myStem + u"ías"
        elif person == "first" and number == "plural":
            return myStem + u"íamos"
        elif person == "second" and number == "plural":
            return myStem + u"íais"
        elif person == "third" and number == "plural":
            return myStem + u"ían"
            
def IsVowel(letter):
    vowels = ["a","e","i","o","u"]

    if letter in vowels:
        return True
    else:
        return False

def GetSubject(person, number):
    subjects = ["yo", u"tú", u"él", "nosotros", "vosotros", "ellos"]

    # Sets a value corresponding with each subject class
    # These will be added up to equal the index of the appropriate subject
    value = {"first":0,"second":1,"third":2,"singular":0,"plural":3}

    i = value[person] + value[number]
        
    return subjects[i]

persons = ["first", "second", "third"]
numbers = ["singular", "plural"]

# # Uncomment to allow a user to input verbs themselves.
# chosenVerb = raw_input("What verb? ")
# chosenMeaning = raw_input("What's it mean? ")
# 
# myVerb = Verb(chosenVerb, chosenMeaning)

theVerbs = [Verb("vivir", "to live"), \
            Verb("querer", "to want"), \
            Verb("poder", "to be able to"), \
            Verb("dormir", "to sleep"), \
            Verb("traer", "to bring"), \
            Verb("leer", "to read"), \
            Verb("escribir", "to write"), \
            Verb("jugar", "to play"), \
            Verb("almorzar", "to eat lunch")]

for myVerb in theVerbs:
    print ""
    print myVerb.infinitive
    print myVerb.meaning
    print ""
    
    print "Present Participle:"
    print myVerb.PresentParticiple()
    print ""
    
    print "Past Participle:"
    print myVerb.PastParticiple()
    print ""
    
    print "Present Indicative:"
    for number in numbers:
        for person in persons:
            print GetSubject(person, number), myVerb.PresentIndicative(person, number)
    print ""
    
    print "Future Indicative:"
    for number in numbers:
        for person in persons:
            print GetSubject(person, number), myVerb.FutureIndicative(person, number)
    print ""
    
    print "Conditional:"
    for number in numbers:
        for person in persons:
            print GetSubject(person, number), myVerb.Conditional(person, number)

