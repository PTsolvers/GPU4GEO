+++
using Dates

title = "FastIce workshop @Stanford"
date = Date(2023, 8, 3)
reading_time = "2-minute read"

tags = ["fastice", "julia", "workshop"]
+++

~~~
<img src="../../assets/images/fastice_workshop.png" alt="fastIce workshop" width="600">
~~~

## FastIce.jl on AMD GPUs on LUMI-G
*Ludovic Räss*

Ludovic Räss and Ivan Utkin participated in the first FastIce mini-workshop, hosted by the [SIGMA group](https://sigma.stanford.edu) at [Stanford](https://www.stanford.edu) Geophysics.

The venue provided a two-days event to foster exchange on thematics including ice flow modelling, high-performance computing, and geophysical multi-phase flow.

At the end of the first day, we held a short hackathon where we ported the [lid driven cavity benchmark](https://github.com/PTsolvers/LidCavity) to heterogeneous programming in Julia using [KernelAbstractions.jl](https://github.com/JuliaGPU/KernelAbstractions.jl). The resulting code, [`lid_cavity_ka_1.jl.jl`](https://github.com/PTsolvers/LidCavity/blob/main/lid_cavity_ka_1.jl), executes on CPU, Nvidia and AMD GPUs upon changing a single parameter.
