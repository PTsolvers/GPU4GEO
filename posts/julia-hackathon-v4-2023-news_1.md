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

During the 4th edition of the hackathon, we worked on enabling the distributed computations in our ice flow code [FastIce.jl](https://github.com/PTsolvers/FastIce.jl). We use [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) (KA) for backend-agnostic computing using both GPUs and CPUs. Since GPU kernels execute asynchronously with the CPU host, it is necessary to synchronize the GPU before so that the results of the computations become available. For distributed MPI computations, we need to overlap data transfers and computations to ensure good scalability. This overlap can be achieved either by using special objects called streams that guarantee ordering of GPU operations. However, streams are backend-dependent, so in KA another approach is used, where the ordering is guaranteed within a Julia task.

During this hackathon, I managed to write the logic behind task creation and synchronisation, based on the idea of [exchangers](https://github.com/JuliaGPU/KernelAbstractions.jl/blob/vc/exchanger/examples/mpi2.jl) suggested by Valentin Churavy. Ludovic ported the diffusion benchmark to the new KA-based API, and profiled both on CUDA and AMDGPU backends, with excellent overlap between physics computations and MPI data exchange.

~~~
<img src="../../assets/images/julia_hackathon_sep_2023_iu_lr.png" alt="Profile from AMDGPU diffusion benchmark on LUMI" width="100%">
~~~

## Combining MAGEMin and t8code through Julia - with parallelization and visualization
*Boris Kaus, Hendrik Ranocha*

Boris and Hendrik spent time on a new prototype of [MAGEMin](https://github.com/ComputationalThermodynamics/MAGEMin),
a Mineral Assemblage Gibbs Energy Minimization package written in C.
Using the existing [Julia bindings](https://github.com/ComputationalThermodynamics/MAGEMin_C.jl) and the binaries
created with BinaryBuilder.jl, they combined MAGEMin with the C/C++ libraries [p4est](https://github.com/cburstedde/p4est)
and [t8code](https://github.com/DLR-AMR/t8code) for adaptive mesh refinement - using the corresponding Julia bindings
[P4est.jl](https://github.com/trixi-framework/P4est.jl) and [T8code.jl](https://github.com/DLR-AMR/T8code.jl) including
binaries from BinaryBuilder.jl, of course. Combined with shared-memory parallelization using `Base.Threads` from Julia
and visualization, the new prototype is already 1.5x faster than the mature MATLAB interface.

~~~
<img src="../../assets/images/julia_hackathon_sep_2023_magemin_amr.jpg" alt="Result of running MAGEMin in parallel with an adaptive grid" width="100%">
~~~


## Various improvements (CI systems, documentation, ...)
*Hendrik Ranocha*

Hendrik spent some time on improving different packages in various aspects. Besides reviewing quite a few PRs,
he contributed to the Julia ecosystem as follows.
- Use package extensions introduced in Julia v1.9 to reduce the latency of [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl/pull/105)
- Add automatic code spell checking (e.g., [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl/pull/98) and [T8code.jl](https://github.com/DLR-AMR/T8code.jl/pull/28))
- Improve the performance of Trixi.jl (e.g., [multi-threading on ARM](https://github.com/trixi-framework/Trixi.jl/pull/1630), [allocations with non-periodic domains](https://github.com/trixi-framework/Trixi.jl/pull/1636))
- Improve the documentation of Trixi.jl (e.g., [a new tutorial](https://github.com/trixi-framework/Trixi.jl/pull/1633) and [more reproducibility information](https://github.com/trixi-framework/Trixi.jl/pull/1638))
- Various software maintenance tasks (e.g., [updates for deprecated functionality](https://github.com/trixi-framework/Trixi2Vtk.jl/pull/70), [automating dependency updates](https://github.com/PTsolvers/FastIce.jl/pull/25)
