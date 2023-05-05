% Description:
% Erlang file for Exam 2.

% Implement an Erlang function that deletes the first occurrence of an element from a list.

% Name: Diego Cruz
% SID: 013540384

% Course: CS 152
% Section: 01
% Date: 05 May 2023

% To compile:
% erlc q07.erl

% To run:
% erl
% q07:main().

-module(q07).
-export([print_list/1, toptrim/1, main/0]).

% Function that trims first result by using implementation of tail referencing erlang documentation
toptrim([_ | Tail]) -> Tail;
toptrim([]) -> [].

% Utility function to print the list
print_list(List) ->
    % See regex in erlang documentation
    io:format("~w~n", [List]).

main() -> print_list(toptrim([1, 2, 3, 4, 5])).
