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

## Ductile localization on multiple GPUs
*Arne Spang*

I worked on adapting my ParallelStencil-based 2D code for ductile localization to run on multiple GPUs using ImplicitGlobalGrid.jl. With the help of Samuel Omlin, Albert de Montserrat and Ludovic Räss, I managed to make the right adjustments and run the code on 2 and 4 GPUs for now. Looking forward to use this for more exciting setups and better resolution in the future.

~~~
<center>
    <img src="../../assets/images/2GPU_4GPU_Hackathon5.png" title="Comparison: 2 vs 4 GPU" alt="Comparison: 2 vs 4 GPU" width="75%">
</center>
~~~

## Complex initial geometries for LaMEM through GeophysicalModelGenerator
*Andrea Piccolo, Tatjana Weiler, Arne Spang, Boris Kaus*

We worked on porting a Matlab routine of Andrea to Julia and incorporating it into [GeophysicalModelGenerator](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl). This included writing an `inpolygon` function, implementing routines to define subducting slabs with arbitrary orientation and implementing a McKenzie model for temperature distribution in subducting slabs. With the new functionality, we can create complex setups for 2D and 3D [LaMEM](https://github.com/UniMainzGeo/LaMEM/) models including lithosperic blocks and subducting slabs with a realistic temperature structure. Thanks to Albert de Montserrat for helping us with optimizing the functions.

~~~
<center>
    <img src="../../assets/images/LaMEM_Setup_Hackathon_5.png" title="LaMEM setup created in GMG" alt="LaMEM setup created in GMG" width="75%">
</center>
~~~
