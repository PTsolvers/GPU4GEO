+++
using Dates

title = "Julia hackathon v9.0 2026 - Outcome"
date = Date(2026, 05, 13)
reading_time = "3-minutes read"

tags = ["activities", "Julia", "coding"]
+++

\toc

We held our seventh 9th ∂GPU4GEO Julia hackathon on march 16-20, 2026 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions...

...but first a glimpse into
<!-- ~~~
<center>
    <img src="../../assets/images/hack8_1.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
</center>
~~~ -->
the hackathon's daily routine.

## Adding full Advection for variable grid spacing

*Arne Spang & Albert de Montserrat*

Albert and I worked on adding particle-in-cell advection ([JustPIC](https://github.com/JuliaGeodynamics/JustPIC.jl)) to my 2D thermal runaway code ([DEDLoc](https://github.com/ArneSpang/DEDLoc)). This work already started last hackathon and we had to deal with several challenges including variable grid spacing, differences in discretization, minimizing interpolations and adding stress rotations. But we ultimately succeeded. JustPIC now supports variable grids and DEDLoc now has advection of temperature and stresses, including rotations. It works on CPU and GPU. 

This addition makes DEDLoc much more reliable in accurately describing the strong temperature contrasts at extreme deformation rates. Also thanks to Ivan, Ludovic and Albert (again) for a fruitful discusison about how to optimize the convergence criteria and minimize unnecessary iterations.

~~~
<center>
    <img src="../../assets/images/h9_DEDLoc_2D.gif" title="Thermal runaway" alt="Thermal runaway" width="90%">
</center>
~~~

## Topic 1

*author*

Content
