"""
    Description:
    Python file for HW3.
    Write a Python function curry2 that takes as its argument 
    a function of two arguments, and returns it in its curried form,

	Name: Diego Cruz
	SID: 013540384

	Course: CS 152
	Section: 01
	Homework: HW3
	Date: 19 Mar 2023
"""


def curry2(arg1):  # This creates a function that takes one arg
    def currySubRoutine01(arg2):  # Nesting allows for the second arg to get inserted
        # Line below does the main computation of adding both numbers together,
        # Then outputting it to the command line
        print(arg1 + arg2)
    return currySubRoutine01


curry2(100)(200)  # Line to execute follows convention specified by the homework
