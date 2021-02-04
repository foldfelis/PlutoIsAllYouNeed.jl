### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 0d501e20-673d-11eb-0a31-03752523b23b
begin
	using DataFrames
	using Plots
	using StatsPlots
	plotly()
end

# ╔═╡ c597dee4-673c-11eb-1b89-b9dd928648d3
# presentation with x150% page size
html"""<style>
main {
    max-width: 5000px;
    align-self: flex-start;
}
"""

# ╔═╡ 9b31aff2-673e-11eb-083c-2fe7d52fef2e
md"
# Notebook as a library
"

# ╔═╡ a162f4ca-673d-11eb-19da-47b0165ecda9
function is_in_circle(x::Real, y::Real)
	dist = sqrt(x^2 + y^2)
	return dist <= 1
end

# ╔═╡ 0b0c3c5c-673d-11eb-1324-79ce8cd3542f
function monte_carlo_π(n::Int)
	points = DataFrame(X=rand(n), Y=rand(n))
	points.In = is_in_circle.(points.X, points.Y)
	mcπ = 4 * count(points.In)/length(points.In)
	
	return mcπ, points
end

# ╔═╡ 56480a52-673d-11eb-0764-755267d0814d
begin
	mcπ, points = monte_carlo_π(1000)
	
	@df points scatter(
		:X, :Y, group=:In,
		title="π by Monte Carlo method, π=$mcπ",
		xlabel="X",
		ylabel="Y",
		size=(700, 600)
	)
	plot!(
		cos.(0:0.001:π/2), sin.(0:0.001:π/2),
		label="Boundary",
		linewidth=5
	)
end

# ╔═╡ Cell order:
# ╟─c597dee4-673c-11eb-1b89-b9dd928648d3
# ╟─9b31aff2-673e-11eb-083c-2fe7d52fef2e
# ╠═0d501e20-673d-11eb-0a31-03752523b23b
# ╠═a162f4ca-673d-11eb-19da-47b0165ecda9
# ╠═0b0c3c5c-673d-11eb-1324-79ce8cd3542f
# ╠═56480a52-673d-11eb-0764-755267d0814d
