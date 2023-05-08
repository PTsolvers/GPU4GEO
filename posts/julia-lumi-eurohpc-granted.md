+++
using Dates

title = "The STREAM project on LUMI-G"
date = Date(2023, 05, 8)
reading_time = "3-minute read"

tags = ["amdgpu", "julia", "proposal"]
+++

Today we got notified about the **acceptance** of the STREAM project we submitted to the EuroHPC Extreme Scale Access call back in December 2022 🚀

## The STREAM project: FastIce.jl on AMD GPUs on LUMI-G
*Ludovic Räss & Ivan Utkin*

The GPU4GEO team composed of Ludovic Räss (ETHZ), Ivan Utkin (ETHZ) and Julian Samaroo (MIT JuliaLab) was granted the STREAM project, to investigate SponTaneous REArrangment of ice Motion (STREAM) in the scope of the [European High Performance Computing Joint Undertaking (EuroHPC JU)](https://eurohpc-ju.europa.eu/eurohpc-ju-call-proposals-extreme-scale-access-mode-open-2022-09-28_en) call to access its pre-exascale supercomputer.

~~~
<center>
  <video width="80%" autoplay controls src="../../assets/images/ice_3d.mp4"/>
</center>
~~~

The team got granted 5'000'000 GPU-hours (equivalent to 80'000'000 core-hours) on the [LUMI-G machine](https://www.lumi-supercomputer.eu), the European flagship supercomputer and number 3 in the World (Top500 list).

The STREAM project represents a unique opportunity to unleash Julia at scale by running the next generation full-Stokes and thermo-mechanically coupled ice flow solvers on more than 3000 AMD MI250x GPUs aiming at resolving parts of Greenland ice flow close to metre-scale resolution in 3-dimensions.

> The main scientific advances of this EuroHPC allocation will be to understand whether an internal shear band can spontaneously form in ice flowing over rough topography resulting in englacial sliding with the aim of providing a more accurate prediction of surface flow velocities over Greenland.

~~~
<center>
  <video width="80%" autoplay controls src="../../assets/images/ice_3d_vel.mp4"/>
</center>
~~~

Regarding the technical aspects, preparing the data for the call application permitted to tune [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl) for running on LUMI-G's MI250x GPUs.

> The main technical advances of this EuroHPC allocation aim to set a milestone running our Julia HPC application on the latest AMD GPUs at pre-exascale on Europe’s fastest supercomputer, LUMI-G.

Stay tuned or reach out if interested!

_Animations: Utkin, I., Räss, L., and Werder, M.: Large-scale thermo-mechanical modelling of Greenland ice sheet, EGU General Assembly 2023, Vienna, Austria, 24–28 Apr 2023, EGU23-16383, [https://doi.org/10.5194/egusphere-egu23-16383](https://doi.org/10.5194/egusphere-egu23-16383), 2023._