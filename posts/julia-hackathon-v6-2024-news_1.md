+++
using Dates

title = "Julia hackathon v6.0 2024 - Outcome"
date = Date(2024, 10, 22)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our sixth GPU4GEO Julia hackathon on October 07-11, 2024 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions.

> :construction: more news to come!

# Chmy.jl - Finite differences and staggered grids on CPUs and GPUs
*You Wu, Ivan Utkin, Ludovic Räss*

It has been a fruitful week, where we restructured the package structure and we also further furnished the documentation of [Chmy.jl](https://github.com/PTsolvers/Chmy.jl), targeting on the distributed usage of it.

In order to allow users to use all submodules with a single `using Chmy` statement, we refactored the API to export symbols in submodules explicitly as addressed in [PR #51](https://github.com/PTsolvers/Chmy.jl/pull/51). Instead of relying on an external package such as `Reexport.jl`, we decided to manually export all relevant symbols to avoid unnecessary package dependencies.

With [PR #56](https://github.com/PTsolvers/Chmy.jl/pull/56), we aim to provide a comprehensive yet beginner-friendly documentation to distributed usage of Chmy.jl for our users. To do this, we provide a conceptual introduction to distributed computing generally under the section [`Distributed`](https://ptsolvers.github.io/Chmy.jl/dev/concepts/distributed/). For more experienced users, one can start with a simple script for solving a 2D diffusion example under the section [Using Chmy.jl with MPI](https://ptsolvers.github.io/Chmy.jl/dev/using_chmy_with_mpi/).

## Convection code
*Paul Tackley*

A Julia spherical annulus convection program.

~~~
<center>
    <img src="../../assets/images/convect_annulus.png" title="Annulus convection" alt="Annulus convection" width="75%">
</center>
~~~

> Almost producing the right result.
