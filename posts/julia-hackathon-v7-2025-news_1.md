+++
using Dates

title = "Julia hackathon v7.0 2025 - Outcome"
date = Date(2025, 04, 04)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our seventh GPU4GEO Julia hackathon on March 24-28, 2025 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions.

> 🚧 more news to come!

## Jaumann stress rate in viscoplastic regularization routines

*Lorenzo Candioti*

During this edition of the Hackathon, I was working on viscoplastic regularization into a 2D Stokes solver for deforming viscoelastoplastic materials. The solver is based on the accelerated pseudo-transient method with an implicit time integration. Non-dimensionalization of physical quantities is not required and the algorithm can handle both dimensional and non-dimensional input parameters. One of my main outcomes of Hackathon v7 is the incorporation of stress advection and rotation expressed via the Jaumann stress rate into the standard regularization routine. My aim is to use the developments of this week as a foundation for future software that simulates multi-phase reactive flow within transcrustal magmatic systems.

~~~
<center>
    <img src="../../assets/images/Stokes2D_vevp_Hackv7_LGC.gif" title="Plastic shear bands" alt="Plastic shear bands" width="75%">
</center>
~~~

## Autotunig Pseudo-Transient solvers (dynamic relaxation)

*Thibault Duretz, Arne Spang*

Selecting appropriate iteration parameters in pseudo-transient codes can be challenging, often leading to convergence issues. Ideally, simulations should run smoothly without the need for restarts or manual adjustments of these parameters. Dynamic Relaxation (DR) presents a potential solution to these challenges. This method allows for the automatic computation of both the pseudo-timestep and damping parameters during the iterative solution process.

A brief overview of the DR method was provided, along with a basic script that includes essential steps such as estimating the minimum and maximum eigenvalues and implementing preconditioning. These steps are crucial for enhancing the efficiency and stability of the DR method in numerical simulations.

We successfully incorporated this scheme into an existing pseudo-transient 1D shear heating code which can produce thermal runaway in simple shear. The code uses grid refinement, adaptive (physical) time stepping and a composite visco-elastic rheology with diffusion creep, dislocation creep and low-temperature plasticity. During a simulation, the model changes time steps by about 15 orders of magnitude. Damping parameters and pseudo-time steps are recomputed automatically.

~~~
<center>
    <img src="../../assets/images/1D_DYREL.png" title="1D DYREL" alt="1D DYREL" width="75%">
</center>
~~~

The model starts with elastic loading where deviatoric stress increases linearly. Approaching 1.8 GPa, low-temperature plasticity limits stress and shear heating causes temperature to grow slowly. During these two stages, temperature, velocity, and time step do not change significantly. Around 700 C (t=12 kyr), dislocation creep becomes the dominant deformation mechanism, and thermal runaway starts. This means that deformation self-localizes into a narrow zone which undergoes a huge temperature increase and viscosity decrease, accompanied by an increase in local velocity. All of this warrants a drastic reduction of the physical time step. More on this model in [Spang et al. (2024)](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2024JB028846) 😉

Several challenges remain, such as handling saddle point problems (e.g., Stokes) and multiphysics coupled systems (e.g., two-phase flow), which have yet to be fully addressed through autotuning methods.

## 🚀 Supercharged LaMEM Setup with Julia ✨

*Iskander Ibragimov*

When you're armed with Julia, a MacBook, and an unshakable belief that "parallel = power"... 😎⚙️

🎯 Mission Objective
We wanted to see if Julia could help us level up our LaMEM model setup—especially for those high-resolution 3D monsters that usually make RAM cry and CPUs weep.

🧪 What We Did
Instead of generating the whole model and dumping it into memory like some old-school spaghetti monster, I rewrote the setup to:

🔧 Generate a chunk of the model per MPI rank — right from the get-go.

🔁 Do all the model generation inside a loop, assigning phases and temperature directly per CPU, then save immediately.

🧩 Since we already have the full model info at the start, we just partition it, feed each MPI rank what it needs, and boom—run separately.

💥 What Changed
💡 Marker generation? Now parallelized.

🧠 Memory usage? Way lower.

🖥️ Big models? No problem.

Previously, generating the full model for high-res setups (like 512×512×128) meant you'd need a machine with the memory of a small data center.

And get this—Julia was mysteriously crashing without any error when trying to generate cartdata for models larger than that. Ghost in the machine? 🤖👻

But now...

I can generate and assign everything in parallel on my 8GB RAM MacBook.
Yes, you read that right. Eight. Gigs. 💻💨

🔬 Why It Matters
For high-res 3D LaMEM setups, this is a total game-changer.

We don’t need to keep the full model in memory anymore.

We can now scale setups across thousands of MPI ranks without needing to sacrifice someone's GPU to the memory gods. 🧎‍♂️🔥

🏁 Final Boss Defeated
Before this hackathon:

- ❌ Couldn’t generate 3D setups above 512×512×128
- ❌ Couldn’t scale past 4096 MPI ranks
- ❌ Memory bottlenecks everywhere
- ❌ Julia: "No error, but I'm still quitting 🤷"

After this hackathon:

- ✅ Generating massive models on a laptop
- ✅ All parallel, all fast
- ✅ Ready for production-level madness 💪

💬 TL;DR

Julia + smart MPI rank partitioning + parallel generation = 🚀 rocket fuel for LaMEM setup.
Can confirm: parallelism is the way 🧵🐙

~~~
<center>
    <img src="../../assets/images/64mpi.png" title="64 MPI ranks" alt="64 MPI ranks" width="75%">
</center>
~~~

## Chmy.jl - New docs rendering and distributed fix

*Albert de Montserrat, Ivan Utkin, Ludovic Räss*

[Chmy.jl documentation](https://ptsolvers.github.io/Chmy.jl/dev/) deployed using GitHub Action is now rendering with VitePress available via the [DocumenterVitepress](https://luxdl.github.io/DocumenterVitepress.jl/dev/) package. Minor modifications allow for a nice slick rendering 🚀

CUDA 5.4 improved memory management, better tracking memory allocations (see https://juliagpu.org/post/2024-05-28-cuda_5.4/). One feature introduced would ensure implicit synchronisation removing the burden from the user to care about synchronising data used in multiple tasks (see 2. Using multiple streams), as introduced in [#2335](https://github.com/JuliaGPU/CUDA.jl/pull/2335). In Chmy distributed, we rely on launching boundary conditions and expensive I/O (MPI comm) operations using different tasks as to enable asynchronous GPU execution and e.g. overlap communication with computations. This design was broken as the new feature would lead to serialised execution. Using a new possibility to opt out from implicit sync strategy [#2662](https://github.com/JuliaGPU/CUDA.jl/pull/2662), we could modify Chmy and restore the async behaviour ([#65](https://github.com/PTsolvers/Chmy.jl/pull/65)).
