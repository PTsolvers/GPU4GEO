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


## DRex.jl: adding ODFTEX

*Boris Kaus*

[DRex.jl](https://github.com/JuliaGeodynamics/DRex.jl) was started during the last hackathon as a Julia translation of [PyDRex](https://github.com/seismic-anisotropy/PyDRex), which predicts how olivine crystals align in a deforming mantle and hence the seismic anisotropy we can expect from a geodynamic model (following the widely-used DRex method of Neil Ribe). The Julia version is more than three orders of magnitude faster than the Python one, also computes finite strain tensors, and can post-process 3D [LaMEM](https://github.com/JuliaGeodynamics/LaMEM.jl) simulations. During this hackaton, we have expanded it to include the new ODFTEX method of [Ribe, Faccenda & VanderBeek (2026)](https://doi.org/10.1093/gji/ggag170) ([#PR 4](https://github.com/JuliaGeodynamics/DRex.jl/pull/4)). Instead of tracking thousands of individual grains, ODFTEX evolves a continuous orientation distribution with a single recrystallisation parameter, which makes it faster and free of sampling noise. In a 2D convection test with 9600 aggregates both methods predict nearly the same anisotropy, but ODFTEX was about 20 times faster. Switching between the two is a single keyword (`method = :drex` or `method = :odftex`), and the documentation reproduces the key figures of both papers.
