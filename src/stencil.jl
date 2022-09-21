function tridiagonal(n, ::Type{T}, f) where {T}
    coefs = Dict{typeof(n),T}(-1 => -one(T), 0 => 2one(T), 1 => -one(T))
    diags = Dict{typeof(n),Vector{T}}()

    for d in -1:1
        diags[d] = coefs[d] * f(T, n-abs(d))
    end

    spdiagm(diags...)
end

"""

This construction is used instead of a not all heptadiagonal matrices
are star stencil matrices, because some coefficients need to be set
explicitly to zero.

"""
kron(eyes::NTuple{3}, ops::NTuple{3}) =
    kron(eyes[3], eyes[2], ops[1]) +
    kron(eyes[3], ops[2], eyes[1]) +
    kron(ops[3], eyes[2], eyes[1])

"""
    star(dec, T)

Creates a sparse matrix that follows star stencil
of unit width filled with random coefficients.

"""
function starmatrix(n, ::Type{T}=Float64, f=ones) where {T}
    ops = tridiagonal.(n, Ref(T), f)
    eyes = I.(n)

    kron(eyes, ops)
end
