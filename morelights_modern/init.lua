minetest.register_node("morelights_modern:block", {
  description = "Modern Light Block",
  tiles = {"morelights_metal_dark.png^morelights_modern_block.png"},
  paramtype = "light",
  light_source = LIGHT_MAX,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("morelights_modern:smallblock", {
  description = "Modern Light Block (small)",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {-1/4, -1/2, -1/4, 1/4, 0, 1/4}
  },
  tiles = {"morelights_metal_dark.png^morelights_modern_smallblock.png",
    "morelights_metal_dark.png^morelights_modern_smallblock.png",
    "[combine:16x16:0,0=morelights_metal_dark.png:0,4=morelights_modern_smallblock.png"},
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = 12,
  groups = {cracky = 3, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
    return morelights.rotate_and_place(itemstack, placer, pointed_thing)
  end,
})

morelights.register_variants({
  {name = "morelights_modern:post_d", description = "Modern Post Light (dark)",
    tiles = {"morelights_metal_dark.png", "morelights_metal_dark.png",
    "morelights_metal_dark.png^morelights_modern_post.png"}},
  {name = "morelights_modern:post_l", description = "Modern Post Light (light)",
    tiles = {"morelights_metal_light.png", "morelights_metal_light.png",
    "morelights_metal_light.png^morelights_modern_post.png"}}
},
{
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}}
  },
  paramtype = "light",
  light_source = LIGHT_MAX,
  groups = {cracky = 3, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_metal_defaults(),
})

morelights.register_variants({
  {name = "morelights_modern:streetpost_d",
    description = "Street Lamp Post (dark)--connects to bar lights",
    tiles = {"morelights_metal_dark.png"}},
  {name = "morelights_modern:streetpost_l",
    description = "Street Lamp Post (light)--connects to bar lights",
    tiles = {"morelights_metal_light.png"}}
},
{
  drawtype = "nodebox",
  node_box = {
    type = "connected",
    fixed = {-1/16, -1/2, -1/16, 1/16,  1/2, 1/16},
    connect_front = {-1/16,  3/8, -1/2, 1/16,  7/16, -1/16},
    connect_left = {-1/2, 3/8, -1/16, -1/16, 7/16, 1/16},
    connect_back = {-1/16, 3/8, 1/16, 1/16, 7/16, 1/2},
    connect_right = {1/16, 3/8, -1/16, 1/2, 7/16, 1/16},
  },
  connects_to = {"morelights_modern:barlight_c", "morelights_modern:barlight_s"},
  paramtype = "light",
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("morelights_modern:barlight_c", {
  description = "Ceiling Bar Light (connecting)",
  drawtype = "nodebox",
  node_box = {
    type = "connected",
    fixed = {-1/8,  3/8, -1/8, 1/8,  1/2, 1/8},
    connect_front = {-1/8, 3/8, -1/2, 1/8,  1/2, -1/8},
    connect_left = {-1/2, 3/8, -1/8, -1/8, 1/2, 1/8},
    connect_back = {-1/8, 3/8, 1/8, 1/8, 1/2, 1/2},
    connect_right = {1/8, 3/8, -1/8, 1/2, 1/2, 1/8},
  },
  connects_to = {"morelights_modern:barlight_c", "morelights_modern:barlight_s",
    "morelights_modern:streetpost_d", "morelights_modern:streetpost_l"},
  tiles = {"morelights_metal_dark.png", "morelights_modern_barlight.png",
    "morelights_metal_dark.png"},
  paramtype = "light",
  light_source = LIGHT_MAX,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("morelights_modern:barlight_s", {
  description = "Ceiling Bar Light (straight)",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {-1/2, 3/8, -1/8, 1/2, 1/2, 1/8},
  },
  tiles = {"morelights_metal_dark.png", "morelights_modern_barlight.png",
    "morelights_metal_dark.png"},
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = LIGHT_MAX,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("morelights_modern:ceilinglight", {
  description = "Modern Ceiling Light",
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {-1/4, 3/8, -1/4, 1/4, 1/2, 1/4}
  },
  tiles = {"morelights_metal_dark.png",
    "morelights_metal_dark.png^morelights_modern_block.png"},
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = LIGHT_MAX,
  groups = {cracky = 3, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
    return morelights.rotate_and_place(itemstack, placer, pointed_thing,
      {[0] = 0, 20, 12, 16, 4, 8})
  end,
})

morelights.register_variants({
  {name = "morelights_modern:canlight_d",
    description = "Modern Can Light (dark)",
    tiles = {"morelights_metal_dark.png^morelights_modern_canlight.png"}},
  {name = "morelights_modern:canlight_l",
    description = "Modern Can Light (light)",
    tiles = {"morelights_metal_light.png^morelights_modern_canlight.png"}},
},
{
  drawtype = "mesh",
  mesh = "morelights_modern_canlight.obj",
  collision_box = {
    type = "fixed",
    fixed = {-1/8, 0, -1/8, 1/8, 1/2, 1/8}
  },
  selection_box = {
    type = "fixed",
    fixed = {-1/8, 0, -1/8, 1/8, 1/2, 1/8}
  },
  paramtype = "light",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("morelights_modern:walllamp", {
  description = "Modern Wall Lamp",
  drawtype = "mesh",
  mesh = "morelights_modern_walllamp.obj",
  collision_box = {
    type = "fixed",
    fixed = {-1/8, -3/8, 1/8, 1/8, 1/4, 1/2}
  },
  selection_box = {
    type = "fixed",
    fixed = {-1/8, -3/8, 1/8, 1/8, 1/4, 1/2}
  },
  tiles = {"morelights_metal_dark_32.png^morelights_modern_walllamp.png"},
  paramtype = "light",
  paramtype2 = "facedir",
  light_source = 12,
  groups = {cracky = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_glass_defaults(),

  on_place = function(itemstack, placer, pointed_thing)
    return morelights.rotate_and_place(itemstack, placer, pointed_thing,
      {[0] = 6, 4, 1, 3, 0, 2})
  end,
})

morelights.register_variants({
  {name = "morelights_modern:tablelamp_d",
    description = "Modern Table Lamp (dark)",
    tiles = {"morelights_metal_light_32.png^morelights_modern_tablelamp_o.png",
    "morelights_modern_tablelamp_d.png"}},
  {name = "morelights_modern:tablelamp_l",
    description = "Modern Table Lamp (light)",
    tiles = {"morelights_metal_dark_32.png^morelights_modern_tablelamp_o.png",
    "morelights_modern_tablelamp_l.png"}},
},
{
  drawtype = "mesh",
  mesh = "morelights_modern_tablelamp.obj",
  collision_box = {
    type = "fixed",
    fixed = {-1/4, -1/2, -1/4, 1/4, 7/16, 1/4}
  },
  selection_box = {
    type = "fixed",
    fixed = {-1/4, -1/2, -1/4, 1/4, 7/16, 1/4}
  },
  paramtype = "light",
  light_source = 10,
  groups = {choppy = 2, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_defaults(),
})

morelights.register_variants({
  {name = "morelights_modern:pathlight_d",
    description = "Modern Path Light (dark)",
    tiles = {"morelights_metal_dark_32.png^morelights_modern_pathlight.png"}},
  {name = "morelights_modern:pathlight_l",
    description = "Modern Path Light (light)",
    tiles = {"morelights_metal_light_32.png^morelights_modern_pathlight.png"}}
},
{
  drawtype = "nodebox",
  node_box = {
    type = "fixed",
    fixed = {{-1/32, -8/16, -1/32, 1/32, 1/8, 1/32},
      {-1/16, 1/8, -1/16, 1/16, 5/16, 1/16},
      {-1/8, 5/16, -1/8, 1/8, 3/8, 1/8}}
  },
  selection_box = {
    type = "fixed",
    fixed = {{-1/8, -1/2, -1/8, 1/8, 3/8, 1/8}}
  },
  paramtype = "light",
  light_source = 8,
  groups = {cracky = 3, oddly_breakable_by_hand = 3},
  sounds = default.node_sound_metal_defaults(),
})

--
-- Craft recipes
--

minetest.register_craft({
  output = "morelights_modern:block",
  recipe = {
    {"", "default:steel_ingot", ""},
    {morelights.glass, "morelights:bulb", morelights.glass},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:smallblock",
  recipe = {
    {"", morelights.glass, ""},
    {"default:steel_ingot", "morelights:bulb", "default:steel_ingot"}
  }
})

minetest.register_craft({
  output = "morelights_modern:post_d",
  recipe = {
    {"dye:dark_grey", "default:steel_ingot", ""},
    {"", "morelights:bulb", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:post_l",
  recipe = {
    {"dye:white", "default:steel_ingot", ""},
    {"", "morelights:bulb", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:streetpost_d 2",
  recipe = {
    {"dye:dark_grey", "default:steel_ingot", "default:steel_ingot"},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:streetpost_l 2",
  recipe = {
    {"dye:white", "default:steel_ingot", "default:steel_ingot"},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:barlight_c 4",
  recipe = {
    {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
    {"default:copper_ingot", "default:glass", "default:copper_ingot"}
  }
})

minetest.register_craft({
  output = "morelights_modern:barlight_c",
  type = "shapeless",
  recipe = {"morelights_modern:barlight_s"}
})

minetest.register_craft({
  output = "morelights_modern:barlight_s",
  type = "shapeless",
  recipe = {"morelights_modern:barlight_c"}
})

minetest.register_craft({
  output = "morelights_modern:ceilinglight",
  recipe = {
    {"default:steel_ingot", "morelights:bulb", "default:steel_ingot"},
    {"", morelights.glass, ""},
  }
})

minetest.register_craft({
  output = "morelights_modern:canlight_d",
  recipe = {
    {"dye:dark_grey", "default:steel_ingot", ""},
    {"default:steel_ingot", "morelights:bulb", "default:steel_ingot"},
  }
})

minetest.register_craft({
  output = "morelights_modern:canlight_l",
  recipe = {
    {"dye:white", "default:steel_ingot", ""},
    {"default:steel_ingot", "morelights:bulb", "default:steel_ingot"},
  }
})

minetest.register_craft({
  output = "morelights_modern:walllamp",
  recipe = {
    {"dye:white", morelights.glass, ""},
    {morelights.glass, "morelights:bulb", "default:steel_ingot"},
    {"", "dye:dark_grey", "default:steel_ingot"}
  }
})

minetest.register_craft({
  output = "morelights_modern:tablelamp_d",
  recipe = {
    {"wool:dark_grey", "morelights:bulb", "wool:dark_grey"},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:tablelamp_l",
  recipe = {
    {"wool:white", "morelights:bulb", "wool:white"},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:pathlight_d",
  recipe = {
    {"dye:dark_grey", "morelights:bulb", ""},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})

minetest.register_craft({
  output = "morelights_modern:pathlight_l",
  recipe = {
    {"dye:white", "morelights:bulb", ""},
    {"", "default:steel_ingot", ""},
    {"", "default:steel_ingot", ""}
  }
})
