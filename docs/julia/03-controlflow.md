# Control flow

## If clause

```julia
score = 75

if 80 < score <= 100
  println("Good")
elseif 60 < score <= 80
  println("Okay")
else
  println("Uh-Oh")
end
```

## While loop

Number of loops determined by a predicate.

```julia
## Hailstone sequence (3n+1 problem)

let n = 10000
    step = 0
    while n != 1
    if iseven(n)
        n += 2
    else
        n = 3n + 1
    end
    step += 1
    end
end
```

## For loop

Number of loops determined by the container size.

```julia

xs = 10:-1:1

for x in xs
    println(x)
end

for (i, x) in enumerate(xs)
    println("xs[", i, "] = ", x)
end
```

## Collection + control flow = Comprehensions

To construct a collection with for loop(s)

```julia
[i^2 for i in 1:10 if i >= 5]     # Basic form
[i + j for i in 0:3 for j in 0:3] # An 1D array
[i + j for i in 0:3, j in 0:3]    # This is a 2D array

Dict(i => f(i) for i = 1:10)  # Creating a dictionary using generator
```