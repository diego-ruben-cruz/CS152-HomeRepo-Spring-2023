"""
    Description:	
    Python file for HW1.
    Write a python script to write the tail for a file, 
    given a user-defined number of lines to print out
	
	Name: Diego Cruz
	SID: 013540384

	Course: CS 152
	Section: 01
	Homework: HW1
	Date: 27 Feb 2023

    Using the following links as reference reading
    <https://gist.github.com/amitsaha/5990310#file-tail_2-py>

    Use the following test value:
    5 names_long_redux.txt
"""
import re
import os


def tailPrinter():
    # Initial input prompt to get string
    userInput = input(
        "Please enter a string that contains the number of lines you would like to have printed, and the filename you wish to read from: ")
    # If-else statements that check whether there was a match and handles respective cases
    if (None != re.search("\d+ \w+.txt", userInput)):
        userInt = int(re.search("\d", userInput).group())
        userFileName = re.search("\w+.txt", userInput).group()
        print("\nThe entered string matches the format, here are the last " +
              str(userInt) + " lines of the file named <" + userFileName + ">:")

        bufsize = 8192
        fsize = os.stat(userFileName).st_size

        iter = 0
        with open(userFileName) as f:
            if bufsize > fsize:
                bufsize = fsize-1
            data = []
            while True:
                iter += 1
                f.seek(fsize-bufsize*iter)
                data.extend(f.readlines())
                if len(data) >= userInt or f.tell() == 0:
                    print(''.join(data[-userInt:]))
                    break

    else:
        print("The entered string does not match the requested format")


tailPrinter()  # This is the execution of the function
