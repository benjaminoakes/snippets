# Author: Benjamin Oakes <hello@benjaminoakes.com>

tell application "System Events"
	set frontmostApplication to name of the first process whose frontmost is true
end tell

