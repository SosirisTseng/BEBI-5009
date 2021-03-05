# Julia basics

The playable notebook: <https://nextjournal.com/bebi5009/julia-tutorial>

## Data and variables

Assignment operator `=` binds a name to data.

```julia

# This is a comment

#=
This is a
multiline comment
=#

# Integer, 64 bit
x = 1  

# Floating-point, 64-bit
y = 1.0 

# Character
c = ' ' 

# Strings (Text)
s = "Julia" 
```

## Special charactors

`\something<TAB>`

```julia
α = 1  # \alpha<TAB>

β = 3.0 # \beta<TAB>

π # \pi<TAB>
```

## View your results

- inline display for results of the last expression.
- `ans` variable in interactive sessions.
- `print(stuff)` or `println(stuff)` functions
- `@show stuff` macro.
- `display(stuff)` fiunction in Jupyter notebooks.

```julia
print(1, 2, 3, ' ')

println("Hello Julia!")

@show x = 1
```

