# Open the latest NBC Nightly News (from a constant URL that they publish to) in full screen.
# 
# Only tested on OS X 10.6 (with QuickTime X).  It probably won't work for older versions  of QuickTime.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

-- menu_click, by Jacob Rus, September 2006
-- 
-- Accepts a list of form: {"Finder", "View", "Arrange By", "Date"}
-- Execute the specified menu item.  In this case, assuming the Finder 
-- is the active application, arranging the frontmost folder by date.
-- 
-- From http://www.macosxhints.com/article.php?story=20060921045743404:

on menu_click(mList)
	local appName, topMenu, r
	
	-- Validate our input
	if mList's length < 3 then error "Menu list is not long enough"
	
	-- Set these variables for clarity and brevity later on
	set {appName, topMenu} to (items 1 through 2 of mList)
	set r to (items 3 through (mList's length) of mList)
	
	-- This overly-long line calls the menu_recurse function with
	-- two arguments: r, and a reference to the top-level menu
	tell application "System Events" to my menu_click_recurse(r, ((process appName)'s (menu bar 1)'s (menu bar item topMenu)'s (menu topMenu)))
end menu_click

on menu_click_recurse(mList, parentObject)
	local f, r
	
	-- f = first item, r = rest of items
	set f to item 1 of mList
	if mList's length > 1 then set r to (items 2 through (mList's length) of mList)
	
	-- either actually click the menu item, or recurse again
	tell application "System Events"
		if mList's length is 1 then
			click parentObject's menu item f
		else
			my menu_click_recurse(r, (parentObject's (menu item f)'s (menu f)))
		end if
	end tell
end menu_click_recurse

# Main entry point:

tell application "QuickTime Player"
	open URL "http://msnbcpod.rd.llnwd.net/e1/video/podcast/pdv_nn_netcast_m4v.m4v"
	play document 1
	activate
end tell

delay 1
menu_click({"QuickTime Player", "View", "Enter Full Screen"})
# menu_click({"QuickTime Player", "View", "Loop"})

