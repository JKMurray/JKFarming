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

-- Reeds growing
minetest.register_abm({
	nodenames = {"jkfarming:sugarreeds"},
	neighbors = {"group:sand"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if minetest.get_item_group(name, "sand") ~= 0 then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "jkfarming:sugarreeds" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="jkfarming:sugarreeds"})
				end
			end
		end
	end,
})