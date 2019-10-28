function iterate_cos(x0, N)
    xs = [x0]
    x = x0

    for n = 1:N
        x = cos(x)
        push!(xs, x)
    end

    return xs
end
###


const a = UInt(6364136223846793005)  # unsigned integer
const b = UInt(1442695040888963407)

my_rand_int(x) = a*x + b

x = UInt(3)
for i in 1:10
    global x = myrandint(x)
    y = x / typemax(UInt)  # convert to interval [0, 1)
    @show y
end

###


X = 1:6
typeof(X)
###


Array(X)   # make into array to see what's inside

collect(X)  # alternative
###


rand(X)
###


import Random
global_rng = copy(Random.GLOBAL_RNG)

@show rand()
@show rand()

@show rand(global_rng)
@show rand(global_rng)
###



roll_die(n) = rand(1:n)  # roll an n-sided die

N = 100

sides = 6
data = [roll_die(sides) for i in 1:N]

counts = zeros(Int, sides)

for result in data
    counts[result] += 1
end

counts
###


using Plots

bar(counts, leg=false)
###


bar(counts ./ N, leg=false)
hline!( [1/6], ls=:dash, lw=2)   # horizontal line
###


N = 1000  # number of die rolls
num_experiments = 10000

# repeat experiment:
n1_data = [n1(N) for i in 1:num_experiments]

using StatsBase
counts = countmap(n1_data)

bar(counts)
###


m = sum(n1_data) / length(n1_data)   # or mean(n1_data)
###


bar(counts)
vline!([m], c=:red, lw=2, ls=:dash)
###


n1_centered = n1_data .- m

bar(countmap(n1_centered))
vline!([0], c=:red, lw=2, ls=:dash)
###


spread = mean(abs.(n1_centered))

variance = mean(n1_centered.^2 )
σ = √variance

@show spread, variance
###


bar(countmap(n1_centered))
vline!([-σ, σ], c=:red, lw=2, ls=:dash)
vline!([-2σ, 2σ], c=:green, lw=2, ls=:dash)
###


    mean(n1_centered)
###



count(-2σ .< n1_centered .< 2σ) / length(n1_centered)
###


