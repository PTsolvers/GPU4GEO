+++
using Dates

title = "Julia multi-AMDGPU test solver to run on OLCF test system"
date = Date(2022, 6, 26)
reading_time = "2-minute read"

tags = ["amdgpu", "julia", "coding"]
+++

We successfully launched a test simulation of a 2D linear diffusion on AMD MI250x using ROCm-aware MPI on OLCF Crusher system.

## ROCm-aware MPI (AMDGPU.jl & ImplicitGlobalGrid.jl)
*Ludovic Räss*

~~~
<img src="../../assets/images/rocmawarempi.png" alt="3D viscous Stokes solution" width="400">
~~~

During the Julia hackathon in April 2022, we finalised AMDGPU support ([AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl) ROCm programming) in [MPI.jl](https://github.com/JuliaParallel/MPI.jl) and [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) for both ROCm-aware and standard AMDGPU-MPI capabilities.

We are thrilled to announce that the 2D diffusion solver successfully executed on 8 AMD MI250x GPUs using ROCm-aware MPI on [OLCF](https://www.olcf.ornl.gov)'s Crusher test system, a small replica of Frontier, the first exascale supercomputer:

```julia-repl
Start diffusion process                            
Global grid: 32762x16382x1 (nprocs: 8, dims: 4x2x1)
Process 0 selecting device 1
Process 1 selecting device 2
Process 2 selecting device 3
Process 3 selecting device 4
Process 5 selecting device 6
Process 6 selecting device 7
Process 7 selecting device 8
Process 4 selecting device 5
Starting the time loop 🚀...done
Executed 1000 steps in = 2.679e+00 sec (@ T_eff = 595.00 GB/s) 
```

The code and setup can be found in [https://github.com/luraess/ROCm-MPI](https://github.com/luraess/ROCm-MPI). On Crusher, we used Julia 1.8.0-rc1 and ROCm 5.1.0.

Thanks to William F. Godoy (OLCF) for having performed the tests. 
