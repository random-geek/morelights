local S = minetest.get_translator("morelights")


minetest.register_craftitem("morelights:bulb", {
    description = S("Light Bulb"),
    inventory_image = "morelights_bulb.png"
})

morelights.register_variants({
    {
        name = "morelights:pole_d",
        description = S("Metal Pole (@1)", S("dark")),
        tiles = {"morelights_metal_dark_32.png"},
        inventory_image = "morelights_pole_d_inv.png",
        wield_image = "morelights_pole_d_inv.png",

        on_place = function(itemstack, placer, pointed_thing)
            return morelights.on_place_hanging(itemstack, placer,
                    pointed_thing, "morelights:pole_ceiling_d")
        end
    },
    {
        name = "morelights:pole_l",
        description = S("Metal Pole (@1)", S("light")),
        tiles = {"morelights_metal_light_32.png"},
        inventory_image = "morelights_pole_l_inv.png",
        wield_image = "morelights_pole_l_inv.png",

        on_place = function(itemstack, placer, pointed_thing)
            return morelights.on_place_hanging(itemstack, placer,
                    pointed_thing, "morelights:pole_ceiling_l")
        end
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/32, -1/2, -1/32, 1/32, 1/2, 1/32}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16}
    },
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

morelights.register_variants({
    {
        name = "morelights:pole_ceiling_d",
        tiles = {"morelights_metal_dark_32.png"},
        drop = "morelights:pole_d"
    },
    {
        name = "morelights:pole_ceiling_l",
        tiles = {"morelights_metal_light_32.png"},
        drop = "morelights:pole_l"
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-3/16, -7/16, -3/16, 3/16, -1/2, 3/16},
            {-1/32, 1/2, -1/32, 1/32, -7/16, 1/32}
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-3/16, -7/16, -3/16, 3/16, -1/2, 3/16},
            {-1/16, 1/2, -1/16, 1/16, -7/16, 1/16}
        }
    },
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1, not_in_creative_inventory = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

morelights.register_variants({
    {
        name = "morelights:chain_d",
        description = S("Metal Chain (@1)", S("dark")),
        tiles = {"morelights_metal_dark_32.png"},
        inventory_image = "morelights_chain_d_inv.png",
        wield_image = "morelights_chain_d_inv.png",

        on_place = function(itemstack, placer, pointed_thing)
            return morelights.on_place_hanging(itemstack, placer,
                pointed_thing, "morelights:chain_ceiling_d")
        end
    },
    {
        name = "morelights:chain_l",
        description = S("Metal Chain (@1)", S("light")),
        tiles = {"morelights_metal_light_32.png"},
        inventory_image = "morelights_chain_l_inv.png",
        wield_image = "morelights_chain_l_inv.png",

        on_place = function(itemstack, placer, pointed_thing)
            return morelights.on_place_hanging(itemstack, placer,
                pointed_thing, "morelights:chain_ceiling_l")
        end
    }
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
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

morelights.register_variants({
    {
        name = "morelights:chain_ceiling_d",
        tiles = {"morelights_metal_dark_32.png"},
        drop = "morelights:chain_d"
    },
    {
        name = "morelights:chain_ceiling_l",
        tiles = {"morelights_metal_light_32.png"},
        drop = "morelights:chain_l"
    }
},
{
    drawtype = "mesh",
    mesh = "morelights_chain_ceiling.obj",
    collision_box = {
        type = "fixed",
        fixed = {
            {-3/16, 7/16, -3/16, 3/16, 1/2, 3/16},
            {-1/16, -1/2, -1/16, 1/16, 7/16, 1/16}
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-3/16, 7/16, -3/16, 3/16, 1/2, 3/16},
            {-1/16, -1/2, -1/16, 1/16, 7/16, 1/16}
        }
    },
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1, not_in_creative_inventory = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

--
-- Craft recipes
--

local a = morelights.craft_items

minetest.register_craft({
    output = "morelights:bulb",
    recipe = {
        {"", a.glass, ""},
        {"", a.copper, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights:pole_d 2",
    recipe = {
        {a.dye_dark, a.steel, ""},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights:pole_l 2",
    recipe = {
        {a.dye_light, a.steel, ""},
        {"", a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights:chain_d",
    recipe = {
        {a.dye_dark, a.steel, ""},
        {"", "", ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights:chain_l",
    recipe = {
        {a.dye_light, a.steel, ""},
        {"", "", ""},
        {"", a.steel, ""}
    }
})
