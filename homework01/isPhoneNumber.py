"""
    Description:	
    Python file for HW1.
    Write a python script to match phone numbers from a given string.
	
	Name: Diego Cruz
	SID: 013540384

	Course: CS 152
	Section: 01
	Homework: HW1
	Date: 27 Feb 2023

    Try the following test values: 
    %s 139-867-5309
    %s 1398675309
"""
import re

# This is a function that checks whether a properly formatted number is present in the input string


def isPhoneNumber():
    # Initial input prompt to get string
    userInput = input(
        "Please enter a string that contains a phone number in the following format (XXX-XXX-XXXX): ")
    # If-else statements that check whether there was a match and handles respective cases
    if (None != re.search("\d{3}-\d{3}-\d{4}", userInput)):
        print("The entered phone number matches the format")
    else:
        print("The entered phone number does not match the format")


isPhoneNumber()  # This is the execution of the function
