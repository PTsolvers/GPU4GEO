+++
header = "About"
+++

[∂GPU4GEO](../dgpu4geo) is our on-going [PASC funded](https://pasc-ch.org/projects/2025-2028/gpu4geo-differentiable-multi-physics-solvers-for-extreme-scale-geophysics-simulations-on-gpus/index.html) scientific software development project aiming at developing **_Differentiable multi-physics solvers for extreme-scale geophysics simulations on GPUs_** with applications to the geosciences. ∂GPU4GEO aligns with the overall [GPU4GEO](#gpu4geo) initiative pushing the development of **_Frontier GPU multi-physics solvers_** to the next level. We started the GPU4GEO journey in 2021 and are excited to pursue it for the coming years.

### GPU4GEO

The [GPU4GEO PASC project](https://www.pasc-ch.org/projects/2021-2024/gpu4geo/) started in 2021 as a scientific software development project aiming at building **_Frontier GPU multi-physics solvers_** with application to natural sciences - ice flow dynamics and geodynamics in particular.

Computational Earth sciences rely on modelling to understand and predict the evolution of complex physical systems. Ice sheet dynamics and geodynamics modelling are, despite their apparent differences, two domains that build upon similar physical models and ensuing computational challenges: Extremely large simulations which are not possible with the state of the art in high-performance computing (HPC), thus requiring next-generation supercomputers. Those large-scale simulations are crucial when assessing ice flow dynamics over Greenland and Antarctica, understanding the dynamic motion of Earth’s interior or performing three-dimensional simulations.

> The goal of the [GPU4GEO](https://www.pasc-ch.org/projects/2021-2024/gpu4geo/) project is to propose software tools which provide a way forward in these two domains by exploiting two powerful emerging paradigms in HPC: massively parallel iterative solvers, and [HPC with Julia](https://juliaparallel.org) on graphical processing units (GPUs).

Solvers based on the accelerated pseudo-transient method show interesting promise for solving a wide range of mechanical multi-physics problems in geoscience, at scale and on GPU-accelerated supercomputers. We use [Julia](https://julialang.org/) as the main language because it features high-level and high-performance capabilities and performance portability amongst backends (e.g. multi-core CPUs and [AMD, NVIDIA GPUs](https://juliagpu.org/)).

The EuroHPC Extreme Scale Access allocation on LUMI for the [STREAM project](#stream_project) is one of the highlight of the GPU4GEO project.

### STREAM project

**S**pon**T**aneous **REA**rrangment of ice **M**otion (STREAM)

~~~
<center>
  <video width="80%" autoplay controls src="../assets/images/ice_3d_vel.mp4"/>
</center>
~~~

_Spontaneous formation of an internal shear band in a slab of ice flowing over rough topography resulting in englacial sliding. The arrows’ colour scale reflects the flow acceleration in the centre of the channelised streaming ice._

**What mechanisms control the spontaneous rearrangement of ice motion in ice sheets?**

To answer this important question and shed light on better understanding the formation of ice streams in Greenland and Antarctica, a [GPU4GEO team](/team) composed of Ludovic Räss (PI) and Ivan Utkin (co-PI) from [ETHZ Glaciology group](https://vaw.ethz.ch/en/research/glaciology/research-projects.html), and co-PI Julia Samaroo from the [Julia lab at MIT](https://julia.mit.edu) got granted 5'000'000 GPU-hours (equivalent to 80'000'000 core-hours) on the [LUMI-G](https://www.lumi-supercomputer.eu) machine, the European flagship supercomputer and number 3 in the World ([Top500 list](https://www.top500.org/lists/top500/2023/06/)).

The grant follows from the first [EuroHPC JU Extreme Scale Access](https://eurohpc-ju.europa.eu/eurohpc-ju-call-proposals-extreme-scale-access-mode-open-2022-09-28_en) call and targets the European [LUMI-G pre-exascale Tier-0 supercomputer](https://www.lumi-supercomputer.eu).

The [EuroHPC STREAM project](https://eurohpc-ju.europa.eu/access-our-supercomputers/awarded-projects/spontaneous-rearrangment-ice-motion-stream_en) represents a unique opportunity to unleash the Julia language by running [FastIce.jl](https://github.com/PTsolvers/FastIce.jl), the next generation full-Stokes and thermo-mechanically coupled ice flow solvers on more than 3’000 AMD MI250x GPUs. The simulations aim at resolving parts of Greenland ice flow close to meter-scale resolution in 3-dimensions.

Regarding the technical aspects, the project will allow to run Julia at scale and use its powerful GPU stack, in particular [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl), to target LUMI-G's [AMD MI250x](https://www.amd.com/en/products/server-accelerators/instinct-mi250x) GPUs.

> :bulb: **More infos:** Check-out the [News](/posts) section for regular updates, and following posts for submission and award descriptions:
>- [A EuroHPC Success Story](/posts/julia-lumi-eurohpc-story/)
>- [FastIce workshop](/posts/fastice-workshop/)
>- [STREAM award](/posts/julia-lumi-eurohpc-awarded/)
>- [STREAM submission](/posts/julia-lumi-eurohpc/)
