"""
    findin(subset, set)

Return the indices of the elements of `subset` in `set`. `ArgumentError` is thrown if
`subset` is not a subset of `set`.

# Related PR and issues

- <https://github.com/JuliaLang/julia/pull/24673>
- <https://github.com/JuliaLang/julia/issues/30368>

"""
#=
function findin(subset::AbstractUnitRange, collection::AbstractUnitRange)
    start = findfirst(isequal(first(subset)), collection)
    isnothing(start) && return nothing

    stop = findfirst(isequal(last(subset)), collection)
    isnothing(stop) && return nothing

    promote_type(typeof(subset), typeof(collection))(start, stop)
end
=#
function findin(subset::AbstractUnitRange, set::AbstractUnitRange)
    !issubset(subset, set) &&
        throw(ArgumentError("Not a subset"))

    start = (first(subset) - first(set)) + firstindex(set)
    stop = (last(subset) - first(set)) + firstindex(set)

    promote_type(typeof(subset), typeof(set))(start, stop)
end
