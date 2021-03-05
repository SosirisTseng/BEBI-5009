# Julia basics

Relevant playable notebook: <https://nextjournal.com/bebi5009/julia-tutorial>

## Comments

```julia
# This is a single-line comment

#=
This is a
multiple-line comment
=#
```

## How to see the output

- `@show expression `shows both the expression and the result.
- `println(stuff)`for regular print and `@printf`for C-like formatted output.
- The result of the last expression will be displayed inline and saved to `ans `variable in the Julia REPL
- `display(stuff)` in Jupyter notebooks.

```julia
println("Hello Julia!")

print(1, 2, 3, ' ', '\n')

@show x = 1
```

## Data assignments

Assignment operator `=` binds a name to data.

```julia
# Integer, 64 bit
x = 1  

# Floating-point, 64-bit
y = 1.0 

# Character surrounded by single quotes
c = ' ' 

# Strings (Text) surrounded by double quotes
s = "Julia"

# Constants will emit a warning if you try to change it
const theUltimateAnswer = 42
```

`typeof(val)` sees the data type.

```julia
@show typeof(x)
@show typeof(y)
@show typeof(c)
@show typeof(s)
```

`convert(T , x`) converts `x` to type `T` if applicable.

```julia
@show convert(Float64, 2)
```

## Special characters

LaTeX-like `\something<TAB>`.

```julia
α = 1  # \alpha<TAB>

β = 3.0 # \beta<TAB>
```

Ask Julia if you do not know how to type it. (Only in interactive session like REPL or IJulia notebooks)

```julia
?π
```

## Mathematical operations and common math functions

From [Julia's manual](https://docs.julialang.org/en/v1/manual/mathematical-operations/#Mathematical-Operations-and-Elementary-Functions).

### Binary operators

```julia
a = 2
b = 3

# Addition
@show a + b

# Substraction
@show a - b

# Multiplication
@show a * b

# Division with real number output
@show b / a
@show typeof(b / a)

# Power
@show a^a

# Modulus
@show b % a

# integer division: \div <TAB>`, equivalent to div(a, b)`
@show a÷b
@show typeof(a÷b)

# rational number
@show a//b      

# Approximation `\approx<TAB>` to compare floating point numbers
#  Equivalent to isapprox(1e10 + 1.0, 1e10)
@show 1e10 + 1.0 ≈ 1e10
```

### Math functions

```julia
@show sin(0.5*π)
@show cos(0.5*π)
@show cospi(1//2)  # More accurate version to cos(0.5*π)
@show sqrt(π)
@show √π        #\sqrt<TAB>\pi<TAB>
@show log(10)   # Natual log
@show log10(10) # Common log
@show exp(-5)
@show exp(1e-10)-1, expm1(1e-10)

# Random number generator
@show uni01 = rand()     # Uniform distributed between 0 and 1 
@show dics = rand(1:6)
@show randomcharacter = rand("Hello")
```

## String manipulation

For more details, see [chapeter 8](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap08) in Think Julia.

A `string` is a sequence of characters.

- Single quotes for one character
- `" ... "` for one line strings
- `""" ....  """` for multiline strings
- `str1*str2*...` or `string(str1, str2, ...)` to concatenate strings (the latter is more flexible and thus recommended)
- `^` to repeat a string: `str^3`
- `[idx]` to access an individual character.
- `$` to insert a value into a string. But `string(val1, val2)` is faster and thus recommended.

```julia
@show 'a' == "a"

@info """ 
Multiline
string
is here
"""

str1 = "BEBI"
str2 = "5009"

@show string("The class is ", str1, '-', str2)
@show "The class is $str1-$str2"

# println() supports multiple arguments
println("The class is ", str1, '-', st)

@show str1[2]
@show str1^3
@show str1*str2 
```