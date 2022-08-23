+++
header = "Software"
+++

A succint description and links towards the main project outputs - massively parallel multi-GPU solvers.

Current software development is hosted on the following GitHub organisations:

- [PTsolvers](https://github.com/PTsolvers) organisation
  - [FastIce.jl](https://github.com/PTsolvers/FastIce.jl) _Parallel (multi-)xPU iterative fast iceflow solvers_
  - [JustRelax.jl](https://github.com/PTsolvers/JustRelax.jl) _Pseudo-transient accelerated iterative solvers_

- [JuliaGeodynamics](https://github.com/JuliaGeodynamics) organisation
  - [CompGrids.jl](https://github.com/JuliaGeodynamics/CompGrids.jl) _Create computational grids that can be used with ParallelStencil.jl or PETSc.jl_
  - [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl) _Define material parameters and perform non-dimensionalization for geodynamic simulations_
  - [GeophysicalModelGenerator.jl](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) _Import, process and interpret geophysical data sets to be used in numerical models_

- **Building blocks**
  - [ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl) _Package for writing high-level code for parallel high-performance stencil computations that can be deployed on both GPUs and CPUs_
  - [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) _Almost trivial distributed parallelization of stencil-based GPU and CPU applications on a regular staggered grid_

- **Proof-of-concept packages**
  - [ROCm-MPI](https://github.com/luraess/ROCm-MPI) _ROCm (-aware) GPU MPI tests on (pre-) exascale superomputers_
  - [PT-AD](https://github.com/PTsolvers/PT-AD) _Pseudo-transient automatic differentiation playground_
