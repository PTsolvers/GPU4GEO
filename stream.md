+++
header = "STREAM project"
+++

**S**pon**T**aneous **REA**rrangment of ice **M**otion (STREAM)

~~~
<center>
  <video width="80%" autoplay controls src="../assets/images/ice_3d_vel.mp4"/>
</center>
~~~

_Spontaneous formation of an internal shear band in a slab of ice flowing over rough topography resulting in englacial sliding. The arrows’ colour scale reflects the flow acceleration in the centre of the channelised streaming ice._

**What mechanisms control the spontaneous rearrangement of ice motion in ice sheets?**

To answer this important question and shed light on better understanding the formation of ice streams in Greenland and Antarctica, a [GPU4GEO team](/team) composed of Ludovic Räss (PI) and Ivan Utkin (co-PI) from [ETHZ Glaciology group](https://vaw.ethz.ch/en/research/glaciology/research-projects.html), and co-PI Julia Samaroo from the [Julia lab at MIT](https://julia.mit.edu) got granted 5'000'000 GPU-hours (equivalent to 80'000'000 core-hours) on the [LUMI-G](https://www.lumi-supercomputer.eu) machine, the European flagship supercomputer and number 3 in the World ([Top500 list](https://www.top500.org/lists/top500/2023/06/)).

The grant follows from the first [EuroHPC JU Extreme Scale Access](https://eurohpc-ju.europa.eu/eurohpc-ju-call-proposals-extreme-scale-access-mode-open-2022-09-28_en) call and targets the European [LUMI-G pre-exascale Tier-0 supercomputer](https://www.lumi-supercomputer.eu).

The [EuroHPC STREAM project](https://eurohpc-ju.europa.eu/access-our-supercomputers/awarded-projects/spontaneous-rearrangment-ice-motion-stream_en) represents a unique opportunity to unleash the Julia language by running [FastIce.jl](https://github.com/PTsolvers/FastIce.jl), the next generation full-Stokes and thermo-mechanically coupled ice flow solvers on more than 3’000 AMD MI250x GPUs. The simulations aim at resolving parts of Greenland ice flow close to meter-scale resolution in 3-dimensions.

Regarding the technical aspects, the project will allow to run Julia at scale and use its powerful GPU stack, in particular [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl), to target LUMI-G's [AMD MI250x](https://www.amd.com/en/products/server-accelerators/instinct-mi250x) GPUs.

#### More infos
Check-out the [News](/posts) section for regular updates, and following posts for submission and award descriptions:
- [A EuroHPC Success Story](/posts/julia-lumi-eurohpc-story/)
- [FastIce workshop](/posts/fastice-workshop/)
- [STREAM award](/posts/julia-lumi-eurohpc-awarded/)
- [STREAM submission](/posts/julia-lumi-eurohpc/)
