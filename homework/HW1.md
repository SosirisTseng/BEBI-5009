# HW1: Solving ODE systems

HackMD link: <https://hackmd.io/@SosirisTseng/BkJZjUvmd>

###### tags: `BEBI-5009` `homework`

The [SIR model](https://www.maa.org/press/periodicals/loci/joma/the-sir-model-for-spread-of-disease-the-differential-equation-model) is a simple representation of disease spread:

$$
\begin{align}
\frac{d}{dt}s(t) &= - \beta s(t)i(t)  \\
\frac{d}{dt}i(t) &= \beta s(t)i(t)  - \gamma i(t)  \\
\frac{d}{dt}r(t) &= \gamma i(t)  \\
\end{align}
$$

$s(t)$ is the proportion of susceptible people, $i(t)$ is the proportion of infectious people, and $r(t)$ is the proportion of recovered (or removed) people.

## Part 1: Julia's ODE solver

Given the initial conditions $s(0)=0.99$, $i(0)=0.01$, $r(0)=0.00$, and the parameters $\beta=3.0$, $\gamma=0.3$, please **solve** the SIR model using Julia's ODE solver[^DiffEq] for $t \in [0.0, 10.0]$ and **plot** the time series.

## Part 2: The forward Euler method

TL;DR: Please **solve** and **plot** the time series for the SIR model using the (DIY) forward Euler method with the same parameters, initial conditions, and the time span as those in part 1. 

You may need to tweak the time step ($dt$) for an accurate result.

### About the math

The most straightforward approach is the forward Euler's (FE) method[^Euler].

In each step, the next state variables ($\vec{u}_{n+1}$) is accumulated by the product of the size of time step (dt) and the derivative at the current state ($\vec{u}_{n}$):

$$ 
\vec{u}_{n+1} = \vec{u}_{n} + dt \cdot f(\vec{u}_{n}, t_{n})
$$

### About the code

```julia
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

using Plots

plot(sol.t, sol.u, label="FE method")

# True solution
plot!(x ->exp(-x), 0.0, 2.0, label="Analytical solution")
```

## Part 3: The RK4 method

TL;DR: 
1. Please **solve** and **plot** the time series for the SIR model using the (DIY) RK4[^RK4] method with the same parameters, initial conditions, and the time span as those in part 1.

2. Compared to the forward Eular method, which one is more efficient? (In terms of $dt$ size for accuracy) 
3. What about comparing the RK4 method to Julia's solver?

### About the math

One famous method for solving ODEs is the fourth order Runge-Kutta (RK4) method[^RK4].

In each step, the next state is calculated in 5 steps:

$$
\begin{align}
k_1 &= dt \cdot f(\vec{u}_{n}, t_n)  \\
k_2 &= dt \cdot f(\vec{u}_{n} + 0.5k_1, t_n + 0.5dt)  \\
k_3 &= dt \cdot f(\vec{u}_{n} + 0.5k_2, t_n + 0.5dt)  \\
k_4 &= dt \cdot f(\vec{u}_{n} + k_3, t_n + dt)  \\
u_{n+1} &= \vec{u}_{n} + (k_1 + 2k_2 + 2k_3 + k_4)/6
\end{align}
$$


# Reference

[^DiffEq]: https://docs.juliadiffeq.org/latest/tutorials/ode_example/
[^RK4]: https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods
[^Euler]: https://en.wikipedia.org/wiki/Euler_method