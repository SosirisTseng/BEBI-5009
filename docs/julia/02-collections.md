# Collections

It is better to get organized When the amount of data gets large. Built-in collections provide the most basic way to tidy up a bunch of data. They are categorized by `mutability` and `accessing method` orthogonally.

The values of a `immutable` collection cannot be updated it's built, while a `mutable` collection allows user to edit after its creation. 

The elements in `sequential` collections are accessed by *integer indices*, while those in `associative` collection are accessed by *keys*.

!> In Julia, the index starts from **1**, as in R, MATLAB, and Fortran.

## Tuples

Tuples are `immutable` and `sequential` collections. And again you cannot update the value after you create it.

```julia
# Create an tuple
t = (1, 2, 3)

# First element
t[1]

# You cannot update it's value. This will result in a error.
t[1] = 42
```

But you can "update" the values by assigning the name to a new tuple

```julia
# Create an tuple
t = (1, 2, 3)

t = (4, 5, 6)
```

## Named Tuples

Named tuples are `immutable` and `sequential` collections. 

## Dictionaries

Dictionaries are `mutable` and `associative` collections.

## Arrays

Arrays are `mutable` and `sequential` collections.
