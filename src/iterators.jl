empty(iter::OneTo) = typeof(iter)(zero(eltype(iter)))
empty(iter::AbstractUnitRange) = range(first(iter), length=zero(eltype(iter)))
empty(iter::AbstractRange) = range(first(iter), step=step(iter), length=zero(eltype(iter)))

take(iter::OneTo, n::Integer) = typeof(iter)(min(length(iter), n))
take(iter::AbstractUnitRange, n::Integer) =
    range(first(iter), length=min(length(iter), n))
take(iter::AbstractRange, n::Integer) =
    range(first(iter), length=min(length(iter), n), step=step(iter))

function drop(iter::AbstractUnitRange, n::Integer)
    n ≥ length(iter) && return empty(iter)
    range(getindex(iter, n+1), length=length(iter)-n)
end
function drop(iter::AbstractRange, n::Integer)
    n ≥ length(iter) && return empty(iter)
    range(getindex(iter, n+1), length=length(iter)-n, step=step(iter))
end
