### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 6d6f2024-58d5-11eb-2fe4-b380b8dc2f85
begin
	using PlutoUI
	using CSV
	using DataFrames
	using Dates
	using Plots
	plotly()
end;

# ╔═╡ e7c58bf2-58d4-11eb-385a-67e8f5a81355
# presentation with x150% page size
html"""<style>
main {
    max-width: 5000px;
    align-self: flex-start;
}
"""

# ╔═╡ 405aa520-58f0-11eb-0daa-29ab5c641bbc
md"
# Pluto is all you need
"

# ╔═╡ da2061b0-58f8-11eb-3690-d3ac607fbe1d
LocalResource("../res/pluto.svg", :height=>500)

# ╔═╡ f09fd2ce-58ef-11eb-0d79-3b5e9b0635cd
md"
## A live bond between an HTML object and a Julia variable
"

# ╔═╡ 4392c80e-58f6-11eb-27c9-cb165710121f
md"
### By HTML object
"

# ╔═╡ 4f40c65e-58f6-11eb-33c0-93ec116d75ef
@bind arb_num html"<input type=range>"

# ╔═╡ 6244e670-58f8-11eb-2018-0b1a755e5aec
md"The arbitrary number is: **$arb_num**"

# ╔═╡ dee857b8-58f6-11eb-07a3-91ddc240b8e5
md"
### Not a style for Julia
"

# ╔═╡ 47ac33c2-58f8-11eb-027d-f548da3c1f32
LocalResource("../res/meme.jpg", :width => 500)

# ╔═╡ d360e614-58f9-11eb-153c-77fa389101e0
md"Picture revised from `@YUKIJI`"

# ╔═╡ 866c443c-58f6-11eb-00f2-132d07f35219
md"
### Via `PlutoUI.jl`
"

# ╔═╡ 10d94394-58e4-11eb-33dc-79e2a37848bb
md"
### Slider
"

# ╔═╡ ab1f4bfa-58d9-11eb-2479-9fd4a9fb8fad
@bind travel Slider(0.0:0.1:5, ; default=1.6, show_value=true)

# ╔═╡ a3bf3386-58d9-11eb-0c46-5b85b43c86bf
begin
	x = 0:1e-2:2pi
	plot(
		x, sin.(x),
		title="Amazing Wave",
		xlabel="X Label",
		ylabel="Y Label",
		label="A Sine Wave",
		size=(1000, 500),
	)
	plot!(
		x, cos.(x .- travel),
		label="A Cosine Wave",
	)
end

# ╔═╡ 05bb02a2-58e9-11eb-2c4a-314e29d08d21
md"
### Text Field
"

# ╔═╡ dda2c662-58e8-11eb-14ec-6d4b62fcb636
@bind pen TextField((10, 1); default="pen")

# ╔═╡ dd7a25fa-58ec-11eb-030b-95850d69c550
@bind apple TextField((10, 1); default="apple")

# ╔═╡ 15aa9102-58e9-11eb-3f75-43dbc07f797b
md"I have a **$pen**, I have an **$apple**, boom! **$apple $pen** !!"

# ╔═╡ eae3e16a-58ea-11eb-08be-7330b82631b2
md"
### Number Field
"

# ╔═╡ f38bb0a4-58ea-11eb-3bf9-e54f73f9cc99
@bind num NumberField(150:180; default=168)

# ╔═╡ 0af9f96c-58eb-11eb-286a-f78c70da1b46
md"Guess my height: **$num**"

# ╔═╡ c1aca1bc-58e8-11eb-3549-59185e6a6257
md"
### Date and time
"

# ╔═╡ a10164d4-58e8-11eb-15c2-c91484cca3a1
@bind date DateField(default=Date(1999, 9, 21))

# ╔═╡ c3244db6-58e7-11eb-159b-ab1496c92033
@bind time TimeField(default=Time(1, 47, 16))

# ╔═╡ 5a6fca0a-58e9-11eb-0352-e13541a628a9
md"1999 Jiji earthquake took place in: **$date $time**"

# ╔═╡ 90f69c32-58eb-11eb-32bb-e159c0eb5c2d
md"
### Selection
"

# ╔═╡ 80c0e46c-58eb-11eb-1f3d-752ebebf1f2a
@bind lang_select Select(["Julia" => "", "Python" => ""], default="Julia")

# ╔═╡ d3f885f4-58eb-11eb-0e52-413c758e7945
md"Wich language is better: **$(lang_select)**"

# ╔═╡ 2b26919a-58ec-11eb-3b96-2741710998f8
@bind lang_radio Radio(["Julia" => "", "Python" => ""], default="Julia")

# ╔═╡ 3b3dd016-58ec-11eb-33bf-1ba53f376194
md"Wich language is better: **$(lang_radio)**"

# ╔═╡ 126ab49c-58f1-11eb-147e-fba1ad10f725
@bind love CheckBox(default=true)

# ╔═╡ 8673a1ba-58f0-11eb-276f-f1bceaaf9f0f
md"Do you love Julia? **$love**"

# ╔═╡ fe160bb4-58f2-11eb-1936-a97f06f402a5
@bind lang MultiSelect([" "=>"Julia", " "=>"Python", " "=>"Java", " "=>"C#"], default=[" "])

# ╔═╡ 076f8804-58f3-11eb-38da-5fa7daa88ee7
md"I love **$lang**."

# ╔═╡ 640558fc-58f1-11eb-1f39-b1684aa48cee
md"
### File Picker
"

# ╔═╡ 71834dc0-58f1-11eb-09b5-952d4e35ab13
@bind data FilePicker([MIME("text/csv")]) # data.csv

# ╔═╡ a41c1868-58f1-11eb-0675-9fe8c35095e3
data

# ╔═╡ 30ae7cb0-58f4-11eb-3d8c-29b0a354980e
isempty(data["name"]) ? nothing : CSV.read(joinpath("..", "res", data["name"]), DataFrame)

# ╔═╡ 2c53d148-58e4-11eb-100f-4198669a7506
md"
### Interact with terminal
"

# ╔═╡ cfa2b57a-58db-11eb-16f6-b1b61f323163
with_terminal() do
	println("`with_terminal()` function will redirect `stdout` to notebook.")
end

# ╔═╡ 5e30eac8-58e6-11eb-3730-0d2d20c7d225
md"
### Local Resource
"

# ╔═╡ 205d4922-58e5-11eb-0082-797ad612ca4d
LocalResource("../res/julia.png", :width => 400)

# ╔═╡ Cell order:
# ╟─e7c58bf2-58d4-11eb-385a-67e8f5a81355
# ╟─6d6f2024-58d5-11eb-2fe4-b380b8dc2f85
# ╟─405aa520-58f0-11eb-0daa-29ab5c641bbc
# ╟─da2061b0-58f8-11eb-3690-d3ac607fbe1d
# ╟─f09fd2ce-58ef-11eb-0d79-3b5e9b0635cd
# ╟─4392c80e-58f6-11eb-27c9-cb165710121f
# ╠═4f40c65e-58f6-11eb-33c0-93ec116d75ef
# ╟─6244e670-58f8-11eb-2018-0b1a755e5aec
# ╟─dee857b8-58f6-11eb-07a3-91ddc240b8e5
# ╟─47ac33c2-58f8-11eb-027d-f548da3c1f32
# ╟─d360e614-58f9-11eb-153c-77fa389101e0
# ╟─866c443c-58f6-11eb-00f2-132d07f35219
# ╟─10d94394-58e4-11eb-33dc-79e2a37848bb
# ╠═ab1f4bfa-58d9-11eb-2479-9fd4a9fb8fad
# ╠═a3bf3386-58d9-11eb-0c46-5b85b43c86bf
# ╟─05bb02a2-58e9-11eb-2c4a-314e29d08d21
# ╠═dda2c662-58e8-11eb-14ec-6d4b62fcb636
# ╠═dd7a25fa-58ec-11eb-030b-95850d69c550
# ╟─15aa9102-58e9-11eb-3f75-43dbc07f797b
# ╟─eae3e16a-58ea-11eb-08be-7330b82631b2
# ╠═f38bb0a4-58ea-11eb-3bf9-e54f73f9cc99
# ╟─0af9f96c-58eb-11eb-286a-f78c70da1b46
# ╟─c1aca1bc-58e8-11eb-3549-59185e6a6257
# ╠═a10164d4-58e8-11eb-15c2-c91484cca3a1
# ╠═c3244db6-58e7-11eb-159b-ab1496c92033
# ╟─5a6fca0a-58e9-11eb-0352-e13541a628a9
# ╟─90f69c32-58eb-11eb-32bb-e159c0eb5c2d
# ╠═80c0e46c-58eb-11eb-1f3d-752ebebf1f2a
# ╟─d3f885f4-58eb-11eb-0e52-413c758e7945
# ╠═2b26919a-58ec-11eb-3b96-2741710998f8
# ╟─3b3dd016-58ec-11eb-33bf-1ba53f376194
# ╠═126ab49c-58f1-11eb-147e-fba1ad10f725
# ╟─8673a1ba-58f0-11eb-276f-f1bceaaf9f0f
# ╠═fe160bb4-58f2-11eb-1936-a97f06f402a5
# ╠═076f8804-58f3-11eb-38da-5fa7daa88ee7
# ╟─640558fc-58f1-11eb-1f39-b1684aa48cee
# ╠═71834dc0-58f1-11eb-09b5-952d4e35ab13
# ╠═a41c1868-58f1-11eb-0675-9fe8c35095e3
# ╠═30ae7cb0-58f4-11eb-3d8c-29b0a354980e
# ╟─2c53d148-58e4-11eb-100f-4198669a7506
# ╠═cfa2b57a-58db-11eb-16f6-b1b61f323163
# ╟─5e30eac8-58e6-11eb-3730-0d2d20c7d225
# ╠═205d4922-58e5-11eb-0082-797ad612ca4d
