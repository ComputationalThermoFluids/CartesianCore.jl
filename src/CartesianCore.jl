module CartesianCore

using Base.Iterators
using Accessors

import Base: OneTo, empty
import Base.Iterators: drop, take

export Lattice, Infinite, infinite, Finite, finite, Periodic, periodic
export isperiodic
export hasborder, dropborder, takeborder

include("iterators.jl")
include("lattice.jl")
include("border.jl")

end
