+++
using Dates

title = "Julia hackathon 2022 - ROCm (AMDGPU) MPI"
date = Date(2022, 4, 11)
reading_time = "2-minute read"

tags = ["activities", "julia", "coding"]
+++

We held our first Hackathon on April 4-8 in Schwarzwald, focussing on a wide range of Julia topics.

## ROCm (AMDGPU) MPI
*Ludovic Räss*

~~~
<img src="../../assets/images/rocmawarempi.png" alt="3D viscous Stokes solution" width="400">
~~~

Majority of the most powerful and next generation of supercomputers host either Nvidia or AMD graphical processing units (GPUs), commonly known as accelerators. Being able to efficiently utilise thousands of these GPUs in parallel is therefore crucial to sustain petascale and exascale computing workflows in scientific simulations.

Important is also to be able to leverage both Nvidia and AMD devices without having to change a single line of code, making a decisive design step in a concept commonly referred to as (backend) portability. Backend portability (and thus associated performance portability) is one of the key points we aim to achieve within the [PASC funded GPU4GEO](https://www.pasc-ch.org/projects/2021-2024/gpu4geo/) project, using the [Julia language](https://julialang.org).

**We are excited to announce that [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) now supports ROCm (-aware) MPI, including [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl) as backend 🚀, besides [CUDA.jl](https://github.com/JuliaGPU/CUDA.jl) (Nvidia GPUs) and (multi-threaded) CPU support.**

To succeed, following changes where required  (to be merged soon and released)
- **ImplicitGlobalGrid.jl**: AMDGPU (`ROCArray`) support, automatic backend detection
- **AMDGPU.jl**: adding memory pool API for correct device (and associated device memory) selection, adding `unsafe_wrap` functionality, [adding async memcpy functionality](https://github.com/JuliaGPU/AMDGPU.jl/pull/220/commits/ee8f4b6e1fc3b34b9a09540626508226e6363249)
- **MPI.jl**: adding `ROCArray` support for ROCm-aware MPI

[This repository](https://github.com/luraess/ROCm-MPI/blob/main/README.md) contains the sandbox project using ROCm (-aware) MPI to compute 2D diffusion on 4 MAD MI50 GPUs at [CSCS](https://www.cscs.ch)'s test system. The non-ROCm-aware runs were also successfully performed by Thibault Duretz on the Goethe HLR AMD cluster, University of Frankfurt.

Thanks to Julian Samaroo (MIT), Valentin Churavy (MIT), Samuel Omlin (CSCS) and Ivan Utkin (ETHZ) for their valuable help and insights on this topic. 
