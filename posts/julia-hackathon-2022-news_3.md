+++
using Dates

title = "Julia hackathon 2022 - GeoParams.jl and more"
date = Date(2022, 4, 11)
reading_time = "4-minute read"

tags = ["activities", "julia", "coding"]
+++

We held our first Hackathon on April 4-8 in Schwarzwald, focussing on a wide range of Julia topics. For some of us this was one of the first encounters with Julia, whereas others had some more experience with this. Invaluable was the advice of Valentin Churavy, who joined us from the MIT JuliaLab.

## GeoParams.jl
*Boris Kaus & Albert de Montserrat*

One of the time-consuming parts of writing a new code for geodynamic applications is implementing the material parameters and creep-laws right, as well as performing the proper non-dimensionalization. Most of these parameters are computed in a *point-wise* manner and the required calculations are thus the same for a finite element, finite difference or AMR approach. Moreover, experience showed us that the specific details of the implementations of, for example, creep laws is very error-prone and many published papers contain typos.   

The idea of the [GeoParams.jl](https://github.com/JuliaGeodynamics/GeoParams.jl) package is to help with this by implementing such point-wise calculations in a single package. This is not only a database of parameters, but thanks to the overall efficiency of julia, we can also directly use the same routines in actual solvers (which can either be a pseudo-transient solver, or an implicit code). A significant advantage of this is that if new rheologies or density parameterisations are implemented in GeoParams they will immediately be available to a whole range of codes rather than being something that has to be implemented in every code individually.

A first example script where this is being used is in an example of the [MagmaThermoKinematics](https://github.com/boriskaus/MagmaThermoKinematics.jl/blob/main/examples/Example2D_paper.jl) package. 

A challenge is that the computational routines should be non-allocating and produce little overhead as pseudo-transient solvers need to call this at every iteration step. Moreover, whereas some material parameters require only a single additional field (temperature-dependent density, for example, only requires `T`), whereas others require more (if density is computed from a phase diagram, we need both pressure and temperature, for example).
During the hackaton Albert worked on a way to pass an arbitrary number of fields to the computational routines. This [Pull Request](https://github.com/JuliaGeodynamics/GeoParams.jl/pull/8) was the result.

There were also many discussions between Thibault, Daniel, Boris and Albert on how to best define combined creep laws (e.g, viscoelasticity, or combined diffusion and dislocation creep laws), and a few test scenarios were developed that will ultimately find its way in the package. Stay tuned!


## GeophysicalModelGenerator
*Boris Kaus, Christian Schuler, Lucas Moser*

As a result of recent changes to make the `GeoParam` package type-stable, the `GeoUnit` was redefined which required an update of the [GeophysicalModelGenerator](https://github.com/JuliaGeodynamics/GeophysicalModelGenerator.jl) package. Version 0.4.0 was the result.

Christian started looking into how to combine `GMG` with MPI, as very large scale setups cannot be created on a single core but must be created in parallel. Whereas this will require more work, it seems feasible.

Lucas Moser has been working on a python interface for [geomIO](https://github.com/JuliaGeodynamics/geomIO), which is a package that allows one to draw setups in a vector graphics program (like Inkscape). Whereas the initial version was purely in python, we are ofcourse interested to create a julia version of this as well such that it can ultimately be used along with `GMG`.  


## MAGEMin.jl
*Nicolas Riel & Boris Kaus*
[MAGEMin](https://github.com/ComputationalThermodynamics/MAGEMin) is a new parallel thermodynamics solver package developed by Nicolas Riel & Boris Kaus which is  more efficient than existing approaches. The manuscript on the approach was submitted a few weeks ago and an initial version of the code along with a graphical user interface was released along side it. We initially developed this as a C-package and but provide precompiled BinaryBuilder versions (along with a julia interface that will be released in version 1.1 of the code) to make it work on most systems that geoscientists use. In the initial versio of the package, we also hardcoded a single thermodynamic database (that can simulate the fractional crystallisation of a hydrous mafic melt, which is known to be one of the more tricky problems to solve). 

Yet, the MAGEMin approach is fully general and should in principle work with any database.
A challenge, though, is to bring the wide variety of extisting databases into one code (as many use qute different descriptions). As julia already has a nice ecosystem it is worth looking into whether that can be used. During the Hackathon, Nico and Boris worked on combining the [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl) computer algebra package, with a minimum working example that includes some of the key features used in MAGEMin. Quite a bit of work remains to be done before we can estimate how the speed of the julia version compares to our C-package but initial results are promising.


# PETSc.jl
*Nicolas Berlie & Patrick Sanan*

[PETSc.jl](https://github.com/JuliaParallel/PETSc.jl) is the main julia interface to PETSc. Whereas the package itself has been around for some time, it was unmaintained for quite some time until Jeremy Kozdon, Nico Berlie and Boris Kaus had a go at it in summer 2021. Nico and Boris were mostly interested in getting DMSTAG up & running, whereas Jeremy did a fantastic job at providing automatic wrappers for the full package and at generating more julia-style interfaces for many of the routines. It turns out that we can combined many of the cool features of julia, such as automatic differentiation or visualisation, with the parallelism of PETSc. As result, writing new codes is easier and requires less lines than  doing the equivalent in C. 

Unfortunately, time ran out after september 2021, and much of the progress (including the automatic Clang wrappers)  was hanging in the branches `/jek/gen` and `jek/dmstag`. 

During the hackaton, Nico and Patrick continued the work on the `dmstag` branch and improved documentation and added more functionality. Their work-in-progress can be seen [here](https://github.com/nicoberlie/PETSc.jl/tree/jek/dmstag) and the idea is to finish this and ultimately make this the new main branch of PETSc.jl.
