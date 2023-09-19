+++
using Dates

title = "Julia hackathon v4.0 2023 - Outcome"
date = Date(2023, 9, 19)
reading_time = "1-minute read"

tags = ["activities", "julia", "coding"]
+++

We held our fourth GPU4GEO Julia hackathon on September 11-15, 2023 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects.

~~~
<center>
<img src="../../assets/images/julia_hackathon_apr_2022_crowd.JPG" title="People at Julia Hackathon Apr 2022 (better late than never)" alt="People at Julia Hackathon Apr 2022 (better late than never)" width="80%">
</center>
~~~

## FastIce.jl distributed module
*Ivan Utkin, Ludovic Räss*

During this hackathon, we worked on enabling the distributed computations in our ice flow code [FastIce.jl](https://github.com/PTsolvers/FastIce.jl). We use [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) (KA) for backend-agnostic computing using both GPUs and CPUs. Since GPU kernels execute asynchronously with the CPU host, it is necessary to synchronize the GPU before so that the results of the computations become available. For distributed MPI computations, we need to overlap data transfers and computations to ensure good scalability. This overlap can be achieved either by using special objects called streams that guarantee ordering of GPU operations. However, streams are backend-dependent, so in KA another approach is used, where the ordering is guaranteed within a Julia task.

During this hackathon, I managed to write the logic behind task creation and synchronisation, based on the idea of [exchangers](https://github.com/JuliaGPU/KernelAbstractions.jl/blob/vc/exchanger/examples/mpi2.jl) suggested by Valentin Churavy. Ludovic ported the diffusion benchmark to the new KA-based API, and profiled both on CUDA and AMDGPU backends, with excellent overlap between physics computations and MPI data exchange.

~~~
<img src="../../assets/images/julia_hackathon_sep_2023_iu_lr.png" alt="Profile from AMDGPU diffusion benchmark on LUMI" width="100%">
~~~
