+++
header = "Software"
+++

A succinct description and links towards the main project outputs - massively parallel multi-GPU solvers.

Current software development is hosted on the following GitHub organisations:

- [PTsolvers](https://github.com/PTsolvers) organisation
  - [FastIce.jl](https://github.com/PTsolvers/FastIce.jl) _Parallel (multi-)xPU iterative fast ice flow solvers_
  - [JustRelax.jl](https://github.com/PTsolvers/JustRelax.jl) _Pseudo-transient accelerated iterative solvers for geodynamic models_

- [JuliaGeodynamics](https://github.com/JuliaGeodynamics) organisation
  - [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl) _Define material parameters and perform non-dimensionalization for geodynamic simulations_
  - [JustPIC.jl](https://github.com/JuliaGeodynamics/JustPIC.jl) _(multi-)xPU  particles-in-cell advection scheme_
  - [GeophysicalModelGenerator.jl](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) _Import, process and interpret geophysical data sets to be used in numerical models_
  - [GeoDataPicker.jl](https://github.com/JuliaGeodynamics/GeoDataPicker.jl) _Browser-based Graphical User Interface to interpret 3D geological and geophysical data_
  - [InteractiveGeodynamics.jl](https://github.com/JuliaGeodynamics/InteractiveGeodynamics.jl) _Browser-based Graphical User Interface to run geodynamic models with [LaMEM](https://github.com/UniMainzGeo/LaMEM)_
  - [LaMEM.jl](https://github.com/JuliaGeodynamics/LaMEM.jl) _Julia interface to LaMEM, which installs it and allows setting up, running and reading LaMEM simulations_
  - [CompGrids.jl](https://github.com/JuliaGeodynamics/CompGrids.jl) _Create computational grids that can be used with ParallelStencil.jl or PETSc.jl_

- **Building blocks**
  - [ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl) _Package for writing high-level code for parallel high-performance stencil computations that can be deployed on both GPUs and CPUs_
  - [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) _Almost trivial distributed parallelization of stencil-based GPU and CPU applications on a regular staggered grid_
  - [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl) _AMD GPU (ROCm) programming in Julia_
  - [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl) _Heterogeneous programming in Julia_

- **Proof-of-concept packages**
  - [ROCm-MPI](https://github.com/luraess/ROCm-MPI) _ROCm (-aware) GPU MPI tests on (pre-) exascale supercomputers_
  - [PT-AD](https://github.com/PTsolvers/PT-AD) _Pseudo-transient automatic differentiation playground_
  - [Stokes2D_simpleVEP](https://github.com/PTsolvers/Stokes2D_simpleVEP) _2D viscoelastoplastic localization_
  - [MagmaThermoKinematics](https://github.com/boriskaus/MagmaThermoKinematics.jl) _2D/3D thermal models of lithospheric-scale magmatic systems following dike injection_
  
