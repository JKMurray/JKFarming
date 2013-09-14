-- Cow
dofile(minetest.get_modpath("jkanimals").."/api.lua")

mobs:register_mob("jkanimals:chicken", {
	type = "animal",
	hp_max = 5,
	collisionbox = {-0.3, -0.75, -0.3, 0.3, 0.1, 0.3},
	textures = {"chicken.png"},
	visual = "mesh",
	mesh = "chicken.x",
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "jkanimals:meat_raw", chance = 1, min = 2, max = 3,},
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
		stand_end = 20,
		walk_start = 20,
		walk_end = 40,
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

--mobs:register_spawn("jkanimals:cow", {"default:dirt_with_grass"}, 20, 8, 9000, 1, 31000)
