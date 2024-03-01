+++
using Dates

title = "Julia hackathon v5.0 2024 - Outcome"
date = Date(2024, 3, 1)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our fifth GPU4GEO Julia hackathon on February 26-March 1, 2024 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects.

## Chmy.jl - computational core library for ice flow model FastIce
*Ivan Utkin, Ludovic Räss*

During the week, I worked on the core library of components simplifying the development of scalable computational codes [Chmy.jl](https://github.com/PTsolvers/Chmy.jl). Originally devised as a core part of our massively parallel ice-flow solver [FastIce](https://github.com/PTsolvers/FastIce.jl), now Chmy.jl is distributed as a standalone Julia package. Chmy.jl contains modules for working with structured computational grids, discretised scalar, vector, and tensor fields, finite-difference differential operators, boundary conditiones, and much more. All modules in Chmy.jl were designed to work both on CPUs and supported GPU backends, including CUDA and AMDGPU. In the course of the hackathon, I've polished the API of the package, an also focused on fixing bugs and improving the test coverage.
