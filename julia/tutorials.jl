########## Basics #############

# Basic datatypes
x = 2    # 64 bit Integer
y = 3.0  #  64-bit Floating-point number
c = ' '  # x character is surrounded by single quotes
s = "Julia"  # Strings (Text) is surrounded by double quotes
const theUltimateAnswer = 42 # Constants will emit x warning if you try to change it

# Range for an evenly-spaced sequence start:step:end
xs = 1:10
ys = 10.0:-0.1:1.0  # Counting backwards
zs = range(1.0, 10.0, length=101)

# Outputs
println("Hello ", x)  # Using the print / println function


# Arithmetic operations

# Addition
@show x + y

# Substraction
@show x - y

# Multiplication
@show x * y

# Division with real number output
@show y / x
@show typeof(y / x)

# Power
@show x^x

# Modulus
@show y % x

# integer division: \div <TAB>`, equivalent to div(x, y)`
@show x ÷ 3
@show typeof(x ÷ 3)

# rational number
@show x // convert(Int64, y)

# Approximation operator `\approx<TAB>` to compare floating point numbers
#  Equivalent to isapprox(1e10 + 1.0, 1e10)
@show 1e10 + 1.0 ≈ 1e10

# Common math functions: Type `\xxx<TAB>`

@show sin(0.5*π)
@show cos(0.5*π)
@show cospi(1//2)  # More accurate version of cos(0.5*π)
@show sqrt(π)
@show √π        #\sqrt<TAB>\pi<TAB>
@show log(10)   # Natual log
@show log10(10) # Common log
@show exp(-5)
@show exp(1e-10)-1, expm1(1e-10)

# String manipulation

@show 'x' == "x"

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
println("println(): The class is ", str1, '-', str2)

@show str1[2]
@show str1^3
@show str1*"-"*str2

# Begin block begin ... end: turns a multiline expressions into one
# Let block let ... end: similar to Begin block but the variables decalred inside will be expired outside

###### Collections #######

# tuples: sequencial, immutable

t1 = (1, 2.0, "3")  # It can hold different data types without sacrificing performance, whihc is not in tha case of arrays.

# arrays: sequencial, mutable

a1 = [1.0, 2.0, 3.0]

# 2D array (matrix) with similar syntax to MATLAB
A = [1 2 3;
     4 5 6]

# Namedtuple:  associative, immutable

nt = (a=1, b=2, c=3)

nt.a == nt[:a]

# Dict: associative, mutable

## Create a dict with pairs (x=>y) or tuples (x,y)
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

##### Control flows #####

# if block & comparison operators

score = 75

if 80 < score <= 100
  println("Good")
elseif 60 < score <= 80
  println("Okay")
else
  println("Uh-Oh")
end

# while loops: number of loops determined by a predicate

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

# for loops: number of loops determined by the length of collections / sequences / iterators

for x in xs
  println(x)
end

# Comprehensions : constuct a collection with a for loops
@show [i + j for i in 0:3, j in 0:3]  # Constructing a 2D array
@show [i + j for i in 0:3 for j in 0:3] # Constructing an 1D array

# Broadcasting and dot notation for element-wise operations
# Avaiable for functions and operators (they are actually functions)

[4, 5, 6] .+ [9, 8, 7]

sin.([1, 2, 3])

#### Functions #####

# Full form

function f1(x, y)
    3x+2y
    # return 3x+2y
end

# Single line form

f2(x, y) = 3x+2y

# Nameless form, used in higher-order functions

map(x->x^2, [1, 2, 3])

#### Putting the things altogether ####

# ODE model. Exponential growth / decay in this example.
model(u, p, t) = p * u

# ODE stepper
step_euler(f, u, p, t, dt) = u .+ dt .* f(u, p, t)

# ODE solver
function solve_euler(f, u0, tspan, p; dt=0.1)
    ts = tspan[1]:dt:tspan[end]
    us = zeros(length(ts), length(u0))
    us[1, :] .= u0
    for i in 1:length(ts)-1
        us[i+1, :] .= step_euler(f, us[i, :], p, ts[i], dt)
    end
    return (t = ts, u = us)
end

tspan = (0.0, 2.0)
p = -1.0
u0 = 1.0

sol = solve_euler(model, u0, tspan, p, dt=0.1)

#### Installing packages ####
using Pkg
# Function form
Pkg.add("Plots")

# Special strings
pkg"add Plots"

# In the REPL


#### Plotting ####

using Plots

plot([1, 1, 2])  # Integers as x-axis

plot(1:10, 1:10) # Explicit x's and y's

plot(sinpi, 1:4) # Function values as y-axis

plot(exp, -2.0, 2.0)  # Max and min values

plot(sol.t, sol.u)

#### Solving ODEs using DiffEq's solver ####

using DifferentialEquations

prob = ODEProblem(model, u0, tspan, p)

sol = solve(prob)
