dofile(minetest.get_modpath("jkanimals").."/api.lua")
dofile(minetest.get_modpath("jkanimals").."/cow.lua")
dofile(minetest.get_modpath("jkanimals").."/sheep.lua")
dofile(minetest.get_modpath("jkanimals").."/chicken.lua")

-- Bucket of milk
minetest.register_node("jkanimals:bucket_milk", 
	{
		description = "Milk bukket",
		inventory_image  = "jkanimals_bucket_milk.png",
		tiles = {"jkanimals_bucket_milk.png"},
		drawtype = "plantlike",
		--sunlight_propagates = false,
		--use_texture_alpha = true,
		--paramtype = "light",
		groups = {snappy=3},		
		
		on_place = function(itemstack, placer, pointed_thing)
			return
		end
})