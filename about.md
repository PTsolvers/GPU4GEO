+++
header = "About"
+++

[GPU4GEO](https://www.pasc-ch.org/projects/2021-2024/gpu4geo/) is a [PASC](https://www.pasc-ch.org) funded scientific software development project aiming at building "Frontier GPU multi-physics solvers" with application to natural sciences - ice flow dynamics and geodynamics in particular

Computational Earth sciences rely on modelling to understand and predict the evolution of complex physical systems. Ice sheet dynamics and geodynamics modelling are, despite their apparent differences, two domains that build upon similar physical models and ensuing computational challenges: Extremely large simulations which are not possible with the state of the art in high-performance computing (HPC), thus requiring next-generation supercomputers. Those large-scale simulations are crucial when assessing ice flow dynamics over Greenland and Antarctica, understanding the dynamic motion of Earth’s interior or performing three-dimensional simulations.

> The goal of the [GPU4GEO](https://www.pasc-ch.org/projects/2021-2024/gpu4geo/) project is to propose software tools which provide a way forward in these two domains by exploiting two powerful emerging paradigms in HPC: massively parallel iterative solvers, and [HPC with Julia](https://juliaparallel.org) on graphical processing units (GPUs).

Solvers based on pseudo-transient relaxation show great promise for solving a wide range of mechanical multi-physics problems in geoscience, at scale and on GPU-accelerated supercomputers. We use [Julia](https://julialang.org/) as the main language because it features high-level and high-performance capabilities and performance portability amongst backends (e.g. multi-core CPUs and [AMD, NVIDIA GPUs](https://juliagpu.org/)).


## Funding

The project, funded by the [Swiss National Supercomputing Centre - CSCS](https://www.cscs.ch) part of [ETH Zurich](https://ethz.ch/en.html), is an international collaboration between:
- [VAW-GL](https://vaw.ethz.ch/en/research/glaciology.html) @ETH Zurich
- [GFD](https://gfd.ethz.ch) @ETH Zurich
- [Geodynamics](https://www.geosciences.uni-mainz.de/geophysics-and-geodynamics/team/univ-prof-dr-boris-kaus/) @JGU Mainz
- [JuliaLab](https://julia.mit.edu) @MIT
- [CSCS](https://www.cscs.ch) @ETH Zurich
