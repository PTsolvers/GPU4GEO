+++
using Dates

title = "Julia hackathon v10.0 2026 - Outcome"
date = Date(2026, 11, 27)
reading_time = "3-minutes read"

tags = ["activities", "Julia", "coding"]
+++

\toc

We held our 10th anniversary ∂GPU4GEO Julia hackathon on November 23-27, 2026 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects.

## MagmaThermoKinematics.jl update

*Boris Kaus & Pascal Aellig*

Strictly speaking this wasn't during the Hackathon, but somewhat before. [MagmaThermoKinematics](https://github.com/boriskaus/MagmaThermoKinematics.jl) is our Julia package to simulate the thermal evolution of magmatic systems. We have given it a substantial revamp, switched to KernelAbstractions, added various parameterisations such as convective cooling when a magma body is mostly molten, added an eruption parameterisations which removes magma if the conditions are right, track the motion of the free surface (and hist rock) during magma injection/extraction, and added an implicit enthalpy based, energy conserving, numerical solver (allowing for larger timesteps). 
 Oh yes, and we performed the highest resolution simulation ever for a volcano (resolving the whole crust with a 2.5 m grid spacing in 2D and 50m in 3D). In 2D, that allows resolving 10m thick dikes and sills (natural lengthscales). A manuscript was send to [JOSS](https://joss.theoj.org/papers/2439033fcee4e1807e216412d01ab35f) with more details.


~~~
<p align="center">
    <img src="../../assets/images/HighRes2D.gif" title="Magma injection in the crust @ 2.5m resolution" alt="Magma injection in the crust @ 2.5m resolutio" width="60%">
</p>
~~~
