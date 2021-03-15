# Using Julia Packages

## Install packages 

in the Julia script

```julia
using Pkg

# Function form
Pkg.add("Plots")

# Pkg's special strings
pkg"add Plots"
```

or in the REPL

```julia-repl
] add Plots
```

## See what packages are installed

`st` stands for `status`.

```julia
using Pkg
Pkg.status()

pkg"st" # pkg"status"
```

(in the REPL)

```julia-repl
] st
```

## Remove a package

`rm` stands for `remove`.

```julia
using Pkg
Pkg.remove("Plots")

pkg"rm Plots" # pkg"remove Plots"
```

(in the REPL)

```julia-repl
] rm Plots
```

## Update installed packages

`up` stands for `update`.

```julia
using Pkg
Pkg.update()

pkg"up" # pkg"update"

```

