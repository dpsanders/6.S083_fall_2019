if a < 0
    return true
else
    return false
end
###


struct Dual
    value::Float64
    deriv::Float64
end

f = Dual(3, 4)
###


val(f::Dual) = f.value
der(f::Dual) = f.deriv
###


import Base: *

*(f::Dual, g::Dual) = Dual(val(f) * val(g),
                           val(f) * der(g), der(f) * val(g))
###


Base.sin(f::Dual) = Dual(sin(val(f)),
                         cos(val(f)) * der(f))
###


function newton(f, f′, x0, N=20)
    x = x0
    xs = [x0]

    for i in 1:N
        x = x - f(x) / f′(x)
        push!(xs, x)
    end

    return xs
end
###


x = A \ b
###


