local S = minetest.get_translator("morelights_modern")


minetest.register_node("morelights_modern:block", {
    description = S("Modern Light Block"),
    tiles = {"morelights_metal_dark.png^morelights_modern_block.png"},
    paramtype = "light",
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_modern:smallblock", {
    description = S("Modern Light Block (small)"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/4, -1/2, -1/4, 1/4, 0, 1/4}
    },
    tiles = {
        "morelights_metal_dark.png^morelights_modern_smallblock.png",
        "morelights_metal_dark.png^morelights_modern_smallblock.png",
        "[combine:16x16:0,0=morelights_metal_dark.png" ..
                ":0,4=morelights_modern_smallblock.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing)
    end
})

morelights.register_variants({
    {
        name = "morelights_modern:post_d",
        description = S("Modern Post Light (@1)", S("dark")),
        tiles = {
            "morelights_metal_dark.png",
            "morelights_metal_dark.png",
            "morelights_metal_dark.png^morelights_modern_post.png"
        }
    },
    {
        name = "morelights_modern:post_l",
        description = S("Modern Post Light (@1)", S("light")),
        tiles = {
            "morelights_metal_light.png",
            "morelights_metal_light.png",
            "morelights_metal_light.png^morelights_modern_post.png"
        }
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.metal
})

morelights.register_variants({
    {
        name = "morelights_modern:streetpost_d",
        description = S("Street Lamp Post (@1) - connects to bar lights",
                S("dark")),
        tiles = {"morelights_metal_dark.png"}
    },
    {
        name = "morelights_modern:streetpost_l",
        description = S("Street Lamp Post (@1) - connects to bar lights",
                S("light")),
        tiles = {"morelights_metal_light.png"}
    }
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
    connects_to = {
        "morelights_modern:barlight_c",
        "morelights_modern:barlight_s"
    },
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.metal
})

minetest.register_node("morelights_modern:barlight_c", {
    description = S("Ceiling Bar Light (connecting)"),
    drawtype = "nodebox",
    node_box = {
        type = "connected",
        fixed = {-1/8,  3/8, -1/8, 1/8,  1/2, 1/8},
        connect_front = {-1/8, 3/8, -1/2, 1/8,  1/2, -1/8},
        connect_left = {-1/2, 3/8, -1/8, -1/8, 1/2, 1/8},
        connect_back = {-1/8, 3/8, 1/8, 1/8, 1/2, 1/2},
        connect_right = {1/8, 3/8, -1/8, 1/2, 1/2, 1/8},
    },
    connects_to = {
        "morelights_modern:barlight_c",
        "morelights_modern:barlight_s",
        "morelights_modern:streetpost_d",
        "morelights_modern:streetpost_l"
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_modern_barlight.png",
        "morelights_metal_dark.png"
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.15,
    sounds = morelights.sounds.glass
})

-- TODO: Determine orientation of bar lights from nearby nodes.
minetest.register_node("morelights_modern:barlight_s", {
    description = S("Ceiling Bar Light (straight)"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/2, 3/8, -1/8, 1/2, 1/2, 1/8},
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_modern_barlight.png",
        "morelights_metal_dark.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.15,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_modern:ceilinglight", {
    description = S("Modern Ceiling Light"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/4, 3/8, -1/4, 1/4, 1/2, 1/4}
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_metal_dark.png^morelights_modern_block.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing,
            {[0] = 0, 20, 12, 16, 4, 8})
    end
})

morelights.register_variants({
    {
        name = "morelights_modern:canlight_d",
        description = S("Modern Can Light (@1)", S("dark")),
        tiles = {"morelights_metal_dark.png^morelights_modern_canlight.png"}
    },
    {
        name = "morelights_modern:canlight_l",
        description = S("Modern Can Light (@1)", S("light")),
        tiles = {"morelights_metal_light.png^morelights_modern_canlight.png"}
    },
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
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

minetest.register_node("morelights_modern:walllamp", {
    description = S("Modern Wall Lamp"),
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
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing,
            {[0] = 6, 4, 1, 3, 0, 2})
    end
})

morelights.register_variants({
    {
        name = "morelights_modern:tablelamp_d",
        description = S("Modern Table Lamp (@1)", S("dark")),
        tiles = {
            "morelights_metal_light_32.png^morelights_modern_tablelamp_o.png",
            "morelights_modern_tablelamp_d.png"
        }
    },
    {
        name = "morelights_modern:tablelamp_l",
        description = S("Modern Table Lamp (@1)", S("light")),
        tiles = {
            "morelights_metal_dark_32.png^morelights_modern_tablelamp_o.png",
            "morelights_modern_tablelamp_l.png"
        }
    },
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
    sunlight_propagates = true,
    light_source = 10,
    groups = {choppy = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.default
})

morelights.register_variants({
    {
        name = "morelights_modern:pathlight_d",
        description = S("Modern Path Light (@1)", S("dark")),
        tiles = {
            "morelights_metal_dark_32.png^morelights_modern_pathlight.png"
        }
    },
    {
        name = "morelights_modern:pathlight_l",
        description = S("Modern Path Light (@1)", S("light")),
        tiles = {
            "morelights_metal_light_32.png^morelights_modern_pathlight.png"
        }
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-1/32, -8/16, -1/32, 1/32, 1/8, 1/32},
            {-1/16, 1/8, -1/16, 1/16, 5/16, 1/16},
            {-1/8, 5/16, -1/8, 1/8, 3/8, 1/8}
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 3/8, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 8,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

--
-- Craft recipes
--

local a = morelights.craft_items

minetest.register_craft({
    output = "morelights_modern:block",
    recipe = {
        {"", a.steel, ""},
        {a.glass_pane, "morelights:bulb", a.glass_pane},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:smallblock",
    recipe = {
        {"", a.glass_pane, ""},
        {a.steel, "morelights:bulb", a.steel}
    }
})

minetest.register_craft({
    output = "morelights_modern:post_d",
    recipe = {
        {a.dye_dark, a.steel, ""},
        {"", "morelights:bulb", ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:post_l",
    recipe = {
        {a.dye_light, a.steel, ""},
        {"", "morelights:bulb", ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:streetpost_d 2",
    recipe = {
        {a.dye_dark, a.steel, a.steel},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:streetpost_l 2",
    recipe = {
        {a.dye_light, a.steel, a.steel},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:barlight_c 4",
    recipe = {
        {a.steel, a.steel, a.steel},
        {a.copper, a.glass, a.copper}
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
        {a.steel, "morelights:bulb", a.steel},
        {"", a.glass_pane, ""},
    }
})

minetest.register_craft({
    output = "morelights_modern:canlight_d",
    recipe = {
        {a.dye_dark, a.steel, ""},
        {a.steel, "morelights:bulb", a.steel},
    }
})

minetest.register_craft({
    output = "morelights_modern:canlight_l",
    recipe = {
        {a.dye_light, a.steel, ""},
        {a.steel, "morelights:bulb", a.steel},
    }
})

minetest.register_craft({
    output = "morelights_modern:walllamp",
    recipe = {
        {"", a.glass_pane, ""},
        {a.glass_pane, "morelights:bulb", a.steel},
        {"", a.dye_dark, a.steel}
    }
})

minetest.register_craft({
    output = "morelights_modern:tablelamp_d",
    recipe = {
        {"", a.steel, ""},
        {a.wool_dark, "morelights:bulb", a.wool_dark},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:tablelamp_l",
    recipe = {
        {"", a.steel, ""},
        {a.wool_light, "morelights:bulb", a.wool_light},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:pathlight_d",
    recipe = {
        {a.dye_dark, "morelights:bulb", ""},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_modern:pathlight_l",
    recipe = {
        {a.dye_light, "morelights:bulb", ""},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})
