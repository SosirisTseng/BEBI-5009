# Julia tutorial

https://github.com/NTUMitoLab/BEBI-5009

**Reference**
1. [Think Julia](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)
2. [From zero to Julia](https://techytok.com/from-zero-to-julia/)
3. [Julia cheat sheet](https://juliadocs.github.io/Julia-Cheat-Sheet/) if you are familiar with Python and/or MATLAB.
4. [Official Julia Docs](https://docs.julialang.org/) for dictionary look-up.
5. [Julia for Pythonistas](https://colab.research.google.com/github/ageron/julia_notebooks/blob/master/Julia_for_Pythonistas.ipynb)

# Why Julia?

- Python-like syntax
- C-like speed (after you run for the 1st time)
- Flexibility across packages
- Most importantly, comprehensive toolbox for this course

# Install and run Julia

1. [Download Julia](https://julialang.org/downloads/). You could give version `1.6-rc1` a try because it loads much fater than previous versions.
2. Open the Julia terminal and enter the following commands to install IJulia, the Julia kernel for Jupyter notebooks.

```julia
using Pkg

pkg"add IJulia"
```

3. Run Jupyter Lab

```julia
using IJulia

IJulia.jupyterlab()  # Will open at ${HOME}, that is "C:\Users\yourname\" in Windows.
```

PS. Another recommendation is [VS Code](https://code.visualstudio.com/) with [Julia extension](https://www.julia-vscode.org/), more suitable for structured code.

# First steps

## How to see the results

`@show`,`println()`, `display()`, inline display for the last expression