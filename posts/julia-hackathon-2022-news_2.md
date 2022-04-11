+++
using Dates

title = "Julia hackathon 2022 - LaMEM BinaryBuilder"
date = Date(2022, 4, 10)
reading_time = "2-minute read"

tags = ["activities", "julia", "coding"]
+++

We held our first Hackathon on April 4-8 in Schwarzwald, focussing on a wide range of Julia topics. For some of us this was one of the first encounters with Julia, whereas others had some more experience with this. Invaluable was the advice of Valentin Churavy, who joined us from the MIT JuliaLab, 

## LaMEM BinaryBuilder version 
*Boris Kaus*
[LaMEM](https://bitbucket.org/bkaus/lamem) is a 3D parallel geodynamics code used for a wide range of problems, from studying the collision of tectonics plates to estimating the long-term safety of underground reservoirs. It builds on [PETSc](https://petsc.org/release/) which allows it to run on anything from a laptop to a massively parallel HPC system. Yet, one of the challenges we encountered in using LaMEM in teaching is that PETSc is often rather tricky to install at first. 
Luckily the julia-team has thought about that and created the [BinaryBuilder](https://binarybuilder.org) system, which allows you to create a build script that precompiles native binaries for essentially all modern platforms currently in use (windows, mac, linux) and hosts them online. 
These packages can be natively downloaded through the julia package manager, but they also work without julia. Boris previously used this to distribute a compiled version of  [MAGEMin](https://github.com/ComputationalThermodynamics/MAGEMin) (see [here](https://github.com/JuliaPackaging/Yggdrasil/pull/4624) for the original build script) which runs in parallel on essentially any system.

During the april 2022 Hackathon, Boris and Valentin worked on updating the [PETSc_jll](https://github.com/JuliaPackaging/Yggdrasil/pull/4726) build script and subsequently created a [LaMEM_jll](https://github.com/JuliaPackaging/Yggdrasil/pull/4740) package that precompiles LaMEM with PETSc and MPI. It turned out to be a bit more tricky to get all working (particularly windows causes problems), but things now seem to work. Instead of spending hours (or days) installing PETSc, you can now install LaMEM through the julia package manager:

```julia
julia> ]
(@v1.7) pkg> add LaMEM_jll
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
    Updating `~/.julia/environments/v1.7/Project.toml`
  [15d6fa20] + LaMEM_jll v1.1.0+2
    Updating `~/.julia/environments/v1.7/Manifest.toml`
  [15d6fa20] + LaMEM_jll v1.1.0+2
```

We also provide a wrapper [script](https://bitbucket.org/bkaus/lamem/src/master/scripts/julia/Run_LaMEM_From_Julia.jl) in the LaMEM directory (`/scripts/julia/Run_LaMEM_From_Julia.jl`) that allows you to run LaMEM in serial or parallel for a particular LaMEM input file. As an example of running this on 4 cores:
```julia
$cd ~/WORK/LaMEM/LaMEM/input_models/BuildInSetups/
$julia
 Boris-Mac:BuildInSetups kausb$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.7.2 (2022-02-06)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> include("../../scripts/julia/Run_LaMEM_From_Julia.jl")
run_lamem
julia> ParamFile="FallingBlock_Multigrid.dat";
julia> run_lamem(ParamFile, 4)
-------------------------------------------------------------------------- 
                   Lithosphere and Mantle Evolution Model                   
     Compiled: Date: Apr 11 2022 - Time: 00:59:13           
-------------------------------------------------------------------------- 
        STAGGERED-GRID FINITE DIFFERENCE CANONICAL IMPLEMENTATION           
-------------------------------------------------------------------------- 
Parsing input file : FallingBlock_Multigrid.dat 
   Adding PETSc option: -snes_type ksponly
   Adding PETSc option: -js_ksp_monitor
   Adding PETSc option: -crs_pc_type bjacobi
Finished parsing input file : FallingBlock_Multigrid.dat 
--------------------------------------------------------------------------
Time stepping parameters:
   Simulation end time          : 100. [ ] 
   Maximum number of steps      : 10 
   Time step                    : 10. [ ] 
   Minimum time step            : 1e-05 [ ] 
   Maximum time step            : 100. [ ] 
   Time step increase factor    : 0.1 
   CFL criterion                : 0.5 
   CFLMAX (fixed time steps)    : 0.5 
   Output time step             : 0.2 [ ] 
   Output every [n] steps       : 1 
   Output [n] initial steps     : 1 
--------------------------------------------------------------------------
--------------------------------------------------------------------------
Material parameters: 
--------------------------------------------------------------------------
   Phase ID : 0   
   (dens)   : rho = 1. [ ]  
   (diff)   : eta = 1. [ ]  Bd = 0.5 [ ]  

   Phase ID : 1   
   (dens)   : rho = 2. [ ]  
   (diff)   : eta = 100. [ ]  Bd = 0.005 [ ]  

   Phase ID : 2   
   (dens)   : rho = 2. [ ]  
   (diff)   : eta = 1000. [ ]  Bd = 0.0005 [ ]  

--------------------------------------------------------------------------
--------------------------------------------------------------------------
Grid parameters:
   Total number of cpu                  : 4 
   Processor grid  [nx, ny, nz]         : [1, 2, 2]
   Fine grid cells [nx, ny, nz]         : [32, 32, 32]
   Number of cells                      :  32768
   Number of faces                      :  101376
   Maximum cell aspect ratio            :  1.00000
   Lower coordinate bounds [bx, by, bz] : [0., 0., 0.]
   Upper coordinate bounds [ex, ey, ez] : [1., 1., 1.]
--------------------------------------------------------------------------
```

Please note that the currently available `PETSc_jll` BinaryBuilder package does not include the parallel direct solvers `MUMPS` and `SUPERLU_DIST` yet. Adding that remains work in progress, which you can see [here](https://github.com/JuliaPackaging/Yggdrasil/pull/4672), [here](https://github.com/JuliaPackaging/Yggdrasil/pull/4635) and [here](https://github.com/JuliaPackaging/Yggdrasil/pull/4719). Whereas we are optimistic that this will work out for linux, getting a fully native compilation for windows appears to remain tricky. Yet, windows users can always run julia (and `LaMEM_jll`) through the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install).
