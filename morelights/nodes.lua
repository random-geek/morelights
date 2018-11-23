minetest.register_craftitem("morelights:bulb", {
  description = "Light Bulb",
  inventory_image = "morelights_bulb.png"
})

morelights.register_variants({
  {name = "morelights:pole_d", description = "Metal Pole (dark)",
    tiles = {"morelights_metal_dark_32.png"},
    on_place = function(itemstack, placer, pointed_thing)
      return morelights.on_place_hanging(itemstack, placer, pointed_thing,
        "morelights:pole_ceiling_d")
    end},
  {name = "morelights:pole_l", description = "Metal Pole (light)",
    tiles = {"morelights_metal_light_32.png"},
    on_place = function(itemstack, placer, pointed_thing)
      return morelights.on_place_hanging(itemstack, placer, pointed_thing,
        "morelights:pole_ceiling_l")
    end}
},
{
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}
  },
  selection_box = {
    type = "wallmounted",
    wall_bottom = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
    wall_side = {-1/2, -1/16, -1/16, 1/2, 1/16, 1/16},
    wall_top = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16}
  },
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propegates = true,
  groups = {cracky = 3, oddly_breakable_by_hand = 3, mounted_ceiling = 1},
  sounds = default.node_sound_metal_defaults(),
})

morelights.register_variants({
  {name = "morelights:pole_ceiling_d",
    tiles = {"morelights_metal_dark_32.png"}, drop = "morelights:pole_d"},
  {name = "morelights:pole_ceiling_l",
    tiles = {"morelights_metal_light_32.png"}, drop = "morelights:pole_l"}
},
{
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {{-3/16, -7/16, -3/16, 3/16, -1/2, 3/16},
      {-1/32, 1/2, -1/32, 1/32, -7/16, 1/32}}
  },
  selection_box = {
    type = "wallmounted",
    wall_bottom = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
    wall_side = {-1/2, -1/16, -1/16, 1/2, 1/16, 1/16},
    wall_top = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16}
  },
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propegates = true,
  groups = {cracky = 3, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1, mounted_ceiling = 1},
  sounds = default.node_sound_metal_defaults(),
})

morelights.register_variants({
  {name = "morelights:chain_d", description = "Metal Chain (dark)",
    tiles = {"morelights_metal_dark_32.png"},
    on_place = function(itemstack, placer, pointed_thing)
      return morelights.on_place_hanging(itemstack, placer, pointed_thing,
        "morelights:chain_ceiling_d")
    end},
  {name = "morelights:chain_l", description = "Metal Chain (light)",
    tiles = {"morelights_metal_light_32.png"},
    on_place = function(itemstack, placer, pointed_thing)
      return morelights.on_place_hanging(itemstack, placer, pointed_thing,
        "morelights:chain_ceiling_l")
    end}
},
{
  drawtype = "mesh",
  mesh = "morelights_chain.obj",
  collision_box = {
    type = "fixed",
    fixed = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16}
  },
  selection_box = {
    type = "fixed",
    fixed = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16}
  },
  paramtype = "light",
  groups = {cracky = 3, oddly_breakable_by_hand = 3, mounted_ceiling = 1},
  sounds = default.node_sound_metal_defaults(),
})

morelights.register_variants({
  {name = "morelights:chain_ceiling_d",
    tiles = {"morelights_metal_dark_32.png"}, drop = "morelights:chain_d"},
  {name = "morelights:chain_ceiling_l",
    tiles = {"morelights_metal_light_32.png"}, drop = "morelights:chain_l"}
},
{
  drawtype = "mesh",
  mesh = "morelights_chain_ceiling.obj",
  collision_box = {
    type = "fixed",
    fixed = {{-3/16, 7/16, -3/16, 3/16, 1/2, 3/16},
      {-1/16, -1/2, -1/16, 1/16, 7/16, 1/16}}
  },
  selection_box = {
    type = "fixed",
    fixed = {{-3/16, 7/16, -3/16, 3/16, 1/2, 3/16},
      {-1/16, -1/2, -1/16, 1/16, 7/16, 1/16}}
  },
  paramtype = "light",
  groups = {cracky = 3, oddly_breakable_by_hand = 3,
    not_in_creative_inventory = 1, mounted_ceiling = 1},
  sounds = default.node_sound_metal_defaults(),
})

--
-- Craft recipes
--

minetest.register_craft({
  output = "morelights:bulb",
  recipe = {
    {"", "default:glass", ""},
    {"", "default:copper_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights:pole_d 2",
  recipe = {
    {"dye:dark_grey", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights:pole_l 2",
  recipe = {
    {"dye:white", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights:chain_d",
  recipe = {
    {"dye:dark_grey", "default:steel_ingot", ""},
    {"", "", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights:chain_l",
  recipe = {
    {"dye:white", "default:steel_ingot", ""},
    {"", "", ""},
    {"", "default:steel_ingot", ""}
  }
})
