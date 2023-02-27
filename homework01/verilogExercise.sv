/*
    Description:	
    Verilog file for HW1.
    Write a verilog file for the following reference functions:
    <https://sjsu.instructure.com/courses/1563106/files/71942719?wrap=1>
	
	Name: Diego Cruz
	SID: 013540384

	Course: CS 152
	Section: 01
	Homework: HW1
	Date: 27 Feb 2023
*/

// This will be the main module for the exercise
module homeworkOneExercies(x1, x2, x3, x4, f1, f2);
    input x1, x2, x3, x4;
    output f1,f2;

    and (z1, x1, !x3);
    and (z2, x2, !x3);
    and (z3, !x3, !x4);
    and (z4, x1, x2);
    and (z5, x1, !x4);
    or (f1, z1, z2, z3, z4, z5);

    or (y1, x1, !x3);
    or (y2, x1, x2, !x4);
    or (y3, x2, !x3, !x4);
    and (f2, y1, y2, y3);
endmodule