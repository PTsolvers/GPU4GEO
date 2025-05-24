+++
header = "∂GPU4GEO"
+++

Computational Earth Science relies on modelling to understand complex physical systems which cannot be directly observed and where data availability is sparse. Two domains where this is particularly important are geodynamics, concerned with the long-term dynamics of rocky planets like the Earth, and ice sheet dynamics, studying the dynamics of large ice sheets.

Despite their apparent differences, the physical models and ensuing computational challenges in these two domains are very similar. Both domains require extremely large simulations which require next-generation HPC machines, and would also benefit from constraining models using available data in an automated fashion.

> With [∂GPU4GEO](https://pasc-ch.org/projects/2025-2028/gpu4geo-differentiable-multi-physics-solvers-for-extreme-scale-geophysics-simulations-on-gpus/index.html) we seek at developing differentiable multi-physics solvers for extreme-scale geophysics simulations on GPUs, building on the successful development from the GPU4GEO project.

Here, we focus on large-scale differentiable modelling of Earth’s largest ice sheets and on a range of applications of high-resolution 3D geodynamic models of magmatic systems and of the formation of the Alps.

~~~
<center>
    <img src="../../assets/images/dgpu4geo.png" alt="GPU4GEO overview" width="700">
    <br>
    <i>Graphical abstract of ∂GPU4GEO.</i>
</center>
~~~

With [∂GPU4GEO](https://pasc-ch.org/projects/2025-2028/gpu4geo-differentiable-multi-physics-solvers-for-extreme-scale-geophysics-simulations-on-gpus/index.html), we aim to develop differentiable multi-physics solvers for extreme-scale geophysics simulations on GPUs. Such high-performance scalable software for scientific computing will use advanced programming techniques, specifically focusing on automatic differentiation (AD) with the [Julia programming language](https://julialang.org).

PIs have developed an AD tool called Enzyme, which performs automatic differentiation within the LLVM compiler. This enables derivatives to be combined with compiler optimisation, resulting in dramatic speedups when computing derivatives in reverse-mode, often achieving theoretical peak performance. We will extend the solvers we developed during the 2021 – 2025 GPU4GEO PASC project by adding support for differentiable modelling. We will leverage [Enzyme.jl](https://github.com/EnzymeAD/Enzyme.jl) to enable high-performance AD on GPUs at extreme scale.

We propose to further develop the highly modular GPU4GEO software stack. Distinct Julia software packages, which provide solvers for different physical systems of interest, easy to customise building blocks, and tools for common subroutines, interplay at a high-level allowing for efficient further development. We will engineer the Enzyme.jl support in the entire stack in order to enable AD and allow for differentiable modelling. These new advances will leverage the existing backend abstraction features and enable high-performance AD on GPUs and build upon the MPI support for distributed-memory parallelism for scalability on flagship supercomputers.

We use the Julia language because, amongst other, we can draw on existing, high-performance Julia implementations; Julia’s high-level abstraction and multiple dispatch capabilities make it amenable to portability between backends (e.g. multicore CPUs and AMD, NVIDIA, and upcoming GPUs); and Julia overcomes the two-language barrier increasing productivity, performance and (performance-) portability.

This collaborative project proposes a broad set of applications, including plans for very large simulations, with computational tools extremely well-suited to answer pressing scientific questions using next-generation GPU-accelerated architectures. It will strengthen Julia’s place in the HPC ecosystem, leveraging CSCS’s next-generation GPU-based systems, AMD GPUs and NVIDIA GH200 superchip, interactive HPC, and high-productivity development. It will provide tools of use to a wide scientific community, and simulations which will demonstrate their effectiveness at scale, with simulations of interest to both experts and the broader scientific community and general public.

### Funding and collaborations

The project, funded by the [PASC](https://pasc-ch.org) and the [Swiss National Supercomputing Centre - CSCS](https://www.cscs.ch) part of [ETH Zurich](https://ethz.ch/en.html), is an international collaboration between:
- [Geocomputing Centre](https://unil-sgc.github.io) @Unil
- [Geodynamics](https://www.geosciences.uni-mainz.de/geophysics-and-geodynamics/team/univ-prof-dr-boris-kaus/) @JGU Mainz
- [GFD](https://gfd.ethz.ch) @ETH Zurich
- [PRONTO Lab](https://wsmoses.com) @UIUC
- [Tectonics & Geodynamics](https://wp.unil.ch/tectonics/) @Unil
- [VAW-Glaciology](https://vaw.ethz.ch/en/research/glaciology.html) @ETH Zurich
- [Geodynamics Modelling](https://sites.google.com/site/thibaultduretz/) @ Goethe Uni Frankfurt
- [High-Performance Scientific Computing](https://www.uni-augsburg.de/en/fakultaet/mntf/math/prof/hpsc/) @Uni Augsburg
- [Numerical Mathematics](https://ranocha.de) @JGU Mainz
- [CSCS](https://www.cscs.ch) @ETH Zurich
