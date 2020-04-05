# SigFigs

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://caseykneale.github.io/SigFigs.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://caseykneale.github.io/SigFigs.jl/dev)
[![Build Status](https://travis-ci.com/caseykneale/SigFigs.jl.svg?branch=master)](https://travis-ci.com/caseykneale/SigFigs.jl)
[![Codecov](https://codecov.io/gh/caseykneale/SigFigs.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/caseykneale/SigFigs.jl)
[![Build Status](https://api.cirrus-ci.com/github/caseykneale/SigFigs.jl.svg)](https://cirrus-ci.com/github/caseykneale/SigFigs.jl)


# Overview
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

# Caveats
Basic operations with `SigFigs` instances (+,-,\*,\/,\%, cos, sin, asin, exp, log, etc) and some collections (transpose, matrix multiply, etc) are currently supported. You likely will find rough patches. Report any bugs, unexpected behaviours, etc.
