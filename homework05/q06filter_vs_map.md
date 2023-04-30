# What is the type signature for `filter`? How is it different from `map`?

The type signature for `filter` goes as follows:
```hs
filter :: (a -> Bool) -> [a] -> [a]
```
The type signature for `map` goes as follows:
```
map :: (a -> b) -> [a] -> [b]
```
The main difference between `filter` and `map`, is that filter inherently accesses the list by using a function/predicate which then pairs with each element of the list as input. What is returned is a copy of the list containing the elements which satisfied the function/predicate by returning a 'true' value.

Meanwhile, `map` is a function which is a modifier, rather than an accessor function. What `map` fundamentally does is take in a function and a list, and apply said function to each and every element of the list. What is returned is a modified copy of the list, reflecting the output of the function argument. 