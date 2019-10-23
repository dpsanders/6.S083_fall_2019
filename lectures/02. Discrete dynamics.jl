x0 = 20.0  # initial population
λ = 1.2    # type as \lambda<TAB>
N = 20     # final time

x = Dict(0 => x0)  # empty (untyped) dictionary

for n in 1:N    # 1:N is a Range object
    x[n+1] = λ * x[n]
end
###


x = zeros(N+1)  # Vector of zeros
x[1] = x0

for n in 2:N+1
    x[n+1] = λ * x[n]
end
###


x -> 2x
###


using Pkg
Pkg.add("Plots")
###


]add Plots
###


using Plots
###


scatter(x)
###


growth(1.2, 10.0, 10)
growth(2.0, 10.0, 10)
###


growth(; λ=1.1, x0=20.0, N=10) = growth(λ, x0, N)
###


growth(N=20)
###


growth(N=20, x0=1.0)
###


methods(growth)
###


@manipulate for i in 1:10
    i^2
end
###


using Interact
@manipulate for a in 0:10, b in 1:11
    HTML( (a, b) )   # use HTML representation of output
end
###


x = x0      # current value
xs = [x0]   # initialize Vector with initial value

for n in 1:N
    next_x = λ * x
    push!(xs, next_x)

    x = next_x
end
###


"""
Simulate growth with rate `λ`, initial value `x0` and time `N`.
"""
function growth(λ, x0, N)

    x = zeros(N+1)
    x[1] = x0

    for n in 1:N
        x[n+1] = λ * x[n]
    end

    return x
end
###


