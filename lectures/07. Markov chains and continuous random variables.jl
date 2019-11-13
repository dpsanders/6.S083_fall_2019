function counts(v::Vector{T}) where {T}
    d = Dict{T, Int}()
    ...
end
###


L = 20
T = 10

P₀ = zeros(L)   # P\_0<TAB>
P₀[L ÷ 2] = 1

P = copy(P₀)       # time t
next_P = copy(P₀)  # time t+1
Ps = [copy(P₀)]
###


    push!(Ps, copy(next_P))
    global P, next_P = next_P, P
end
```
###


