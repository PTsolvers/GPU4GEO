+++
using Dates

title = "Julia hackathon 2022"
date = Date(2022, 3, 23)
reading_time = "2-minute read"

tags = ["activities", "julia", "coding"]
+++

The [GPU4GEO team](/team) and external collaborators will gather for a Julia hackathon April 4-8, 2022 to advance geoscientific Julia projects.

## Hackathon purpose

We aim at moving forward with the various open-source Julia projects within ice-flow dynamics and geodynamics where collaboration with experts enables the fast track.

During the hackathon, we will focus on advancing Julia software engineering and high-performance, parallel, GPU-accelerated code development in following topics:
- Advection, marker-based routines and combining that with [ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl)
- Developing new software using ParallelStencil (e.g., seismic rupture)
- Further develop rheology and material parameter routines [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl) and use that in existing codes
- Make [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl), [Zygote.jl](https://github.com/FluxML/Zygote.jl) work with GPUs
- Explore GPU block-based dynamic tiling
- Finish DMSTAG routines within [PETSc.jl](https://github.com/JuliaParallel/PETSc.jl)
- Further develop geomIO and make [GeophysicalModelGenerator.jl](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) work with parallel setup
- Add higher-order derivatives to ParallelStencil.jl

Stay tuned as more news will follow...
