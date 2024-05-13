+++
using Dates

title = "A EuroHPC Success Story"
date = Date(2024, 05, 13)
reading_time = "3-minute read"

tags = ["amdgpu", "julia", "eurohpc"]
+++

Significant advances running [FastIce.jl](https://github.com/PTsolvers/FastIce.jl) on LUMI-G reflected in an interview with EuroHPC about the STREAM project.

## A EuroHPC Success Story: Improved modelling of ice flow to better anticipate sea-level rise
*Ludovic Räss*

Our on-going ice flow modelling efforts using AMD GPUs on the European flagship supercomputer LUMI are now featured in an online interview with EuroHPC about **Improved modelling of ice flow to better anticipate sea-level rise**.

[Link to the full interview](https://eurohpc-ju.europa.eu/eurohpc-success-story-improved-modelling-ice-flow-better-anticipate-sea-level-rise_en)

> The STREAM research team believes that new techniques in high-performance extreme-scale GPU computing will revolutionise ice flow modelling in the future and provide more accurate predictions. The team tackled the complexities of ice flow dynamics by employing a computational approach that involves solving partial differential equations (PDEs) on GPUs.

### Latest results

Amongst the latest result, we are now working towards resolving the [Vavilov ice cap](https://earthobservatory.nasa.gov/images/144790/a-surprising-surge-at-vavilov-ice-cap) in order to understand the processes that lead to the [rapid destabilisation of ice](https://doi.org/10.1016/j.epsl.2018.08.049) and the formation of an ice stream.

These preliminary results already suggest an acceleration of flow in the region of the ice flow instability.
~~~
<center>
    <img src="../../assets/images/vavilov_3d.png" title="Ice flow velocity on Vavilov" alt="Ice flow velocity on Vavilov" width="40%">
    <img src="../../assets/images/vavilov_slice.png" title="Ice flow on Vavilov, cross section" alt="Ice flow on Vavilov, cross section" width="40%">
</center>
~~~

In the coming steps, we will refine the numerical resolution and activate the coupling to perform time-dependant simulations.
