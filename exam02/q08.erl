% Description:
% Erlang file for Exam 2.

% Please implement the following functions in erlang:
% Write a function in Erlang that times execution of a function.
% Write a function in Erlang that formats the time of day.

% Name: Diego Cruz
% SID: 013540384

% Course: CS 152
% Section: 01
% Date: 05 May 2023

% To compile:
% erlc q08.erl

% To run:
% erl
% q08:main().

-module(q08).
-export([print_list/1, toptrim/1, format_time/0, main/0]).

% Function that trims first result by using implementation of tail referencing erlang documentation
toptrim([_ | Tail]) -> Tail;
toptrim([]) -> [].

% Utility function to print the list
print_list(List) ->
    % See regex in erlang documentation
    io:format("~w~n", [List]).

time_taker(Function, Input) ->
    {Time, Result} = timer:tc(q08, Function, [Input]),
    % See in-house functions for time as per erlang documentation
    io:format("Time taken: ~p ms => Result: ~p~n", [Time, Result]).

% Formats the current time into a pretty message using in-house calendar functions as defined by erlang documentation
format_time() ->
    {Date, Time} = calendar:local_time(),
    {Year, Month, Day} = Date,
    {Hour, Minute, Second} = Time,
    io_lib:format("~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w", [
        Year, Month, Day, Hour, Minute, Second
    ]),
    lists:flatten(
        io_lib:format("Date: ~4..0w-~2..0w-~2..0w and Time: ~2..0w:~2..0w:~2..0w", [
            Year, Month, Day, Hour, Minute, Second
        ])
    ).

main() ->
    time_taker(toptrim, [1, 2, 3, 4, 5]),
    format_time().
