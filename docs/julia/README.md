# Julia tutorial

1. [Think Julia](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)
2. [From zero to Julia](https://techytok.com/from-zero-to-julia/)
3. [Julia cheat sheet](https://juliadocs.github.io/Julia-Cheat-Sheet/) if you are familiar with Python and/or MATLAB.
4. [Official Julia Manual](https://docs.julialang.org/) for the API.
5. [Julia for Pythonistas](https://colab.research.google.com/github/ageron/julia_notebooks/blob/master/Julia_for_Pythonistas.ipynb)
6. [Learn Julia](https://julialang.org/learning/) from the official website.

# Why Julia?

[John F. Gibson's talk](https://github.com/johnfgibson/whyjulia/blob/master/1-whyjulia.ipynb)

- Python/MATLAB-like syntax + natural math presentation
- C-like speed (!) + built-in parallelism
- Composable and extensible (e.g. DiffEq + ANN)
- Right tool for this course to solve differential equations and stochastic simulations

## Caveats about Julia?

- Time to first plot (TTFF). Code needs to be compiled first so it is less responsive than Python. (but much faster afterwards)
- Less libraries in some domains (e.g. metabolic networks) due to smaller ecosystems.
- Arrays start at one.

# Install and run Julia

[Download Julia](https://julialang.org/downloads/) and install. You could give version `1.6-rc2` a try because it loads much fater than previous versions.

## REPL workflow

Run the julia REPL (terminal) and start typing. It is suitable for simple things like 1+1.

## Jupyter workflow

This workflow is suitable for demonstrations, data explorations, and report submissions.

Open the Julia terminal and enter the following commands to install IJulia, the Julia kernel for Jupyter notebooks.

```julia
using Pkg

pkg"add IJulia"
```

And then run Jupyter Lab either from the Julia terminal.

```julia
using IJulia

# It will prompt you to install jupyter lab, enter y to proceed
# Will open at ${HOME}, thatby default it is "C:\Users\yourname\" in Windows systems.
IJulia.jupyterlab()
```

Or from conda's Jupyter lab interface if you have installed conda.

## Pluto workflow

[`Pluto.jl`](https://github.com/fonsp/Pluto.jl) is a reactive notebook environment that automatically updates all dependent values when a function or variable is altered.

It is used in MIT'S course [Introduction to Computational Thinking](https://computationalthinking.mit.edu/Spring21/).

[Youtube video](https://youtu.be/C4QhZcX34mI) for using `Pluto.jl`.

```julia
using Pkg

pkg"add Pluto"

using Pluto

Pluto.run()
```

## VS Code workflow

[VS Code](https://code.visualstudio.com/) with [Julia extension](https://www.julia-vscode.org/) works better for structured code. See this [Youtube video](https://www.youtube.com/watch?v=IdhnP00Y1Ks).

!> Another IDE, [Juno](https://junolab.org), entered [in maintenance mode](https://www.youtube.com/watch?v=rQ7D1lXt3GM) in 2020. It is recommended to use VSCode now.

## Cloud-based solutions

If your computer is not powerful enough to run Julia.

### Google collab

Open this [Julia for Pythonistas](https://colab.research.google.com/github/ageron/julia_notebooks/blob/master/Julia_for_Pythonistas.ipynb) notebook, save a copy to your Google drive, and run it.

You'll need to reload the browser window after the first cell is executed to load the Julia kernel. Also there is no syntax highlighting for Julia in that environment.

### Nextjournal

[Nextjournal](https://nextjournal.com/) hosts playable notebooks for reproducible research.

You could use [my template for Julia 1.6 + Differential Equations](https://nextjournal.com/bebi5009/julia-template).
