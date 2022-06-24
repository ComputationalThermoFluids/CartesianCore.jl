hasborder(::Lattice) = true
hasborder(::Infinite) = false

dropborder(::typeof(-), iters, lattices, d, n=1) =
    ifelse(hasborder(lattices[d]),
           @set(iters[d] = drop(iters[d], n)),
           iters)
dropborder(::typeof(+), iters, lattices, d, n=1) =
    ifelse(hasborder(lattices[d]),
           @set(iters[d] = take(iters[d], length(iters[d])-n)),
           iters)

takeborder(::typeof(-), iters, lattices, d, n=1) =
    ifelse(hasborder(lattices[d]),
           @set(iters[d] = take(iters[d], n)),
           @set(iters[d] = empty(iters[d])))
takeborder(::typeof(+), iters, lattices, d, n=1) =
    ifelse(hasborder(lattices[d]),
           @set(iters[d] = drop(iters[d], length(iters[d])-n)),
           @set(iters[d] = empty(iters[d])))
