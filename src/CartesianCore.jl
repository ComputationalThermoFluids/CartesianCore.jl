module CartesianCore

using Base.Iterators
using LinearAlgebra
using SparseArrays
using Accessors

import Base: OneTo, empty, kron
import Base.Iterators: drop, take

export findrange
export Lattice, Infinite, infinite, Finite, finite, Periodic, periodic
export isperiodic
export hasborder, dropborder, takeborder
export starmatrix

include("utils.jl")
include("iterators.jl")
include("lattice.jl")
include("border.jl")
include("stencil.jl")

end
