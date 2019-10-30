function count_outcomes(data, sides)

    counts = zeros(Int, sides)

    for result in data
        counts[result] += 1
    end

    return counts
end
###


bar(counts ./ N, leg=false)
hline!( [1/6], ls=:dash, lw=2)   # horizontal line
###


n1(N) = count( rand(1:6) == 1 for i in 1:N )   # or count
###


N = 1000  # number of die rolls
num_experiments = 10000

# repeat experiment:
n1_data = [n1(N) for i in 1:num_experiments]

counts = count_outcomes(n1_data, N)
# better to use a Dict?

bar(counts)
###


mean(data) = sum(data) / length(data)

m = sum(n1_data) / length(n1_data)

###


bar(counts)
vline!([m], c=:red, lw=2, ls=:dash)  # vertical line
###


n1_centered = n1_data .- m

bar(count_outcomes(n1_centered, N))
vline!([0], c=:red, lw=2, ls=:dash)
###


    mean(n1_centered)
###



spread = mean(abs.(n1_centered))   # no standard name?

variance = mean(n1_centered .^ 2)
σ = √variance

@show spread, variance
###


bar(countmap(n1_centered))
vline!([-σ, σ], c=:red, lw=2, ls=:dash)
vline!([-2σ, 2σ], c=:green, lw=2, ls=:dash)
###



count(-2σ .< n1_centered .< 2σ) / length(n1_centered)
###


r = rand(Bool)
Int(r)   # convert to integer
###


function walk(N)
    x = 0     # initial position
    positions = [x]  # store the positions

    for i in 1:N
        x += jump()
        push!(positions, x)
    end

    return positions
end
###


using Interact

N = 100
positions = walk(N)

@manipulate for n in 1:N
    plot(positions[1:n], xlim=(0, N), ylim=(-20, 20), m=:o, ms=1)
end
###


p = plot(leg=false)  # empty plot
N = 100

for i in 1:10    # number of walks
    plot!(walk(N))
end

p  # or plot!()
###


jump() = rand( (-1, +1) )

walk_position(N) = sum(jump() for i in 1:N)
###


