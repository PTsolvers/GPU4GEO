+++
using Dates

title = "GPU4GEO news - Extension and Follow-up project"
date = Date(2024, 06, 10)
reading_time = "2-minute read"

tags = ["julia", "proposal"]
+++

After the last progress meeting in Lugano in January 2024, GPU4GEO got granted a 1 year extension. 6 months later, we submitted a follow up project, ∂GPU4GEO, focussing on differentiable modelling with Julia on GPUs.

## GPU4GEO extension
*Ludovic Räss*

After handing-in the final progress report, the GPU4GEO project got granted a 1 year extension to focus on topics such as:
- GPU HPC CI (running continuous integration and packages' test suite on GPU HPC infrastructure)
- Application readiness on Nvidia Grace-Hopper GH200 nodes CSCS' ALPS infrastructure
- Large scale Geodynamics application readiness
- Finalisation of the STREAM related large scale allocation

~~~
<center>
    <img src="../../assets/images/gpu4geo_rev.png" alt="GPU4GEO overview" width="600">
</center>
~~~
*Target application and related multi-scale challenges.*

## Follow-up PASC project - ∂GPU4GEO

On June 10, 2024, we submitted a GPU4GEO follow-up project to the [2024 PASC call](https://pasc-ch.org/projects/2025-2028/call-for-pasc-project-proposals/index.html). The project core team, composed of many GPU4GEO members, proposes to tackles differentiable modelling at scale using unique features of the Julia language, namely, close to native integration of the [Julia GPU](https://juliagpu.org) stack and outstanding automatic differentiation capabilities (of CPU and GPU code) with [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl).

~~~
<center>
    <img src="../../assets/images/dgpu4geo.png" alt="GPU4GEO overview" width="700">
</center>
~~~
*Graphical abstract suggesting the next steps to be addressed in ∂GPU4GEO.*

The proposed development will articulate around similar topics as developed in recent workshop such as the [NuTS workshop (https://github.com/PTsolvers/Julia-AD-NuTS)](https://github.com/PTsolvers/Julia-AD-NuTS).
