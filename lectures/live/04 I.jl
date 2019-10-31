function count_outcomes(data, num_sides)  # maximum number in the data
    counts = zeros(Int, num_sides)

    for result in data   # alternative:  for i in 1:length(data)
        counts[result] += 1
    end

    return counts
end

data = rand(1:6, 1000)

@manipulate for n in slider(1:length(data), value=1)
    counts = count_outcomes(data[1:n], 6)
    bar(counts, ylim=(0,20))
    ylims!(0, 20)
end



n1(N) = count(rand(1:6, N) .== 1)


@manipulate for N in 1:1000, num_experiments in 1:10000 # repeat experiment:
    n1_data = [n1(N) for i in 1:num_experiments]
    counts = count_outcomes(n1_data, N)
# better to use a Dict?
    bar(counts, xlim=(0,
    300))
    vline!([mean(n1_data)], ls=:dash, c=:red, lw=3)
end

n1_data = n1(1000)

variance = mean((n1_data .- mean(n1_data)) .^ 2)
σ = √variance

counts = count_outcomes(n1_data, N)
