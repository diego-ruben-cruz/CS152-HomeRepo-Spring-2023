%{
Description:
Erlang file for Exam 2.

Implement an Erlang function that deletes the first occurrence of an element from a list.

Name: Diego Cruz
SID: 013540384

Course: CS 152
Section: 01
Date: 05 May 2023

To compile:
erlc q07.erl

To run:
erl
q07:toptrim().
%}

toptrip(List) ->
    return t1(List)

print_list(List) ->
    io:format("~w~n", [List]).