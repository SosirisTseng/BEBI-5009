# Functions

See the [Julia documentation](https://docs.julialang.org/en/v1/manual/functions/) for more details.

## Full form

```julia
# Full form

function f1(x, y)
    3x+2y
    # return 3x+2y
end
```

## Single-line form

```julia
f2(x, y) = 3x+2y
```

## Anonymous form

```julia
# Nameless form, usually used in higher-order functions e.g. map(f, c)
map(x->x^2, [1, 2, 3])
```

## do syntax

Builds an anonymous function for higher-order functions.

Instead of

```julia
map(x->begin
           if x < 0 && iseven(x)
               return 0
           elseif x == 0
               return 1
           else
               return x
           end
       end,
    [A, B, C])
```

this is prettier

```julia
map([A, B, C]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end
```

Quite useful for IO operations.

```julia
open("outfile", "w") do io
    write(io, data)
end
```

## Tips

- functions are first-class objects and can be passed to a higher-order function.
- functions that will alter the arguments ends in `!`, by convention. (e.g. sort(arr) vs sort!(arr))
- Often only the scalar version is required; for vector operations, broadcast syntax might be better, and it [fuses loops](https://julialang.org/blog/2017/01/moredots/) so it should be more performant.