-- JKMOD Tech - Combining all the parts

-- Ethanol bottle
-- Melon
minetest.register_node("jktech:bottle_ethanol", 
{
	tiles = {"jktech_bottle_ethanol.png"},
	drawtype = "plantlike",
	paramtype = "light",
	groups = {snappy=3,flammable=5},
	on_place = function(itemstack, placer, pointed_thing)
		return
	end
})

minetest.register_craft( {
	output = "jktech:bottle_ethanol",
	recipe = {
		{ "vessels:glass_bottle", "jkfarming:corn", "jkfarming:corn" },
		{ "", "", "" },
		{ "", "", "" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "jktech:bottle_ethanol",
	burntime = 600,
})

minetest.register_craft({
	output = "default:book",
	recipe = {
		{"", "default:paper",""},
		{"jkanimals:leather", "default:paper",""},
		{"", "default:paper",""}
	}
})