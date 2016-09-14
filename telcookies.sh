# This script is used to count the number of cookies stored on my personal (Linux) notebook.

# Changes the current directory into the directory with the file in which the cookies are stored. 
# mwad0hks.default Is a personal directory. Each firefox user gets assigned a different directory name. 
# For that reason, this specific script will not work on any other computer than my own.

cd ~/.mozilla/firefox/mwad0hks.default/ 


# Starts the program sqlite3 to read the data in the cookies.sqlite SQL database.
# Counts the number of entries in the moz_cookies table.
# Stores the result in a file named cookies.txt that can be accessed from the processing code. Each new value replaces the former.

sqlite3 cookies.sqlite 'select count(*) from moz_cookies;' > ~/sketchbook/Our_Digital_Dresscode/data/cookies.txt

