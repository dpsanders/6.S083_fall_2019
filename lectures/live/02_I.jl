x0 = 20.0 # initial population
λ = 1.2 # type as \lambda<TAB>
N = 20 # final time

x = Dict(0 => x0)

for n in 1:N # 1:N is a Range object
    x[n+1] = λ * x[n]   # error!
end

x = Dict(0 => x0)

for n in 0:N # 1:N is a Range object
    x[n+1] = λ * x[n]   # error!
    @show x
end



x = zeros(N+1) # Vector of zeros
x[1] = x0

for n in 1:N
    x[n+1] = λ * x[n]
end


# grow a Vector:
x = [x0]
typeof(x)

for n in 1:N
    x[n+1] = λ * x[n]
end


xs = [x0]
current_x = x0

for i in 1:N
    next_x = λ * current_x
    push!(xs, next_x)

    global current_x = next_x
end

xs

x'  # NO!

x′ = λ * x


f(λ) = x -> λ * x   # a function that returns a function!!!

ff = f(3)

ff(10)

function hello(a)

    function hello2(x)
        return a*x
    end

    return hello2
end

hello(3)


using Pkg

Pkg.add("Plots")

plot()

using Plots

plot()

xs

p = scatter(xs, label="population", leg=:topleft)
xlabel!(p, "time n")
ylabel!(p, "x_n")

p



function growth(λ, x0, N)
    x = zeros(N+1)
    x[1] = x0
    for n in 1:N
        x[n+1] = λ * x[n]
    end
    return x
end

data = growth(1.2, 20, 100)
scatter(data)

data = growth(1.2, 30, 100)
scatter(data)


using Interact
@manipulate for λ in 0:0.01:3, x0 in 1:10
    data = growth(λ, x0, 20)
    scatter(data, ylim=(0, 10))
end
