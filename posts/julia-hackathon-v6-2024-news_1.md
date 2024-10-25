+++
using Dates

title = "Julia hackathon v6.0 2024 - Outcome"
date = Date(2024, 10, 22)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our sixth GPU4GEO Julia hackathon on October 07-11, 2024 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions.

> 🚧 more news to come!

## Chmy.jl - Finite differences and staggered grids
*You Wu, Ivan Utkin, Ludovic Räss*

It has been a fruitful week, where we restructured the package structure and we also further furnished the documentation of [Chmy.jl](https://github.com/PTsolvers/Chmy.jl), targeting on the distributed usage of it.

In order to allow users to use all submodules with a single `using Chmy` statement, we refactored the API to export symbols in submodules explicitly as addressed in [PR #51](https://github.com/PTsolvers/Chmy.jl/pull/51). Instead of relying on an external package such as `Reexport.jl`, we decided to manually export all relevant symbols to avoid unnecessary package dependencies.

With [PR #56](https://github.com/PTsolvers/Chmy.jl/pull/56), we aim to provide a comprehensive yet beginner-friendly documentation to distributed usage of Chmy.jl for our users. To do this, we provide a conceptual introduction to distributed computing generally under the section [`Distributed`](https://ptsolvers.github.io/Chmy.jl/dev/concepts/distributed/). For more experienced users, one can start with a simple script for solving a 2D diffusion example under the section [Using Chmy.jl with MPI](https://ptsolvers.github.io/Chmy.jl/dev/using_chmy_with_mpi/).

## Convection code
*Paul Tackley*

**A Julia spherical annulus convection program.** The program solves the 2D spherical annulus variable-viscosity equations as given in [Hernlund & Tackley (2008)](https://doi.org/10.1016/j.pepi.2008.07.037), on a staggered grid using the direct solver. Some anomalous behaviour is observed relative to the test cases reported in that paper, so more testing/debugging is needed. Once perfected it will be posted online for general use.

~~~
<center>
    <img src="../../assets/images/convect_annulus.png" title="Annulus convection" alt="Annulus convection" width="75%">
</center>
~~~

## Permeability in GeoParams
*Pascal Aellig, Jacob Frasunkiewicz*

Over the course of the week, we have been discussing and adding Permeability laws to [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl). Currently, there are four laws that can now be added and called from the `MaterialParams` structure. Part one of many has been merged in PR [#225](https://github.com/JuliaGeodynamics/GeoParams.jl/pull/225), so stay tuned for more over the course of the next few weeks as we implement computational routines to facilitate the writing of two-phase codes.

## Implicit solvers with Enzyme.jl
*Lorenzo Candioti, Valentin Churavy*

We developed a workflow to solve partial differential equations (PDEs) with implicit schemes using the automatic differentiation package [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl). Using Enzyme to solve PDEs typically involves spelling out the residual form of the equations and differentiating this function w.r.t. the solution variable. The resulting Vector-Jacobian-Product (VJP, or Jacobian-Vector-Product, JVP) is then used to assemble the sparse Jacobian needed to solve the equations. The newly developed workflow relies on Krylov solvers which only need the JVP (or VJP) as input to solve the system of equations, thus avoiding the computationally expensive part of assembling the full Jacobian. Tested on a simple 1D Diffusion Equation, the new workflow is ca. 1.5x faster compared to the full Jacobian assembly approach.
```julia-repl
                        Matrix-free
──────────────────────────────────────────────────────────────────────
                             Time                    Allocations
                    ───────────────────────   ────────────────────────
 Tot / % measured:       989ms / 100.0%           1.07MiB /  71.3%

Section     ncalls     time    %tot     avg     alloc    %tot      avg
──────────────────────────────────────────────────────────────────────
iteration        1    989ms  100.0%   989ms    785KiB  100.0%   785KiB
  gmres          9    988ms  100.0%   110ms   78.9KiB   10.1%  8.77KiB
    jvp      43.3k    276ms   28.0%  6.38μs     0.00B    0.0%    0.00B
  forward       10   82.2μs    0.0%  8.22μs     0.00B    0.0%    0.00B
  inc            9   44.4μs    0.0%  4.93μs     0.00B    0.0%    0.00B
──────────────────────────────────────────────────────────────────────
                        Jacobian assembly
───────────────────────────────────────────────────────────────────────
                              Time                    Allocations
                     ───────────────────────   ────────────────────────
  Tot / % measured:       1.43s / 100.0%           56.7MiB /  99.2%

Section      ncalls     time    %tot     avg     alloc    %tot      avg
───────────────────────────────────────────────────────────────────────
iteration         1    1.43s  100.0%   1.43s   56.2MiB  100.0%  56.2MiB
  assembly        9    1.40s   98.2%   156ms   15.0MiB   26.6%  1.66MiB
    jvp       90.0k    625ms   43.8%  6.94μs     0.00B    0.0%    0.00B
  solve           9   24.8ms    1.7%  2.76ms   40.5MiB   72.1%  4.50MiB
  forward        10   73.0μs    0.0%  7.30μs     0.00B    0.0%    0.00B
───────────────────────────────────────────────────────────────────────
```

## Using Enzyme.jl in order to calculate adjoint sensitivies with JustRelax.jl
*Christian Schuler, Valentin Churavy, Albert de Montserrat, Pascal Aellig*

[ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl) was made compatible with the latest [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl) version (PR [#169](https://github.com/omlins/ParallelStencil.jl/pull/169) and PR [#170](https://github.com/omlins/ParallelStencil.jl/pull/170)). With the help of [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl) and [ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl) the neccessary vector-Jacobian products (VJP) for the adjoint solve in [JustRelax.jl](https://github.com/PTsolvers/JustRelax.jl) are calculated. 

The figure shows a viscoelastic falling block example which was run with JustRelax.jl

~~~
<center>
    <img src="../../assets/images/AdjointSensitivities.png" title="Falling Block" alt="FallingBlock" width="75%">
</center>
~~~



