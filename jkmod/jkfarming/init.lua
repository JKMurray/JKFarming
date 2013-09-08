-- Seeds

-- Carrot
minetest.register_node("jkfarming:seeds_carrot", 
	{
		description = "Carrot seeds",
		inventory_image  = "jkmod_seeds_carrot.png",
		tiles = {"jkmod_carrots_stage_0.png"},
		drawtype = "plantlike",
		sunlight_propagates = false,
		use_texture_alpha = true,
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1},
		
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(under.name, "soil") <= 1 then
				return
			end
			minetest.set_node(pointed_thing.above, {name="jkfarming:carrot_stage_0"})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
})

-- Melon stem
minetest.register_node("jkfarming:melon_seeds", 
	{
		description = "Melon seeds",
		inventory_image  = "jkmod_melon_seeds.png",
		tiles = {"jkmod_melon_stem.png"},
		drawtype = "plantlike",
		sunlight_propagates = false,
		use_texture_alpha = true,
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1},
		
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(under.name, "soil") <= 1 then
				return
			end
			minetest.set_node(pointed_thing.above, {name="jkfarming:melon_seeds"})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
})

-- Melon
minetest.register_node("jkfarming:melon", 
{
	tiles = {"jkmod_melon_top.png", "jkmod_melon_top.png", "jkmod_melon_side.png",
			 "jkmod_melon_side.png","jkmod_melon_side.png","jkmod_melon_side.png"},
	drawtype = "normal",
	paramtype = "light",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	drop = {items = {
			{items = {'jkfarming:melon_part'}},
			{items = {'jkfarming:melon_part'}},
			{items = {'jkfarming:melon_part'}},
			{items = {'jkfarming:melon_part'}},
			{items = {'jkfarming:melon_part'}}
				
		}
	},		
})

-- Corn
minetest.register_node("jkfarming:seeds_corn", 
	{
		description = "Corn seeds",
		inventory_image  = "jkmod_corn_seeds.png",
		tiles = {"jkmod_corn_stage_1.png"},
		drawtype = "plantlike",
		sunlight_propagates = false,
		use_texture_alpha = true,
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
		
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(under.name, "soil") <= 1 then
				return
			end
			minetest.set_node(pointed_thing.above, {name="jkfarming:corn_stage_1"})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
})

--Different stages of the corn
for i=1,4 do
minetest.register_node("jkfarming:corn_stage_"..i, 
{
		tiles = {"jkmod_corn_stage_"..i..".png"},
		drawtype = "plantlike",
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})
end

minetest.register_node("jkfarming:corn_stage_5", 
{
		tiles = {"jkmod_corn_stage_5.png"},
		drawtype = "plantlike",
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		drop = {max_items = 4,items = {{items = {'jkfarming:corn'},rarity = 1},{items = {'jkfarming:seeds_corn'},rarity = 1},}},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})

-- Carrot Stages
minetest.register_node("jkfarming:carrot_stage_0", 
	{
		tiles = {"jkmod_carrots_stage_0.png"},
		drawtype = "plantlike",
		walkable = false,
		paramtype = "light",
		drop = {max_items = 1,items = {{items = {'jkfarming:seeds_carrot'},rarity = 1},}},
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})

minetest.register_node("jkfarming:carrot_stage_1", 
	{
		tiles = {"jkmod_carrots_stage_1.png"},
		drawtype = "plantlike",
		walkable = false,
		paramtype = "light",
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})

minetest.register_node("jkfarming:carrot_stage_2", 
	{
		tiles = {"jkmod_carrots_stage_2.png"},
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})

minetest.register_node("jkfarming:carrot_stage_3", 
	{
		tiles = {"jkmod_carrots_stage_3.png"},
		drawtype = "plantlike",
		paramtype = "light",
		walkable = false,
		drop = {max_items = 4,items = {{items = {'jkfarming:carrot'},rarity = 1},{items = {'jkfarming:seeds_carrot'},rarity = 1},}},
		groups = {snappy=3,flammable=3,flora=1,attached_node=1, not_in_creative_inventory=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5,  0.5, -5/16, 0.5},
		},
})

-- Products
minetest.register_node("jkfarming:carrot", {
	description = "Carrot",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles ={"jkmod_carrot.png"},
	inventory_image = "jkmod_carrot.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(4),
	
	on_place = function(itemstack, placer, pointed_thing)
		return
	end
})

minetest.register_node("jkfarming:melon_part", {
	description = "Melon part",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles ={"jkmod_melon.png"},
	inventory_image = "jkmod_melon.png",
	paramtype = "light",
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(3),	
	on_place = function(itemstack, placer, pointed_thing)
		return
	end
})

minetest.register_node("jkfarming:wheat_block", {
	description = "Wheat Block",
	drawtype = "normal",
	visual_scale = 1.0,
	tiles ={"jkmod_wheat_block_top.png", "jkmod_wheat_block_top.png","jkmod_wheat_block_side.png",
			"jkmod_wheat_block_side.png","jkmod_wheat_block_side.png","jkmod_wheat_block_side.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {snappy=3,flammable=3,flora=1},
	drop = {items = {
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}},
			{items = {'farming:wheat'}}			
	}},	
})

minetest.register_node("jkfarming:corn", {
	description = "Corn",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles ={"jkmod_corn.png"},
	inventory_image = "jkmod_corn.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3},
	on_use = minetest.item_eat(4),	
	on_place = function(itemstack, placer, pointed_thing)
		return
	end
})

-- Growing shizzle
minetest.register_abm({
	nodenames = {"jkfarming:seeds_carrot"},
	interval = 400,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:set_node(pos, {name = "jkfarming:carrot_stage_0"})
	end
})

minetest.register_abm({
	nodenames = {"jkfarming:melon_seeds"},
	interval = 720,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:set_node(pos, {name = "jkfarming:melon"})
	end
})

-- Ugly fix to keep the soil
for i=0,3 do
	minetest.register_abm({
		nodenames = {"jkfarming:carrot_stage_"..i},
		interval = 15,
		chance = 1,
		action = function(pos, node)
			newp = pos
			newp.y = newp.y - 1
			--pos.y=pos.y+1
			nodedown = minetest.get_node(newp)
			if (nodedown.name == "default:dirt") then
				minetest.dig_node(pos)
				minetest.set_node(pos, {name="default:dirt"})
			end
		end
	})
end
for i=2,0, -1 do

	minetest.register_abm({
		nodenames 	= {"jkfarming:carrot_stage_"..i},
		interval 	= 400,
		chance 		= 3,
		action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.env:set_node(pos, {name = "jkfarming:carrot_stage_"..i+1})
		end
	})

end

-- ABM Corn
for i=4,1,-1 do
	minetest.register_abm({
		nodenames	= {"jkfarming:corn_stage_"..i},
		interval	= 600,
		chance		= 2,
		action = function(pos, node, active_object_count, active_object_count_wider)
			minetest.env:set_node(pos, {name = "jkfarming:corn_stage_"..i+1})			
		end
	})
end

-- Recipies

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

