-- JKWine Mod 0.0.1

-- Grapeseeds
minetest.register_node("jkwine:grapes_seed", {
	description = "Grape seed",
	tiles ={"jkwine_seeds_grape.png"},
	drawtype = "normal",
	visual_scale = 1.0,
	inventory_image = "jkwine_seeds_grape.png",
	paramtype = "light",
	groups = {flammable=3,flora=1},
		
	on_place = function(itemstack, placer, pointed_thing)
		-- Cant be placed
		return
	end,
})

-- Grapes
minetest.register_node("jkwine:grapes", {
	description = "Grapes",
	tiles ={"jkwine_grapes.png"},
	drawtype = "normal",
	visual_scale = 1.0,
	inventory_image = "jkwine_grapes.png",
	paramtype = "light",
	groups = {flammable=3,flora=1},
	
	on_use = function(itemstack, user, pointed_thing)
		-- Edit this to support winebarrel
		minetest.item_eat(1)
	end,
	
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
})

--Top part of vine (can be placed)
minetest.register_node("jkwine:vinetop", {
	description = "Grapevine",
	tiles ={"jkwine_vine_top.png"},
	drawtype = "plantlike",
	visual_scale = 1.0,
	inventory_image = "jkwine_vine_top.png",
	paramtype = "light",
	groups = {snappy=3, flammable=3,flora=1},
		
	on_place = function(itemstack, placer, pointed_thing)
		-- Here must come a lot of checking
		print("placing")
		
		-- 1. Check soil
			local under = minetest.get_node(pointed_thing.under)
			if minetest.get_item_group(under.name, "soil") <= 1 then
				return
			end
		
		-- 2. Check if area is clear		
			if minetest.get_node(pointed_thing.above).name ~= "air" then
				return
			end
		
		-- 3. Put this down + its upper part
			local toppos = pointed_thing.under
			toppos.y = toppos.y+2
			minetest.set_node(toppos, {name="jkwine:vinetop"})
			
			local placepos = pointed_thing.under
			placepos.y = placepos.y-1
			minetest.set_node(placepos, {name="jkwine:vinebottom"})
			
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
		return itemstack
	end,
})

-- Bottom part of vine (cannot be placed)
minetest.register_node("jkwine:vinebottom", {
	description = "Grapevine Bottom",
	tiles ={"jkwine_vine_bottom.png"},
	drawtype = "plantlike",
	visual_scale = 1.0,
	paramtype = "light",
	groups = {snappy=3, flammable=3,flora=1, not_in_creative_inventory=1},	
	
	after_destruct = function(pos, oldnode)
		local otherpos = pos
		otherpos.y = otherpos.y+1
		minetest.remove_node(otherpos)
	end,
})

-- Stage 1
minetest.register_node("jkwine:vine_stage_1", {
	description = "Grapevine Stage 1",
	tiles ={"jkwine_vine_stage_1.png"},
	drawtype = "plantlike",
	visual_scale = 1.0,
	paramtype = "light",
	groups = {snappy=3, flammable=3,flora=1, not_in_creative_inventory=1},	
	drop = "",
	after_destruct = function(pos, oldnode)
		local otherpos = pos
		otherpos.y = otherpos.y+1
		minetest.remove_node(otherpos)
	end,
})

-- Stage 2 (final stage)
minetest.register_node("jkwine:vine_stage_2", {
	description = "Grapevine Stage 2",
	tiles ={"jkwine_vine_stage_2.png"},
	drawtype = "plantlike",
	visual_scale = 1.0,
	paramtype = "light",
	groups = {snappy=3, flammable=3,flora=1, not_in_creative_inventory=1},	
	
	drop = {items = {
			{items = {'jkwine:grapes'}},
			{items = {'jkwine:grapes'}},
			{items = {'jkwine:grapes'}},
			{items = {'jkwine:grapes'}}				
		}
	},
	
	after_destruct = function(pos, oldnode)
		local otherpos = pos
		otherpos.y = otherpos.y+1
		minetest.remove_node(otherpos)
	end,
})

-- Winebottle
minetest.register_node("jkwine:winebottle", {
	description = "Bottled Wine",
	tiles ={"jkmod_winebottle.png"},
	drawtype = "plantlike",
	visual_scale = 1.0,
	inventory_image = "jkmod_winebottle.png",
	paramtype = "light",
	groups = {flammable=3,flora=1},
	
	on_use = function(itemstack, user, pointed_thing)
		minetest.item_eat(1)
	end,
	
	on_place = function(itemstack, placer, pointed_thing)
		return
	end,
})

-- Winebarrel

winebarrel_formspec =
	"size[8,9]"..
	"list[current_name;src;2,1;1,1;]"..
	"list[current_name;dst;5,1;2,2;]"..
	"list[current_player;main;0,5;8,4;]"

minetest.register_node("jkwine:winebarrel", {
	description = "Winebarrel",
	tiles = {"jkwine_winebarrel_top.png", "jkwine_winebarrel_side.png", "jkwine_winebarrel_side.png",
		"jkwine_winebarrel_side.png", "jkwine_winebarrel_side.png", "jkwine_winebarrel_frontback.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", winebarrel_formspec)
		meta:set_string("infotext", "Winebarrel")
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		
		if not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)
		if to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

-- ABM Vines

-- From stage 1 to stage 2
minetest.register_abm({nodenames = {"jkwine:vine_stage_1"},
	interval = 600,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:set_node(pos, {name = "jkwine:vine_stage_2"})
	end
})

-- From Vine to stage 1
minetest.register_abm({nodenames = {"jkwine:vinetop"},
	interval = 600,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:set_node(pos, {name = "jkwine:vine_stage_1"})
	end
})

-- Winebarrel abm
minetest.register_abm({
	nodenames = {"jkwine:winebarrel"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		
		if meta:get_string("status") == "" then
			meta:set_float("status",0.0)
		end
		
		local inv = meta:get_inventory()
		local srclist = inv:get_list("src")
		
		local riped = nil
		local afterriped
		
		if srclist then
			riped, afterriped = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if inv:is_empty("src") == false then
			
			if meta:get_float("status") < 100 then
				-- We're cooking!
				local status = meta:get_float("status")
				meta:set_string("infotext","Riping percentage: "..status.."%")
				status = status + 1
				meta:set_float("status",status)			
			else
				-- We're ready!
				if inv:room_for_item("dst",riped.item) then
					inv:add_item("dst", riped.item)
					inv:set_stack("src", 1, afterriped.items[1])
					meta:set_float("status",0.0)		
				else
					print("Could not insert '"..riped.item:to_string().."'")
				end
			end
		else
			meta:set_float("status",0.0)
			meta:set_string("infotext","No items.")
		end
	end,
})

-- Recipies

-- Grapevine
minetest.register_craft({
	output = "jkwine:vinetop",
	recipe = {
		{"default:stick", "jkwine:grapes_seed", "default:stick"},
		{"default:stick", "jkwine:grapes_seed", "default:stick"},
		{"", "", ""}
	}
})

-- Grapeseeds
minetest.register_craft({
	type="shapeless",
	output = "jkwine:grapes_seed",
	recipe = {"jkwine:grapes"}
})

-- Vinebottoms to sticks
minetest.register_craft({
	type="shapeless",
	output = "default:stick",
	recipe = {"jkwine:vinebottom"}
})

-- Winebottle from Grapes
minetest.register_craft({
	type="cooking",
	output = "jkwine:winebottle",
	recipe = "jkwine:grapes"
})

-- Grape Seeds start
minetest.register_craft({
	output = "jkwine:grapes_seed",
	recipe = {
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"},
		{"farming:seed_wheat", "", "farming:seed_wheat"},
		{"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"}
	}
})