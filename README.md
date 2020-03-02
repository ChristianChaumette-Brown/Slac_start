# Slac_start
Implementation of Purely Static JSON usage, need to set up API JSON format for active changes. 
The static components work very well for offline/no-network environments as the json is stored locally. Changes to the json fields will trigger a write to file that will be stored locally, then transfered back to the server.
Search bar and QR-code scanner are not yet implemented, login page has some hangups and does not have a logout function yet. Need to create a new navigation bar item that will flip bool autho and traverse up the navigation stack similar to the back button or give the back button additional features to flip that bit.
Testing login page link should be removed to see in reduces hangups.
