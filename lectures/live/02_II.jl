x0 = 20.0 # initial population
λ = 1.2 # type as \lambda<TAB>
N = 20 # final time

x = Dict(0 => x0) # empty (untyped) dictionary

for n = 1:N    # 1:N is a Range object
    x[n+1] = λ * x[n]
end

for n = 0:N    # 1:N is a Range object
    x[n+1] = λ * x[n]
    @show x
end


zeros(10)


x = zeros(N+1) # Vector of zeros
x[1] = x0

for n in 1:N
    x[n+1] = λ * x[n]
end


x = [x0]




x = x0 # current value
xs = [x0] # initialize Vector with initial value
for n in 1:N
    next_x = λ * x
    push!(xs, next_x)

    global x = next_x

end

x

xs








x

x'

x′ = λ * x


f(λ) = x -> λ * x

f3 = f(3)

f3(10)


using Pkg

Pkg.add("Plots")


using Plots

plot()

xs

scatter(xs)

d = Dict(1 => 3, 2=>4, 3=>-1)

scatter(d)

bar(d)

scatter(xs)

plot(xs, m=:o)
p = plot(xs, m=:x, label="population", leg=:topleft)
xlabel!(p, "time n")
ylabel!(p, "pop x_n")}

p


function growth(λ, x0, N)
    x = zeros(N + 1)
    x[1] = x0
    for n = 1:N
        x[n+1] = λ * x[n]
    end
    return x
end

xs = growth(2, 10, 100)
scatter(xs)

xs = growth(3, 5, 209)
scatter(xs)


using Interact

@manipulate for i in 1:10, j in 3:7
    i^2 * j
end


@manipulate for λ in 0:0.01:3, x0 in 1:10, N in 1:100
    xs = growth(λ, x0, N)
    scatter(xs, ylim=(0, 20))
end


growth(; λ, x0, N) = growth(λ, x0, N)

methods(growth)

growth(; λ=1.1, x0=20.0, N=10) = growth(λ, x0, N)

methods(growth)

growth(x0=100.0)

growth(N=1000)

growth(λ=3, N=1000)
