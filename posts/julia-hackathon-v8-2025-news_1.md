+++
using Dates

title = "Julia hackathon v8.0 2025 - Outcome"
date = Date(2025, 12, 01)
reading_time = "3-minutes read"

tags = ["activities", "julia", "coding"]
+++

\toc

We held our seventh (8th!) GPU4GEO Julia hackathon on November 24-28, 2025 in Black Forest (DE), focussing on a wide range of Julia topics. Hereafter a glimpse into the progress made by some participants on various Julia-related projects and some visual impressions...

...but first a glimpse into
~~~
<center>
    <img src="../../assets/images/hack8_1.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_2.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_7.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_4.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_5.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_6.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_3.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_8.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
    <img src="../../assets/images/hack8_9.jpg" title="Hackathon v8 impressions" alt="Hackathon v8 impressions" width="25%">
</center>
~~~
the hackathon's daily routine.

## Heat conduction and LaMEM.jl

*Jana David*

Following up on work started during the Hackathon v7 in April 2025, I worked on experimental simulations using [LaMEM.jl](https://github.com/JuliaGeodynamics/LaMEM.jl). Now, for my Master’s thesis, I am studying heat diffusion codes using the pseudo-transient solution method to leverage GPU acceleration.

~~~
<center>
    <img src="../../assets/images/h8_jd_temp.png" title="Heat diffusion" alt="Heat diffusion" width="28.6%">
    <img src="../../assets/images/h8_jd_heat.gif" title="Heat diffusion" alt="Heat diffusion" width="35%">
</center>
~~~

Thanks to valuable feedback, I gained a better understanding of [Chmy.jl](https://github.com/PTsolvers/Chmy.jl), a package designed for discretising and prototyping transient (heat conduction) problems using an iterative finite-difference schemes. That is initially challenging for beginners, but with practice it enables rapid experimentation with boundary conditions, time-stepping strategies, and spatial discretisation without requiring deep expertise in low-level code optimisation. I took the opportunity to engage directly with the developers of the packages I use daily. I hope future Master’s students will have similar opportunities to connect with the modelling community and enrich their research.

## Project

*author*

What we worked on
