using OffsetArrays

function first_passage_distribution(L=20, T=100)

    P = OffsetArray([0.0; 1.0; zeros(L-1)], 0:L)
    next_P = similar(P)

    absorption_prob = Float64[]
###


α = 4
data = [sum(rand(Pareto(α, 1.0), 100)) for i in 1:10000]
histogram(data)  # satisfies CLT

α = 1.5
data = [sum(rand(Pareto(α, 1.0), 100)) for i in 1:10000]
histogram(data)  # doesn't satisfy CLT
###


for t in 1:T
      for i in 1:L-1
          next_P[i] = 0.5*(P[i-1] + P[i+1])
      end

      next_P[L] = 0.5 * (P[L-1] + P[L])
      next_P[0] = 0.5 * P[1]

      push!(absorption_prob, next_P[0])
      next_P[0] = 0.0

      next_P, P = P, next_P
  end
###


function calculate_and_plot(L, T)
    absorption_prob = first_passage_distribution(L, T)

    plot!(absorption_prob[1:2:end],
        xscale=:log10, yscale=:log10, alpha=0.4, label="$L", lw=3)
end
###



function mean_of_distribution(pmf)
    return sum(n * pmf[n] for n in 1:length(pmf))
end
###


using StatsBase

data = rand(100)

h = fit(Histogram, data, nbins=50)

using StatsPlots
plot(h)
###


