# SigFigs.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://caseykneale.github.io/SigFigs.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://caseykneale.github.io/SigFigs.jl/dev)
[![Build Status](https://travis-ci.com/caseykneale/SigFigs.jl.svg?branch=master)](https://travis-ci.com/caseykneale/SigFigs.jl)
[![Codecov](https://codecov.io/gh/caseykneale/SigFigs.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/caseykneale/SigFigs.jl)
[![Build Status](https://api.cirrus-ci.com/github/caseykneale/SigFigs.jl.svg)](https://cirrus-ci.com/github/caseykneale/SigFigs.jl)


## Overview
Significant Figures (AKA `SigFigs`) are a mathematical means that ensures that derived values do not possess more information then they *actually* do. Think about it like this:

Say you want to know how large 1/3 of the diameter of a pizza is. You measure this pizza to be 45.72(+/-0.01) cm with a meter stick. So let's do the math
```Julia
julia> 45.72 * (1/3)
15.239999999999998
```
No! Wrong. Nope! How could we possibly say anything about how many micrometers or nanometers the pizza is with our current measuring implement? We can't! *SigFigs.jl what ever shall we do?*

**Bah bah buh bahhhh**
```Julia
using SigFigs
julia> SigFigs.significantfigures( SigFig(45.72, 4) * (1/3) )
15.24
```

*Oh whew* - all is well with the universe. Thanks SigFigs.jl!

## Functionality
Basic operations with `SigFigs` instances (+,-,\*,\/,\%, cos, sin, asin, exp, log, sqrt, etc) and some collections (transpose, matrix multiply, etc) are currently supported. You likely will find rough patches. Report any bugs, unexpected behaviours, etc.

## Is this the right tool for you?
I facetiously posted an announcement of this package in Julia Slack. Let's be honest this is a pretty underwhelming contribution. Someone replied, something to the effect of "Doesn't [Measurements.jl](https://github.com/JuliaPhysics/Measurements.jl) already do this?", and offered the following snippit of code:
``` Julia
using Measurements
julia> (45.72 ± 0.01) * (1/3)
15.24 ± 0.0033
```

So I must say, as I always do, I love [Measurements.jl](https://github.com/JuliaPhysics/Measurements.jl)! And yes, it will give the proper significant figures for most linear operations of a `Measurements` instance if the uncertainties are known. But, there are MANY cases where an uncertainty is not known, or requires tremendous amount of work to even ballpark estimate. Similarly, there are many cases where running Measurements.jl has a significant over-head. In those cases it may be preferred to only bother with the significant figures of a calculation. So its a pragmatic way of handling certain calculations without going deep into the weeds. If the order of magnitude estimate is off from a desired application, was it really worth tabulating all of the uncertainties in a complicated process?
