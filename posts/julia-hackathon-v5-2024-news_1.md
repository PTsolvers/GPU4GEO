+++
using Dates

title = "Julia hackathon v5.0 2024 - Outcome"
date = Date(2024, 3, 1)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our fifth GPU4GEO Julia hackathon on February 26-March 1, 2024 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions.

~~~
<center>
    <img src="../../assets/images/hack_v5_1.jpg" title="Hackathon v5 impressions" alt="Hackathon v5 impressions" width="25%">
    <img src="../../assets/images/hack_v5_2.jpg" title="Hackathon v5 impressions" alt="Hackathon v5 impressions" width="25%">
    <img src="../../assets/images/hack_v5_3.jpg" title="Hackathon v5 impressions" alt="Hackathon v5 impressions" width="25%">
</center>
~~~

## Chmy.jl - computational core library for ice flow model FastIce
*Ivan Utkin, Ludovic Räss*

During the week, I worked on the core library of components simplifying the development of scalable computational codes [Chmy.jl](https://github.com/PTsolvers/Chmy.jl). Originally devised as a core part of our massively parallel ice-flow solver [FastIce](https://github.com/PTsolvers/FastIce.jl), now Chmy.jl is distributed as a standalone Julia package. Chmy.jl contains modules for working with structured computational grids, discretised scalar, vector, and tensor fields, finite-difference differential operators, boundary conditions, and much more. All modules in Chmy.jl were designed to work both on CPUs and supported GPU backends, including CUDA and AMDGPU. In the course of the hackathon, I've polished the API of the package, an also focused on fixing bugs and improving the test coverage.

## Hydrothermal and viscous Stokes flow with auto-pilot
*Thibault Duretz*

This has been an intense an exciting week which lead to two major achievements. First, the ParallelStencil based [3D Hydrothermal code](https://github.com/tduretz/HydroThermal3D), previously deployed on the Octopus GPU compute cluster at the UNiversity of Lausanne (Switzerland), was successfully deployed on the Alambix cluster of Rennes University (France). This code will benefit to a Ph.D. student, who previously ran 2D simulations using COMSOL and needed a 3D code to move forward with his research project.

~~~
<center>
    <img src="../../assets/images/3D_ball_Hackathon5.png" title="3D multiple viscous inclusions" alt="3D multiple viscous inclusions" width="25%">
    <img src="../../assets/images/3D_HT_Hackathon5.png" title="3D HT" alt="3D HT" width="25%">
</center>
~~~

The second achievement was to port a viscous flow solver, which was previously prototyped in a 2D Julia script. This iterative solver allows for automatic adjustment of iteration parameters ("the auto-pilot"). It was ported into 3D using ParallelStencil and tested on a Nvidia A100 GPU on the Octopus cluster. The model domain encompasses inclusions of viscosity of either 1e3 Pa.s or 1e-3 Pa.s in a matrix of viscosity 1 Pa.s. No smoothing is applied to the viscosity field. Early results yield 13s time to solution (relative tolerance 1e-5) for 128^3 cells and 95s for 256^3 (~1 billion DOFs).
