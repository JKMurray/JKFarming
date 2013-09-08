-- Cow
dofile(minetest.get_modpath("jkanimals").."/api.lua")

mobs:register_mob("jkanimals:cow", {
	type = "animal",
	hp_max = 5,
	collisionbox = {-0.75, -1.5, -0.75, 0.75, 0.0, 0.75},
	textures = {"cow.png"},
	visual = "mesh",
	mesh = "cow.x",
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "jkanimals:meat_raw", chance = 1, min = 2, max = 3,},
		{name = "jkanimals:leather", chance = 1, min = 1, max = 2,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	sounds = {
		random = "animals_cow",
	},
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 50,
		walk_end = 70,
	},
	follow = "farming:wheat",
	view_range = 5,	
	on_rightclick = function(self, clicker)
		-- Check for bucket to get milk
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming:wheat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
			return
			end
		end
		-- Get Milk
		if item:get_name() == "bucket:bucket_empty" then
			-- Delete Bucket
			item:take_item()			
			-- Add bucket with milk
			clicker:get_inventory():add_item("main", ItemStack("jkanimals:bucket_milk 1"))
			return
		end	
	end
})

mobs:register_spawn("jkanimals:cow", {"default:dirt_with_grass"}, 20, 8, 9000, 1, 31000)

-- Leather
minetest.register_node("jkanimals:leather", 
	{
		description = "Leather",
		inventory_image  = "jkanimals_leather.png",
		drawtype = "plantlike",
		sunlight_propagates = false,
		use_texture_alpha = true,
		groups = {snappy=3,flammable=3},		
		on_place = function(itemstack, placer, pointed_thing)			
			return			
		end
})