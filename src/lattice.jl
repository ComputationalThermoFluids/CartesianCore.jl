abstract type Lattice end

struct Infinite <: Lattice end
struct Finite <: Lattice end
struct Periodic <: Lattice end

const infinite = Infinite()
const finite = Finite()
const periodic = Periodic()

isperiodic(::Lattice) = false
isperiodic(::Periodic) = true
