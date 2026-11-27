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
    <img src="../../assets/images/HighRes2D.gif" title="Magma injection in the crust @ 2.5m resolution" alt="Magma injection in the crust @ 2.5m resolution" width="70%">
</p>
~~~


## MantleFabric.jl: adding ODFTEX

*Boris Kaus*

[MantleFabric.jl](https://github.com/JuliaGeodynamics/MantleFabric.jl) was started during the last hackathon as a Julia translation of [PyDRex](https://github.com/seismic-anisotropy/PyDRex), which predicts how olivine crystals align in a deforming mantle and hence the seismic anisotropy we can expect from a geodynamic model (following the widely-used DRex method of Neil Ribe). The Julia version is more than three orders of magnitude faster than the Python one, also computes finite strain tensors, and can post-process 3D [LaMEM](https://github.com/JuliaGeodynamics/LaMEM.jl) simulations. During this hackaton, we have expanded it to include the new ODFTEX method of [Ribe, Faccenda & VanderBeek (2026)](https://doi.org/10.1093/gji/ggag170) ([#PR 4](https://github.com/JuliaGeodynamics/DRex.jl/pull/4)). Instead of tracking thousands of individual grains, ODFTEX evolves a continuous orientation distribution with a single recrystallisation parameter, which makes it faster and free of sampling noise. In a 2D convection test with 9600 aggregates both methods predict nearly the same anisotropy, but ODFTEX was about 20 times faster. Switching between the two is a single keyword (`method = :drex` or `method = :odftex`), and the documentation reproduces the key figures of both papers.


## SeismicWavePC.jl: a new julia code to simulate seismic waves and do full-waveform inversion on (parallel) GPUs

*Boris Kaus and Ludovic Raess*

We released [SeismicWavePC.jl](https://github.com/JuliaGeodynamics/SeismicWavePC.jl), a pure Julia package for seismic waves in 2D and 3D visco-elastic media and for full-waveform inversion (FWI). It runs on CPU threads, on NVIDIA, AMD and Apple GPUs, and with MPI. It started as a port of the Fortran code OpenSWPC, whose seismograms it reproduces to round-off. It handles topography, oceans, attenuation, VTI anisotropy, PML boundaries and teleseismic plane waves, and takes any model built with [GeophysicalModelGenerator.jl](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl), such as thermal models of magmatic systems with MAGEMin velocities. It also computes exact adjoint gradients and Born modelling, and plugs into Optim.jl and Turing.jl for deterministic and Bayesian inversion.

On the elastic Marmousi2 benchmark (5 m grid, 2.4 million cells, 5317 time steps), our code on 12 CPU threads is as fast as Devito (5.3 s vs 5.2 s). On a laptop GPU (Apple Metal) it takes 2.7 s, 6× faster than OpenSWPC on 12 MPI ranks. A misfit gradient takes 22 s on the GPU, 18× faster than SeismicWaves.jl. For accuracy, we checked the seismograms against OpenSWPC, SPECFEM2D, analytical solutions (to 0.1–0.5 %) and Devito, which converges to our seismograms as its grid is refined. Compared to Devito we lack higher-order (>4) stencils and tilted anisotropy, but we offer elastic gradients, topography and everything in Julia. Here are waves from an earthquake below a volcano:

~~~
<p align="center">
    <img src="../../assets/images/Unzen_2D_waves_10m_curvilinear.gif" title="2D model of seismic wave propagation below a volcano with magma reservoir" alt="2D model of seismic wave propagation below a volcano with magma reservoir" width="70%">
</p>
~~~


## GeophysicalModelGenerator.jl: giving the gravity solver a bit of love

*Boris Kaus*

[GeophysicalModelGenerator.jl v0.10.1](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) comes with a much extended gravity code ([docs](https://juliageodynamics.github.io/GeophysicalModelGenerator.jl/dev/man/gravity_code)). `voxel_grav` computes gravity anomalies and their horizontal gradients from 3D density models: on a flat Earth (`CartData`) or on the reference ellipsoid (`GeoData`), at the grid columns or at arbitrary stations such as survey points, and on grids with variable spacing. New helpers compute normal gravity (GRS80) and simple and complete Bouguer corrections, so you can go from observed gravity to Bouguer anomalies. `voxel_grav_adjoint` computes the sensitivity of the anomaly to the density, which makes it easy to plug GMG models into Julia's inversion ecosystem. The docs work through least-squares inversions with [Krylov.jl](https://github.com/JuliaSmoothOptimizers/Krylov.jl) and [Optim.jl](https://github.com/JuliaNLSolvers/Optim.jl), and probabilistic (Hamiltonian Monte Carlo) inversions with [Turing.jl](https://turinglang.org) and [AdvancedHMC.jl](https://github.com/TuringLang/AdvancedHMC.jl). With the optional [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) backend, the same code also runs on all CPU threads or on a GPU (CUDA, AMD or Apple Metal).

**And yes it is fast.** Every cell is treated as a point mass plus its quadrupole term, and cells close to a station are subdivided adaptively. We compared it with [Harmonica](https://github.com/fatiando/harmonica), [SimPEG](https://simpeg.xyz), GMT `gravprisms`, [gravmagsubs](https://cran.r-project.org/package=gravmagsubs) (Fortran) and [Tesseroids](https://github.com/leouieda/tesseroids) (C) on the same model with 10,201 stations above 300,000 prisms. GMG agrees with their exact prism formulas to 2×10⁻⁶ of the maximum anomaly, far below the precision of gravity data. On a single CPU core it takes 3 s, compared with 33 s for SimPEG and 109–240 s for the other codes: 11–80 times faster. On 16 threads, GMG is 3–18 times faster than the other parallel codes, and on the GPU of an Apple M4 Max the model takes 0.27 s. For tesseroids on a sphere, GMG is about 35 times faster than Harmonica and Tesseroids on a single core. The full benchmark, including its setup, is in the [documentation](https://juliageodynamics.github.io/GeophysicalModelGenerator.jl/dev/man/gravity_code#Benchmark).

## GeophysicalModelGenerator.jl: giving the gravity solver a bit of love

*Boris Kaus*

## GeoValaisWallis3D.jl

*Thibault Duretz, Boris Kaus, Ludovic Raess*

The hackathon week was extremely fruitful: the latest developments of [GeophysicalModelGenerator.jl v0.10.1](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) could be put to use straight away. Starting from openly available geological and geophysical datasets, mostly from [swisstopo](https://map.geo.admin.ch), we built a 3D model of the Valais/Wallis region: [GeoValaisWallis3D.jl](https://github.com/tduretz/GeoValaisWallis3D.jl). It combines the [swissALTIRegio](https://www.swisstopo.admin.ch/en/height-model-swissaltiregio) topography, the [swissBEDROCK](https://www.swisstopo.admin.ch/en/3d-swissbedrock-en) thickness of the Quaternary valley fill, the [Tectonic Map of Switzerland](https://map.geo.admin.ch/?layers=ch.swisstopo.geologie-tektonische_karte), the crustal layers and densities of [3D-ALPS](https://doi.org/10.5880/GFZ.4.5.2019.004), the Moho of [Spada et al. (2013)](https://doi.org/10.1093/gji/ggt148), the [3D model of the Nappe de Morcles](https://doi.org/10.6084/m9.figshare.c.4130759), the [Gravimetric Atlas of Switzerland](https://map.geo.admin.ch/?layers=ch.swisstopo.geologie-gravimetrischer_atlas.messpunkte), and the [seismic subsoil classes](https://www.vs.ch/web/sdm/cartes-de-sol-de-fondation) of the Rhône valley (CREALP). All of these can easily be plotted together in the same 3D coordinates and explored interactively with tools such as [ParaView](https://www.paraview.org) or [Makie](https://docs.makie.org/stable/). In addition, the new adjoint of GMG's gravity code, coupled to the LSQR solver of [Krylov.jl](https://github.com/JuliaSmoothOptimizers/Krylov.jl), allowed us to perform a least-squares inversion of the Bouguer anomaly. The result is a density model that explains the gravity data over the canton of Valais/Wallis: the rms misfit drops from 18 to 2 mGal at about 8,000 gravity stations. The inversion solves for about one million unknowns and runs in about a minute on a laptop GPU.

~~~
<p align="center">
    <img src="[../../assets/images/Unzen_2D_waves_10m_curvilinear.gif](https://raw.githubusercontent.com/tduretz/GeoValaisWallis3D.jl/main/docs/figures/showcase.jpg)" title="2D model of seismic wave propagation below a volcano with magma reservoir" alt="2D model of seismic wave propagation below a volcano with magma reservoir" width="70%">
</p>
~~~

## A high-performance computation of 1946-like earthquake in canton Valais/Wallis

*Thibault Duretz, Boris Kaus, Ludovic Raess*

Together with the release of [SeismicWavePC.jl](https://github.com/JuliaGeodynamics/SeismicWavePC.jl), which runs on GPU clusters, [GeoValaisWallis3D.jl](https://github.com/tduretz/GeoValaisWallis3D.jl) allowed us to run a 3D wave-propagation simulation of a scenario resembling the damaging 1946 Valais (Sion) earthquake, of moment magnitude 5.8 ([ValaisRawilWaves](https://github.com/tduretz/ValaisRawilWaves)). The source is placed in the Rawil fault zone north of Sion–Sierre, at 6 km depth. The model covers the whole canton (130 × 95 km, down to 60 km depth) with 8.4 billion cells, 25 m apart horizontally and, near the surface, vertically. This resolves frequencies up to 2 Hz, even in the soft Quaternary sediments of the Rhône valley (Vs ≈ 350 m/s). The model includes the effect of the topography, but also of the complex geological structure of the Valais/Wallis, which leads to local site amplification in the valleys. The simulation covers 40 seconds of wave propagation. It was run on [Daint](https://www.cscs.ch/computers/alps) on the Alps infrastructure of CSCS, with access granted through the dGPU4GEO project. At this resolution the simulation needs 16 NVIDIA GH200 GPUs (4 nodes) for about 45 minutes.

