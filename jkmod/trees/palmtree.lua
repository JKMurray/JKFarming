--function
abstract_trees.grow_palmtree = function(pos)
  local size = 4+math.random(2)
  local trunk_section_height = 2
  local trunk_node = "trees:tree_palm"
  local leaves_node = "trees:leaves_palm"
  local offset = {x=pos.x, y=pos.y+size+1, z=pos.z}
  local total_size = 0
  local leavetrav = 0
  for i=0,size/2.5,1 do
    for ii=0,size/2.5-i,1 do
      local spawn_pos = {x=offset.x, y=offset.y-i, z=offset.z+leavetrav}
      minetest.env:add_node(spawn_pos, {name=leaves_node})
      local spawn_pos = {x=offset.x, y=offset.y-i, z=offset.z-leavetrav}
      minetest.env:add_node(spawn_pos, {name=leaves_node})
      local spawn_pos = {x=offset.x+leavetrav, y=offset.y-i, z=offset.z}
      minetest.env:add_node(spawn_pos, {name=leaves_node})
      local spawn_pos = {x=offset.x-leavetrav, y=offset.y-i, z=offset.z}
      minetest.env:add_node(spawn_pos, {name=leaves_node})
      leavetrav = leavetrav + 1
    end
    leavetrav = leavetrav - 1
  end
  local offset = {x=pos.x, y=pos.y, z=pos.z}
  while total_size < size do
    for i=trunk_section_height-2,trunk_section_height*2-4,1 do
      if total_size > size then return end
      local spawn_pos = {x=offset.x, y=pos.y+size-i, z=offset.z}
      minetest.env:add_node(spawn_pos, {name=trunk_node})
      total_size = total_size + 1
    end
    offset = {x=offset.x+math.ceil(math.random(3))-2, y=offset.y, z=offset.z+math.ceil(math.random(3))-2}
    trunk_section_height = trunk_section_height * 2 -1
  end
end

-- abm
minetest.register_abm({
  nodenames = "trees:sapling_palm",
  interval = 1000,
  chance = 4,
  action = function(pos, node, _, _)
    if minetest.env:get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" then
      abstract_trees.grow_palmtree({x = pos.x, y = pos.y, z = pos.z})
      end
    end
})

--spawn
plantslib:register_generate_plant({
	surface = "default:sand",
	seed_diff = 330,
	min_elevation = -1,
	max_elevation = 5,
	near_nodes = {"default:water_source"},
	near_nodes_size = 15,
	near_nodes_count = 6,
	avoid_nodes = {"group:tree"},
  avoid_radius = 9,
	plantlife_limit = -0.8,
	temp_min = 0.15,
	temp_max = -0.25,
	rarity = 50,
	max_count = 10,
},
  "abstract_trees.grow_palmtree"
)

-- Wood
minetest.register_node("trees:wood_palm", {
	description = "Palm Planks",
	tiles = {"trees_wood_palm.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("trees:leaves_palm", {
	description = "Palm Leaves",
	drawtype = "allfaces_optional",
	tiles = {"trees_leaves_palm.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2},
	drop = {
	max_items = 1,
	items = {
		{items = {'trees:sapling_palm'},rarity = 20},
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})
  
minetest.register_node("trees:tree_palm", {
	description = "Palm Tree",	  
	tiles = {"trees_tree_top_palm.png", "trees_tree_top_palm.png", "trees_tree_palm.png"},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

--Craft
minetest.register_craft({
	output = 'trees:wood_palm 4',
	recipe = {
		{'trees:tree_palm'},
	}
})

--Sapling
minetest.register_node("trees:sapling_palm", {
	description = "Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tile_images = { "trees_sapling_palm.png" },
	paramtype = "light",
	walkable = false,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2},
	sounds = default.node_sound_defaults(),
})
