local S = minetest.get_translator("morelights_vintage")


-- Register custom brass ingot if a suitable replacement doesn't exist.
if morelights.craft_items.brass == nil then
    morelights.craft_items.brass = "morelights_vintage:brass_ingot"

    minetest.register_craftitem("morelights_vintage:brass_ingot", {
        description = S("Brass Ingot"),
        inventory_image = "default_steel_ingot.png^[multiply:#FFCE69"
    })

    minetest.register_craft({
        output = "morelights_vintage:brass_ingot 2",
        type = "shapeless",
        recipe = {
            morelights.craft_items.copper,
            morelights.craft_items.tin
        }
    })
end

minetest.register_node("morelights_vintage:chain_b", {
    description = S("Brass Chain"),
    drawtype = "mesh",
    mesh = "morelights_chain.obj",
    collision_box = {
        type = "fixed",
        fixed = {-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}
    },
    tiles = {"morelights_vintage_brass_32.png"},
    inventory_image = "morelights_vintage_chain_b_inv.png",
    wield_image = "morelights_vintage_chain_b_inv.png",
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.on_place_hanging(itemstack, placer, pointed_thing,
            "morelights_vintage:chain_ceiling_b")
    end
})

minetest.register_node("morelights_vintage:chain_ceiling_b", {
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
    tiles = {"morelights_vintage_brass_32.png"},
    drop = "morelights_vintage:chain_b",
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1,
              mounted_ceiling = 1, mounted_ceiling = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

minetest.register_node("morelights_vintage:block", {
    description = S("Vintage Light Block"),
    tiles = {"morelights_vintage_block_glass.png^morelights_vintage_block_frame.png"},
    paramtype = "light",
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_vintage:smallblock", {
    description = S("Vintage Light Block (small)"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/4, -1/2, -1/4, 1/4, 0, 1/4}
    },
    tiles = {
        "morelights_vintage_block_glass.png^morelights_vintage_block_frame.png",
        "morelights_vintage_block_glass.png^morelights_vintage_block_frame.png",
        "[combine:16x16:0,4=" ..
            "(morelights_vintage_block_glass.png^morelights_vintage_block_frame.png)"
    },
    use_texture_alpha = "opaque",
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing)
    end
})

minetest.register_node("morelights_vintage:lantern_f", {
    description = S("Vintage Lantern (floor, wall, or ceiling)"),
    drawtype = "mesh",
    mesh = "morelights_vintage_lantern_f.obj",
    tiles = {
        "morelights_vintage_lantern_frame.png^morelights_vintage_lantern_glass.png",
        "morelights_metal_dark_32.png"
    },
    use_texture_alpha = "opaque",
    collision_box = {
        type = "fixed",
        fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-3/16, -1/2, -3/16, 3/16, 1/16, 3/16}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        local wdir = minetest.dir_to_wallmounted(
                vector.subtract(pointed_thing.under, pointed_thing.above))
        local fakeStack = ItemStack(itemstack)

        if wdir == 0 then
            fakeStack:set_name("morelights_vintage:lantern_c")
        elseif wdir == 1 then
            fakeStack:set_name("morelights_vintage:lantern_f")
        else
            fakeStack:set_name("morelights_vintage:lantern_w")
        end

        minetest.item_place(fakeStack, placer, pointed_thing, wdir)
        itemstack:set_count(fakeStack:get_count())

        return itemstack
    end
})

minetest.register_node("morelights_vintage:lantern_c", {
    drawtype = "mesh",
    mesh = "morelights_vintage_lantern_c.obj",
    tiles = {
        "morelights_vintage_lantern_frame.png^morelights_vintage_lantern_glass.png",
        "morelights_metal_dark_32.png"
    },
    use_texture_alpha = "opaque",
    collision_box = {
        type = "fixed",
        fixed = {-3/16, -1/16, -3/16, 3/16, 1/2, 3/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-3/16, 0, -3/16, 3/16, 1/2, 3/16}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1,
              not_in_creative_inventory = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,
    drop = "morelights_vintage:lantern_f"
})

minetest.register_node("morelights_vintage:lantern_w", {
    drawtype = "mesh",
    mesh = "morelights_vintage_lantern_w.obj",
    tiles = {
        "morelights_vintage_lantern_frame.png^morelights_vintage_lantern_glass.png",
        "morelights_metal_dark_32.png"
    },
    use_texture_alpha = "clip",
    collision_box = {
        type = "fixed",
        fixed = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-3/16, -1/4, -5/16, 3/16, 1/8, 3/16}
    },
    paramtype = "light",
    paramtype2 = "wallmounted",
    sunlight_propagates = true,
    light_source = 12,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1,
              not_in_creative_inventory = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,
    drop = "morelights_vintage:lantern_f"
})

minetest.register_node("morelights_vintage:hangingbulb", {
    description = S("Vintage Hanging Light Bulb"),
    drawtype = "mesh",
    mesh = "morelights_vintage_hangingbulb.obj",
    tiles = {
        "morelights_vintage_hangingbulb.png" ..
                "^[lowpart:50:morelights_metal_dark_32.png"
    },
    inventory_image = "morelights_vintage_hangingbulb_inv.png",
    wield_image = "morelights_vintage_hangingbulb_inv.png",
    use_texture_alpha = "blend",
    collision_box = {
        type = "fixed",
        fixed = {-1/8, -1/8, -1/8, 1/8, 1/2, 1/8}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, -1/8, -1/8, 1/8, 1/2, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 10,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.15,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_vintage:oillamp", {
    description = S("Vintage Oil Lamp"),
    drawtype = "mesh",
    mesh = "morelights_vintage_oillamp.obj",
    tiles = {
        {
            name = "morelights_vintage_oil_flame.png",
            animation = {
                type = "sheet_2d",
                frames_w = 16,
                frames_h = 1,
                frame_length = 0.3
            }
        },
        "morelights_vintage_oillamp.png",
        "morelights_vintage_brass_32.png"
    },
    use_texture_alpha = "clip",
    collision_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 1/4, 1/8}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 1/4, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 8,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_vintage:chandelier", {
    description = S("Vintage Chandelier"),
    drawtype = "mesh",
    mesh = "morelights_vintage_chandelier.obj",
    tiles = {
        "morelights_vintage_chandelier.png",
        "morelights_vintage_brass_32.png^[multiply:#DFDFDF"
    },
    use_texture_alpha = "clip",
    collision_box = {
        type = "fixed",
        fixed = {-3/8, -1/2, -3/8, 3/8, 1/2, 3/8}
    },
    selection_box = {
        type = "fixed",
        fixed = {-3/8, -1/2, -3/8, 3/8, 1/2, 3/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 10,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.glass
})

--
-- Craft recipes
--

local a = morelights.craft_items

minetest.register_craft({
    output = "morelights_vintage:chain_b",
    recipe = {
        {"", a.brass, ""},
        {"", "", ""},
        {"", a.brass, ""}
    }
})

minetest.register_craft({
    output = "morelights_vintage:block",
    recipe = {
        {"", a.wood_dark, ""},
        {a.glass_pane, "morelights:bulb", a.glass_pane},
        {"", a.wood_dark, ""}
    }
})

minetest.register_craft({
    output = "morelights_vintage:smallblock",
    recipe = {
        {"", a.glass_pane, ""},
        {a.wood_dark, "morelights:bulb", a.wood_dark}
    }
})

minetest.register_craft({
    output = "morelights_vintage:lantern_f",
    recipe = {
        {"", a.steel, ""},
        {a.glass_pane, "morelights:bulb", a.glass_pane},
        {a.stick, a.steel, a.stick}
    }
})

minetest.register_craft({
    output = "morelights_vintage:hangingbulb",
    recipe = {
        {"", a.steel, ""},
        {"", a.copper, ""},
        {"", "morelights:bulb", ""}
    }
})

minetest.register_craft({
    output = "morelights_vintage:oillamp",
    recipe = {
        {"", a.glass, ""},
        {"", a.string, ""},
        {"", a.brass, ""}
    }
})

minetest.register_craft({
    output = "morelights_vintage:chandelier",
    recipe = {
        {"", a.brass, ""},
        {"morelights:bulb", a.brass, "morelights:bulb"},
        {a.steel, a.brass, a.steel}
    }
})
