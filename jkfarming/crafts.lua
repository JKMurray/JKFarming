-- Carrot Seeds
minetest.register_craft({
	output = "jkfarming:seeds_carrot",
	recipe = {
		{"farming:seed_wheat", "", ""},
		{"", "farming:seed_wheat", ""},
		{"", "", "farming:seed_wheat"}
	}
})

-- Melon Seeds start
minetest.register_craft({
	output = "jkfarming:melon_seeds",
	recipe = {
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"},
		{"", "farming:seed_wheat", ""},
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"}
	}
})

-- Melon seeds from Melon
minetest.register_craft({
	type = "shapeless",
	output = "jkfarming:melon_seeds",
	recipe = {"jkfarming:melon_part"},
})

-- Corn seeds from Corn
minetest.register_craft({
	type = "shapeless",
	output = "jkfarming:seeds_corn 10",
	recipe = {"jkfarming:corn"},
})

-- Corn Seeds from Start (C)
minetest.register_craft({
	output = "jkfarming:seeds_corn",
	recipe = {
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"},
		{"farming:seed_wheat", "", ""},
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"}
	}
})

-- Wheatblock
minetest.register_craft({
	output = "jkfarming:wheat_block",
	recipe = {
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"},
		{"farming:wheat", "farming:wheat", "farming:wheat"}
	}
})

-- Cake
minetest.register_craft({
	output = "jkfarming:cake",
	recipe = {
		{"jkanimals:bucket_milk", "jkanimals:bucket_milk", "jkanimals:bucket_milk"},
		{"jkfarming:sugar", "jkanimals:egg", "jkfarming:sugar"},
		{"farming:wheat", "farming:wheat", "farming:wheat"}
	}
})

-- Sugar
minetest.register_craft({
	type = "shapeless",
	output = "jkfarming:sugar",
	recipe = {"jkfarming:sugarreeds"},
})