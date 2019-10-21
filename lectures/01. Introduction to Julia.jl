pi = 355/113
radius = 2.2
area = pi*(radius**2)
circumference = pi*(radius*2)
###


r = 2.2   # \scrr<TAB> for italic `r`
area = π * r^2   # \pi<TAB>   # ^ for powers
circumference = π * (2r)   # implicit multiplication
###


@show π
###


x = 3
@show typeof(x)   # Int64

y = -3.1   # Float64
@show typeof(y)

s = "6.S083"  # String
###


"3" * "3"
###


area(r) = π * r^2

A = area(1.0)
###


"""Calculate area of circle of radius `r`."""
function area(r)
    A = π * r^2    function
    return A
end

r = 1.0
A = area(r)  #
###


a = 5

if a < 4
    s = "small"

elseif a < 6
    s = "medium"

else
    s = "large"
end

s
###


x = 0.0

for i in 1:10
    global x += 0.1    # `global` not needed inside a function
    @show x    # prefer @show instead of print
end

x, (x == 1.0)

###


  return n * fact2(n-1)
###


fact(10), fact2(10)
###


factorials = [fact(n) for n in 1:21]
###


fact(big(30))
###


function towers(n, from, to, spare)
    n == 1 && return [ (from, to) ]

    return vcat(towers(n-1, from, spare, to),
                towers(1, from, to, spare),
                towers(n-1, spare, to, from) )
end

towers(4, 1, 2, 3)
###


struct CoordinatePair
    x::Float64
    y::Float64
end
###


o = CoordinatePair(0, 0)
x = CoordinatePair(1, 2)
###


distance(a::CoordinatePair, b::CoordinatePair) = √ ( (a.x - b.x)^2 + (a.y - b.y)^2 )

distance(o, x)
###


origin() = CoordinatePair()

distance(a::CoordinatePair) = distance(origin(), a)

distance(x)
###


struct Fraction
    num::Int
    denom::Int
end

Base.show(io::IO, x::Fraction) = print(io, x.num, " // ", x.denom)

x = Fraction(3, 4)

###


import Base: *

*(x::Fraction, y::Fraction) = Fraction(x.num * y.num, x.denom * y.denom)

x = Fraction(3, 4)
y = Fraction(6, 5)

x * y   # result not in lowest terms
###


*(x, y)
###


methods(*)
###


Fraction(3, 4) * 1
###


*(x::Fraction, y::Int) = x * Fraction(y, 1)
Fraction(3, 4) * 1
###


*(x::Fraction, y::Int) = Fraction(x.num * y, x.denom)
###


@which sin(3.1)

@edit sin(3.1)
###


function square_root(n)
    found = 0

    for i in 1:n
        if i^2 ≥ abs(n)   # \ge<TAB> or >=
            found = i    # i doesn't exist outside loop
            break
        end
    end

    if found^2 == n
        return (found, :exact)
    else
        return (found, :not_exact)
    end
end

square_root(10), square_root(9)
###


bitstring(0.1)
###


f(x) = 3x

@code_lowered f(3)
@code_typed optimize=false f(3)
@code_typed f(3)
@code_llvm optimize=false f(3)
@code_llvm f(3)
@code_native f(3)
###


