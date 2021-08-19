local S = minetest.get_translator("morelights_extras")


minetest.register_node("morelights_extras:f_block", {
    description = S("Futuristic Light Block"),
    tiles = {"morelights_extras_f_block.png"},
    paramtype = "light",
    light_source = minetest.LIGHT_MAX,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.glass
})

do
    local def = {
        description = S("Grass Light"),
        tiles = {
            "default_grass.png^morelights_extras_blocklight.png",
            "default_dirt.png",
            "default_dirt.png^default_grass_side.png"
        },
        paramtype = "light",
        light_source = 12,
        groups = {
            cracky = 2,
            oddly_breakable_by_hand = 3,
            handy = 1,
            soil = 1,
        },
        _mcl_hardness = 0.3,
        sounds = morelights.sounds.glass
    }

    if morelights.game == "mineclone2" then
        -- For MineClone 2, use node coloring to match environment.
        -- See the mcl_core:dirt_with_grass definition in
        -- ITEMS/mcl_core/nodes_base.lua.
        def.tiles = {
            "mcl_core_grass_block_top.png",
            {name = "default_dirt.png", color = "#FFFFFF"}
        }
        def.overlay_tiles = {
            {name = "morelights_extras_blocklight.png", color = "#FFFFFF"},
            "",
            {
                name = "mcl_core_grass_block_side_overlay.png",
                tileable_vertical = false
            }
        }
        def.paramtype2 = "color"
        def.palette = "mcl_core_palette_grass.png"
        def.palette_index = 0
        def.color = "#55aa60"
        def.drop = "morelights_extras:dirt_with_grass"

        def.on_construct = function(pos)
            local node = minetest.get_node(pos)
            if node.param2 == 0 then
                local grass_node = mcl_core.get_grass_block_type(pos)
                if grass_node.param2 ~= 0 then
                    minetest.set_node(pos, {
                        name = "morelights_extras:dirt_with_grass",
                        param2 = grass_node.param2
                    })
                end
            end
        end
    elseif morelights.game == "hades_revisited" then
        -- For Hades Revisited, grass color is seasonal.
        -- See hades_core/dirt.lua, ABM in hades_core/functions.lua.
        def.tiles = {
            "hades_core_grass_cover_colorable.png",
            {name = "default_dirt.png", color = "#FFFFFF"},
        }
        def.overlay_tiles = {
            {name = "morelights_extras_blocklight.png", color = "#FFFFFF"},
            "",
            {
                name = "hades_core_grass_side_cover_colorable.png",
                tileable_vertical = false
            },
        }
        def.paramtype2 = "color"
        def.palette = "hades_core_palette_grass.png"
        def.palette_index = 0
        def.color = "#acef6a"
        -- To enable seasonal grass coloring.
        def.groups.dirt_with_grass = 1
        -- To prevent color retention on digging.
        def.drop = "morelights_extras:dirt_with_grass"

        def.on_place = function(itemstack, placer, pointed_thing)
            local param2 = hades_core.get_seasonal_grass_color_param2()
            return minetest.item_place(itemstack, placer, pointed_thing, param2)
        end
    end

    minetest.register_node("morelights_extras:dirt_with_grass", def)
end

do
    local tile = "default_stone_block.png"
    if morelights.game == "mineclone2" then
        tile = "mcl_stairs_stone_slab_top.png"
    end

    minetest.register_node("morelights_extras:stone_block", {
        description = S("Stone Block Light"),
        tiles = {tile .. "^morelights_extras_blocklight.png"},
        paramtype = "light",
        light_source = 12,
        groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
        _mcl_hardness = 0.3,
        sounds = morelights.sounds.glass
    })
end

do
    local tile = "default_sandstone_block.png"
    if morelights.game == "mineclone2" then
        tile = "mcl_core_sandstone_smooth.png"
    elseif morelights.game == "hades_revisited" then
        tile = "default_sandstone.png"
    end

    minetest.register_node("morelights_extras:sandstone_block", {
        description = S("Sandstone Block Light"),
        tiles = {tile .. "^morelights_extras_blocklight.png"},
        paramtype = "light",
        light_source = 12,
        groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
        _mcl_hardness = 0.3,
        sounds = morelights.sounds.glass
    })
end

minetest.register_node("morelights_extras:stairlight", {
    description = S("Stair Light (place on stairs)"),
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
    inventory_image = "morelights_extras_stairlight_inv.png",
    wield_image = "morelights_extras_stairlight_inv.png",
    paramtype = "light",
    paramtype2 = "facedir",
    light_source = 10,
    sunlight_propagates = true,
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1,
              attached_node = 1},
    _mcl_hardness = 0.15,
    node_placement_prediction = "",
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        if pointed_thing.type ~= "node" then
            return itemstack
        end

        -- See builtin/game/item.lua.
        local node = minetest.get_node(pointed_thing.under)

        if placer and not placer:get_player_control().sneak then
            local def = minetest.registered_nodes[node.name]
            if def and def.on_rightclick then
                return def.on_rightclick(pointed_thing.under, node, placer,
                        itemstack, pointed_thing) or itemstack
            end
        end

        if node.param2 < 4
                and (node.name:match("^stairs:stair_")
                  or node.name:match("^mcl_stairs:stair_")) then
            -- Set `above` to the node actually above the stair, since that's
            -- where the node is placed.
            pointed_thing.above =
                    vector.add(pointed_thing.under, vector.new(0, 1, 0))
            return minetest.item_place_node(itemstack, placer, pointed_thing,
                    node.param2)
        end

        return itemstack
    end,

    on_rotate = screwdriver.rotate_simple
})

--
-- Craft recipes
--

local a = morelights.craft_items

minetest.register_craft({
    output = "morelights_extras:f_block",
    recipe = {
        {a.crystal_fragment, a.steel, a.crystal_fragment},
        {a.glass_pane, "morelights:bulb", a.glass_pane},
        {a.crystal_fragment, a.steel, a.crystal_fragment}
    }
})

minetest.register_craft({
    output = "morelights_extras:dirt_with_grass",
    recipe = {
        {"", a.glass_pane, ""},
        {"", "morelights:bulb", ""},
        {a.grass, a.dirt, ""}
    }
})

minetest.register_craft({
    output = "morelights_extras:stone_block",
    recipe = {
        {"", a.glass_pane, ""},
        {"", "morelights:bulb", ""},
        {"", a.stone_block, ""}
    }
})

minetest.register_craft({
    output = "morelights_extras:sandstone_block",
    recipe = {
        {"", a.glass_pane, ""},
        {"", "morelights:bulb", ""},
        {"", a.sandstone_block, ""}
    }
})

minetest.register_craft({
    output = "morelights_extras:stairlight",
    recipe = {
        {a.steel, "morelights:bulb", a.steel}
    }
})
