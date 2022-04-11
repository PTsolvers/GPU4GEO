+++
using Dates

title = "Julia hackathon 2022 - Stokes 3D, AD, and multi-AMDGPU"
date = Date(2022, 4, 10)
reading_time = "2-minute read"

tags = ["activities", "julia", "coding"]
+++

This news item is part of the 2022 Julia hackathon attendee feedback, by Thibault Duretz.

## Stokes 3D, AD, and multi-AMDGPU simulations

~~~
<img src="../../assets/images/news_stokes3d.png" alt="3D viscous Stokes solution" width="400" class="center">
~~~

The hackathon week has been extremely prolific, leading to numerous exciting discussions with participants about their projects, e.g., flexible composite viscous flow implementation, plasticity, marker-in-cell advection, pseudo-transient scheme, using [MDoodz](https://github.com/tduretz/MDOODZ6.0) within Julia).

Together with Ludovic Räss, I focused his efforts on the development of a plain Julia 3D Stokes-flow code based on the pseudo-transient method (see: [https://github.com/tduretz/PT3D](https://github.com/tduretz/PT3D)). This script was subsequently employed by Boris Kaus and Valentin Churavy who tested the automatic differentiation tools provided by Julia, [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl), which enables the automated computation of adjoint operators.

The aim will be to port this 3D code for usage on multiple AMD GPUs. In order to get started, I've also worked on a 2D Poisson solver (see: [`diffusion_2D_kp.jl`](https://github.com/luraess/ROCm-MPI/blob/main/scripts/diffusion_2D_kp.jl) in [https://github.com/luraess/ROCm-MPI](https://github.com/luraess/ROCm-MPI)) that was successfully run on 4 AMD MI50 GPUs, on the Goethe HLR cluster, University of Frankfurt. This success builds upon the latest development of [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) (to be soon merged into the master branch) to support AMD GPUs via the [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl) backend, besides existing support for [CUDA.jl](https://github.com/JuliaGPU/AMDGPU.jl) (Nvidia GPUs). Both the AMD and Nvidia GPU backend implementations allow for ROCm- and CUDA-aware MPI, respectively, if the MPI library was built with according support.
