minetest.register_node("morelights_extras:f_block", {
  description = "Futuristic Light Block",
  tiles = {"morelights_extras_f_block.png"},
  paramtype = "light",
  light_source = LIGHT_MAX,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("morelights_extras:dirt_with_grass", {
  description = "Grass Light",
  tiles = {"default_grass.png^morelights_extras_blocklight.png",
    "default_dirt.png", "default_dirt.png^default_grass_side.png"},
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults()
})

minetest.register_node("morelights_extras:stone_block", {
  description = "Stone Block Light",
  tiles = {"default_stone_block.png^morelights_extras_blocklight.png"},
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults()
})

minetest.register_node("morelights_extras:sandstone_block", {
  description = "Sandstone Block Light",
  tiles = {"default_sandstone_block.png^morelights_extras_blocklight.png"},
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults()
})

minetest.register_node("morelights_extras:stairlight", {
  description = "Stair Light (place on stairs)",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {-1/4, -13/16, -1/16, 1/4, -11/16, 0}
  },
  selection_box = {
    type = "fixed",
    fixed = {-1/4, -13/16, -1/16, 1/4, -11/16, 0}
  },
  walkable = false,
  tiles = {"morelights_metal_dark.png"},
  overlay_tiles = {"", "morelights_extras_stairlight.png",
    "", "", "morelights_extras_stairlight.png"},
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = 10,
  groups = {cracky = 2, oddly_breakable_by_hand = 3, attached_node = 1},
  node_placement_prediction = "",
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
    local node = minetest.get_node(vector.subtract(pointed_thing.above,
      {x=0, y=1, z=0}))

    if node and node.name:match("^stairs:stair")
      and node.param2 < 4 then
      minetest.item_place(itemstack, placer, pointed_thing, node.param2)
    end

    return itemstack
  end,

  on_rotate = function(pos, node, user, mode, new_param2)
    return false
  end,
})

--
-- Craft recipes
--

minetest.register_craft({
  output = "morelights_extras:f_block",
  recipe = {
    {"default:mese_crystal_fragment", "default:steel_ingot", "default:mese_crystal_fragment"},
    {morelights.glass, "morelights:bulb", morelights.glass},
    {"default:mese_crystal_fragment", "default:steel_ingot", "default:mese_crystal_fragment"}
  }
})

minetest.register_craft({
  output = "morelights_extras:dirt_with_grass",
  recipe = {
    {"", morelights.glass, ""},
    {"", "morelights:bulb", ""},
    {"default:grass_1", "default:dirt", ""}
  }
})

minetest.register_craft({
  output = "morelights_extras:stone_block",
  recipe = {
    {"", morelights.glass, ""},
    {"", "morelights:bulb", ""},
    {"", "default:stone_block", ""}
  }
})

minetest.register_craft({
  output = "morelights_extras:sandstone_block",
  recipe = {
    {"", morelights.glass, ""},
    {"", "morelights:bulb", ""},
    {"", "default:sandstone_block", ""}
  }
})

minetest.register_craft({
  output = "morelights_extras:stairlight",
  recipe = {
    {"default:steel_ingot", "morelights:bulb", "default:steel_ingot"}
  }
})
