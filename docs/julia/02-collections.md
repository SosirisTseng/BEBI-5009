# Collections and sequencies

Built-in collections provide the most basic way to tidy up a bunch of data. They are categorized by `mutability` and `accessing method` orthogonally.

The values of a `immutable` collection cannot be updated after its creation, while a `mutable` collection can. 

The elements in `sequential` collections are accessed by *integer indices*, while those in `associative` collection are accessed by *keys*.

!> In Julia, the index starts from **1**, as in R, MATLAB, and Fortran.

## Ranges

Ranges are cheap options for evenly-spaced number sequences.

## Tuples

Tuples are `immutable` and `sequential` collections. And again you cannot update the value after you create it.

```julia
# Create an tuple
t = (1, 2, 3)

t1 = (1, 2.0, "3")  # It can hold different data types without sacrificing performance, whihc is not in tha case of arrays.

# First element
t[1]

# You cannot update it's value. This will result in a error.
t[1] = 42
```

But you can "update" the values by assigning the name to a new tuple.

```julia
# Create an tuple
t = (1, 2, 3)

t = (4, 5, 6)
```

Tuples are the easy way to swap variables

```julia
x = 6
y = 9

x, y = y, x

@show (x, y)
```

## Named Tuples

Named tuples are `immutable` and `associative` collections.

```julia
nt = (a=1, b=2, c=3)

# Access alements via field or symbol kays
nt.a == nt[:a]

# Number indexing still works
nt.a == nt[1]
```

## Dictionaries

Dictionaries are 
- `mutable` and `associative` collections
- created with pairs (x=>y) or tuples (x,y)
- the keys and values are retrieved by `keys(dict)` and `values(eng2sp)`
- single value is accessed by `dict[key]`
- the iterator of a dict return the key-value paisr but they are not ordered:

```julia
eng2sp = Dict("one" => "uno", "two" => "dos", "three" => "tres")

## Finding key and values
@show keys(eng2sp)
@show values(eng2sp)

## Finding a value by a key
@show eng2sp["one"]

## Returns default value if not found
@show get(eng2sp, "one", "N/A")

## Add entries dynamically
eng2sp["four"] = "cuatro"
@show eng2sp["four"]

# Extract keys and values. Pairs are unordered
for (k ,v) in eng2sp
    println(k, " => ", v)
end
```

## Arrays

Arrays are `mutable` and `sequential` collections.

```julia
a1 = [1.0, 2.0, 3.0]

a1[2] = 42.0  # okay

# 2D array (matrix) with similar syntax to MATLAB
A = [1 2 3;
     4 5 6]

# Make arrays from other colection using collect
collect(1:10)   # np.arange(1, 11)
```

## Broadcasting and dot notations

1. Element-wise operations
   ```julia
   [1, 2, 3] .+ [4, 5, 6]

   sin.([1, 2, 3])

   -2:0.1:2 .^ 10   # logspace() in Julia 

   # Make a dict from a key list and a value list
   ks = (:a, :b, :c)
   vs = (1, 2, 3)
   Dict(ks .=> vs)
   ```
2. Expand dimentions automatically if compatible

   ```julia
   # Make a 9*9 multiplication table
   collect(1:9) .* transpose(collect(1:9))
   ```