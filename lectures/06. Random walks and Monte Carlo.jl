mutable struct SimpleWalker
    x::Int
end
###


methods(SimpleWalker)
###


d = SimpleWalker(0)

typeof(d)
###


d.x
###


function pos(d::SimpleWalker)
    return d.x
end

pos(d)

###


pos(d::SimpleWalker) = d.x
###


function jump!(w::SimpleWalker)
    w.x += rand( (-1, +1) )   # modifies w.x
end

jump!(d)

@show d
###


function walk!(w::SimpleWalker, N)
    positions = [pos(w)]

    for i in 1:N
        jump!(w)
        push!(positions, pos(w))
    end

    return positions
end
###


abstract type end Walker
###


mutable struct DiscreteWalker <: Walker
    x::Int
end

mutable struct ContinuousWalker <: Walker
    x::Float64
end
###


d = DiscreteWalker(0)
c = ContinuousWalker(0.0)
###


pos(w::Walker) = w.x   # works for *any* Walker!
###


jump!(w::DiscreteWalker) = w.x += rand( (-1, +1) )
jump!(w::ContinuousWalker) = w.x += rand() - 0.5

jump!(c)
pos(c)

jump!(d)
pos(d)
###


function walk!(w::Walker, N)
    positions = [pos(w)]

    for i in 1:N
        jump!(w)
        push!(positions, pos(w))
    end

    return positions
end
###


mutable struct NewWalker
    y::Int
end

pos(w::NewWalker) = w.y

jump!(w::NewWalker) = w += 1
###


N = 1000
data = [area_circle(N) for i in 1:1000]

using Plots
scatter(data, leg=false)
###


mean(data)
###


using StatsBase

scatter(data, alpha=0.5)
hline!([mean(data)], lw=3, ls=:dash)
ylims!(0, 4, ms=1, leg=false)
###


m = mean(data)
σ = sqrt(mean((data .- m).^2))
###


count(m - 2σ .< data .< m + 2σ) / length(data)
###


function monty_hall(switch::Bool)
    car_location = rand(1:3)
    my_choice = rand(1:3)

    if switch
        host_choices = setdiff(1:3, [car_location, my_choice])
        host_opens = rand(host_choices)

        possible_doors = setdiff(1:3, [my_choice, host_opens])
        my_choice = rand(possible_doors)  # modifies my_choice
    end

    return my_choice == car_location
end

N = 1000
switch_prob_success = count(monty_hall(true) for i in 1:N) / N
don′t_switch_prob_success = count(monty_hall(false) for i in 1:N) / N
# \prime<TAB>

switch_prob_success, don′t_switch_prob_success

###


uniform(a, b) = a + rand() * (b - a)
###


function area_circle(N)

    num_inside = 0

    for i in 1:N

        x = uniform(-1.0, 1.0)
        y = uniform(-1.0, 1.0)

        if x^2 + y^2 <= 1
            num_inside += 1
        end
    end

    return 4 * (num_inside / N)

end

area_circle(10^6)
###


