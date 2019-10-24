function f(x)
    x += 1
    x *= 2
    return x
end

function g(x)
    x += 1
    x = f(x)
    return nothing
end

x = 10

g(x)

h(x) = println("hello")

y = h(10)

y

y == nothing


fact(n) = (n ≤ 1) ? 1 : ( n * fact(n-1) )

fact(10)

factorials = [fact(n) for n in 1:20]

factorials = [fact(n) for n in 1:21]


y = fact(20)

typeof(y)

typemax(Int64)

fact(big(21))

z = big(21)

typeof(z)

@time fact(20)
@time fact(big(20))

@time fact(100)
@time fact(big(100))

2^2^2^2^2

big(2)^2^2^2^2

z = big(10)

z = 0


function towers(n, from, to, spare)
    n == 1 && return [ (from, to) ]
    return vcat(towers(n-1, from, spare, to),
        towers(1, from, to, spare),
        towers(n-1, spare, to, from) )

end

towers(4, 1, 2, 3)
towers(5, 1, 2, 3)

towers(n) = towers(n, 1, 2, 3)

towers

towers(5)
towers(5, 3, 2, 1)

v = [1, 2, 3]
w = [4, 5, 6]

vcat(v, w)

[v; w]


struct Fraction
    num::Int
    denom::Int
end

Base.show(io::IO, x::Fraction) = print(io, x.num, " // ", x.denom)   # IO is an "input-output stream"

x = Fraction(3, 4)

x * x

import Base: *

*(a::Fraction, b::Fraction) = Fraction(a.num * b.num,
                                        a.denom * b.denom)

x * x

@which x * x
@edit x * x

x

x * 2

*(a::Fraction, b::Int) =  Fraction(a.num * b, a.denom)

x * 2

2 * x

*(a::Int, b::Fraction) =  b * a

*(a::Fraction, b::Int) =  a * Fraction(b, 1)

x = 2

3x

3.1x

y = 3

yx

x = Fraction(3, 4)

3x


f(x) = 3x

@code_lowered f(10)

@code_typed optimize=false f(10)

f(10)

f(2.5)

@code_typed optimize=false f(2.5)

@code_native f(10)
