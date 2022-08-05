+++
using Dates

title = "Julia hackathon v2.0 2022"
date = Date(2022, 8, 5)
reading_time = "2-minute read"

tags = ["activities", "julia", "coding"]
+++

The [GPU4GEO team](/team) and external collaborators will gather for a second Julia hackathon October 3-7, 2022 to advance geoscientific Julia projects.

## GPU4GEO Julia hackathon

After a successful [first edition in April 2022](https://ptsolvers.github.io/GPU4GEO/posts/julia-hackathon-2022/), we are happy to announce a second edition of the Julia hackathon, to be held at the beginning of October 2022 in the Black Forest.

During this event, we aim at moving forward with the various open-source Julia projects within ice-flow dynamics and geodynamics where collaboration with experts enables the fast track.

Namely, we will focus on advancing Julia software engineering and high-performance, parallel, GPU-accelerated code development in following topics:
- Further-develop JustPIC.jl (particle advection) and make it work with [ParallelStencil.jl](https://github.com/omlins/ParallelStencil.jl) and [ImplicitGlobalGrid.jl](https://github.com/eth-cscs/ImplicitGlobalGrid.jl) codes
- Performance-engineer AMDGPU support in ParallelStencil and ImplicitGlobalGrid
- Add AMDGPU support to ParallelStencil
- Further develop rheology and material parameter routines [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl) and use/implement that in existing codes
- Explore AD capabilities using [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl) on GPUs
- Developing new software using ParallelStencil (e.g., seismic rupture)
- Work on Pseudo-Transient GPU-based FEM codes
- Explore GPU block-based dynamic tiling
- Combine the Julia FEM code Gridap with GeoParams and AD
- Further develop geomIO and make [GeophysicalModelGenerator.jl](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) work with parallel setup
- Add higher-order derivatives to ParallelStencil.jl
- more...

Participant will team-up among topics of interest and work on their selected challenges in small groups during the week.

Stay tuned as more news will follow...

