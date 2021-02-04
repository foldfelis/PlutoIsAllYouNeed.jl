### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ d866296c-6736-11eb-0250-c70a6454d2f0
begin
	using RDatasets
	using Clustering
	using Plots
	using StatsPlots
	plotly()
end

# ╔═╡ a5db84ec-6736-11eb-3095-5da8cb0655b1
# presentation with x150% page size
html"""<style>
main {
    max-width: 5000px;
    align-self: flex-start;
}
"""

# ╔═╡ 40636654-6737-11eb-09c7-8158d1225bf9
md"
# Data science report damo
"

# ╔═╡ 591ee490-6737-11eb-2816-6f2e10040ea2
md"
## Load Data
"

# ╔═╡ 351ab1d2-6737-11eb-0279-2b7e14096dc6
iris = RDatasets.dataset("datasets", "iris")

# ╔═╡ 7cedffb4-6737-11eb-34c3-017cdb59ffb4
md"
## Preprocess
"

# ╔═╡ 69a740f0-6737-11eb-38d1-c34d4b96bac5
X = Matrix(iris[:, 1:2])' ;

# ╔═╡ 86276e0a-6737-11eb-346f-e93f3eab5ce1
md"
## Model
"

# ╔═╡ 913abcc8-6737-11eb-2bda-ebd857ff8668
begin
	k = 3
	result = kmeans(X, k)
end;

# ╔═╡ f901ad9e-6737-11eb-12c9-bdf3899ebd62
md"
## Clusters
"

# ╔═╡ 1a6f2a60-6738-11eb-3667-49ce2ff50159
iris[!, :cluster] = string.(assignments(result));

# ╔═╡ 206d77b4-6738-11eb-39ea-652656b4dff4
md"
**Cluster centers (mean vector)**
"

# ╔═╡ 2df0a1ce-6738-11eb-14bc-fbdd88af6eab
result.centers

# ╔═╡ 3768ef98-6738-11eb-2ae2-b9034128ca55
md"
**Number of samples in each cluster**
"

# ╔═╡ 46d285d4-6738-11eb-332f-59195b1a1c94
counts(result)

# ╔═╡ 6ba204f2-6738-11eb-3444-85a97571081c
md"
## Plot
"

# ╔═╡ 4cf14ca2-6738-11eb-2449-b30ce06b6b50
begin
	@df iris scatter(
		:SepalLength, :SepalWidth, group=:cluster,
		title="Iris dataset cluster",
		xlabel="SepalLength",
		ylabel="SepalWidth",
		label="result",
		size=(1000, 500),
	)
	scatter!(
		result.centers[1, :], result.centers[2, :],
		label="Center",
		mark=10,
		color=ARGB(0.9, 0.1, 0.1, 0.5)
	)
end

# ╔═╡ Cell order:
# ╟─a5db84ec-6736-11eb-3095-5da8cb0655b1
# ╟─40636654-6737-11eb-09c7-8158d1225bf9
# ╠═d866296c-6736-11eb-0250-c70a6454d2f0
# ╟─591ee490-6737-11eb-2816-6f2e10040ea2
# ╠═351ab1d2-6737-11eb-0279-2b7e14096dc6
# ╟─7cedffb4-6737-11eb-34c3-017cdb59ffb4
# ╠═69a740f0-6737-11eb-38d1-c34d4b96bac5
# ╟─86276e0a-6737-11eb-346f-e93f3eab5ce1
# ╠═913abcc8-6737-11eb-2bda-ebd857ff8668
# ╟─f901ad9e-6737-11eb-12c9-bdf3899ebd62
# ╠═1a6f2a60-6738-11eb-3667-49ce2ff50159
# ╟─206d77b4-6738-11eb-39ea-652656b4dff4
# ╠═2df0a1ce-6738-11eb-14bc-fbdd88af6eab
# ╟─3768ef98-6738-11eb-2ae2-b9034128ca55
# ╠═46d285d4-6738-11eb-332f-59195b1a1c94
# ╟─6ba204f2-6738-11eb-3444-85a97571081c
# ╠═4cf14ca2-6738-11eb-2449-b30ce06b6b50
