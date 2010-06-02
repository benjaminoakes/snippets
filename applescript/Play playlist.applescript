# This script makes it so that you can say the name of any of your playlists and iTunes will play it.  If you change your mind, say "cancel".
# 
# Installation steps (I think):
# 
# 1. Compile this using the AppleScript Editor
# 2. Drop the compiled version into your SpeakableItems folder
# 3. Turn on Speakable Items (System Preferences -> Speech)
# 4. Say "Play playlist" then the name of one of your playlists
# 
# Like magic, it starts playing.  :)
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

tell application "iTunes"
	set all_playlists to the name of every user playlist & "Cancel"
end tell

tell application "SpeechRecognitionServer"
	set chosen to (listen for all_playlists)
end tell

if chosen is not "Cancel" then
	tell application "iTunes"
		play the user playlist chosen
	end tell
end if

