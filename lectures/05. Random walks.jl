using Unitful, Unitful.DefaultSymbols
ratio = 1s / 1μs
Unitful.dimension(ratio). # NoDims
upreferred(ratio)   # convert to SI units
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



using StatsBase

T = 10
N = 100

data = [walk_position(T) for i in 1:N]

counts = countmap(data)
ks = sort(collect(keys(counts)))

bar(ks, [counts[k] for k in ks])

###


function move!(walkers, i)
    walkers[i] += jump()
end
###


function move!(walkers)
    for i in 1:length(walkers)
        move!(walkers, i)
    end
end
###


continuous_jump() = rand() - 0.5
###


function walk(jump, N)
    x = 0
    positions = [x]

    for i in 1:N
        x += jump()   # now calls custom jump function
        push!(positions, x)
    end

    return positions
end
###


abstract type Walker end

mutable struct DiscreteWalker <: Walker   # subtype
    x::Int
end

mutable struct ContinuousWalker <: Walker
    x::Float64
end

position(w::Walker) = w.x
setposition!(w::Walker, x) = w.x = x
###


jump(w::DiscreteWalker) = rand( (-1, +1) )
jump(w::ContinuousWalker) = rand() - 0.5
###


function walk!(w::Walker, N)   # modifies its argument
    positions = [position(w)]

    for i in 1:N
        x = position(w)
        new_x = x + jump(w)

        set_position!(w, new_x)   # now calls custom jump function
        push!(positions, new_x)
    end

    return positions
end
###


d = DiscreteWalker(0)
c = ContinuousWalker(0.0)

pos1 = walk(d, 10)
pos2 = walk(c, 10)
###


num_walkers = 100
walkers = zeros(Int, num_walkers)
###


