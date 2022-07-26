module CartesianCore

using Base.Iterators
using Accessors

import Base: OneTo, empty
import Base.Iterators: drop, take

export findin
export Lattice, Infinite, infinite, Finite, finite, Periodic, periodic
export isperiodic
export hasborder, dropborder, takeborder

include("utils.jl")
include("iterators.jl")
include("lattice.jl")
include("border.jl")

end
