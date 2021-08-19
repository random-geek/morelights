morelights = {}

-- TODO: Change node definition based on game if groups get too unwieldy.

function morelights.register_variants(variants, fixedDef)
    for _, variant in ipairs(variants) do
        local name = variant.name
        local def = table.copy(fixedDef)

        for k, v in pairs(variant) do
            if k ~= "name" then
                def[k] = v
            end
        end

        minetest.register_node(name, def)
    end
end

function morelights.on_place_hanging(itemstack, placer, pointed_thing,
            ceilingName)
    local ceiling = minetest.get_node(
        vector.add(pointed_thing.above, vector.new(0, 1, 0)))

    if ceiling.name ~= "air"
            and minetest.get_item_group(ceiling.name, "mounted_ceiling") == 0
            and not (placer and placer:get_player_control().sneak) then
        -- Create a dummy itemstack with the ceiling variant's name.
        local fakeStack = ItemStack(itemstack)
        fakeStack:set_name(ceilingName)

        minetest.item_place(fakeStack, placer, pointed_thing, 0)

        -- Subtract an item from the real itemstack if a node was placed.
        itemstack:set_count(fakeStack:get_count())
        return itemstack
    end

    minetest.item_place(itemstack, placer, pointed_thing, 0)
    return itemstack
end

function morelights.rotate_and_place(itemstack, placer, pointed_thing, lookup)
    local dir = minetest.dir_to_wallmounted(
            vector.subtract(pointed_thing.under, pointed_thing.above))
    local fDirs = lookup or {[0] = 20, 0, 16, 12, 8, 4}
    minetest.item_place(itemstack, placer, pointed_thing, fDirs[dir] or 0)
    return itemstack
end


if minetest.get_modpath("mcl_core") then
    morelights.game = "mineclone2"
elseif minetest.get_modpath("default") then
    morelights.game = "minetest_game"
elseif minetest.get_modpath("hades_core") then
    morelights.game = "hades_revisited"
else
    error("Morelights requires a compatible game " ..
          "(Minetest Game, MineClone 2, or Hades Revisited).")
end

if morelights.game == "minetest_game" then
    morelights.sounds = {
        default = default.node_sound_defaults(),
        glass = default.node_sound_glass_defaults(),
        metal = default.node_sound_metal_defaults()
    }
elseif morelights.game == "mineclone2" then
    morelights.sounds = {
        default = mcl_sounds.node_sound_defaults(),
        glass = mcl_sounds.node_sound_glass_defaults(),
        metal = mcl_sounds.node_sound_metal_defaults()
    }
elseif morelights.game == "hades_revisited" then
    morelights.sounds = {
        default = hades_sounds.node_sound_defaults(),
        glass = hades_sounds.node_sound_glass_defaults(),
        metal = hades_sounds.node_sound_metal_defaults()
    }
end

morelights.craft_items = {
    glass = "default:glass",
    glass_pane = "xpanes:pane_flat",
    steel = "default:steel_ingot",
    copper = "default:copper_ingot",
    tin = "default:tin_ingot",
    crystal_fragment = "default:mese_crystal_fragment",
    dye_dark = "dye:dark_grey",
    dye_light = "dye:white",
    wool_dark = "wool:dark_grey",
    wool_light = "wool:white",
    wood_dark = "default:junglewood",
    stone_block = "default:stone_block",
    sandstone_block = "default:sandstone_block",
    dirt = "default:dirt",
    grass = "default:grass_1",
    string = "farming:string",
    stick = "default:stick",
}

local a = morelights.craft_items

if morelights.game == "mineclone2" then
    a.glass = "mcl_core:glass"
    a.glass_pane = "xpanes:pane_natural_flat"
    a.steel = "mcl_core:iron_ingot"
    -- MCL has neither copper nor tin. :(
    a.copper = "mesecons:redstone"
    a.tin = "mcl_core:iron_ingot"
    a.crystal_fragment = "mcl_nether:quartz"
    a.dye_dark = "mcl_dye:dark_grey"
    a.dye_light = "mcl_dye:white"
    a.wool_dark = "mcl_wool:grey"
    a.wool_light = "mcl_wool:white"
    a.wood_dark = "mcl_core:sprucewood"
    a.stone_block = "mcl_core:stone_smooth"
    a.sandstone_block = "mcl_core:sandstonesmooth"
    a.dirt = "mcl_core:dirt"
    a.grass = "mcl_flowers:tallgrass"
    a.string = "mcl_mobitems:string"
    a.stick = "mcl_core:stick"
elseif morelights.game == "hades_revisited" then
    a.glass = "hades_core:glass"
    -- HR doesn't have glass panes. :(
    a.glass_pane = "hades_core:glass"
    if minetest.get_modpath("hades_xpanes") then
        a.glass_pane = "hades_xpanes:pane_flat"
    end

    a.steel = "hades_core:steel_ingot"
    a.copper = "hades_core:copper_ingot"
    a.tin = "hades_core:tin_ingot"
    a.crystal_fragment = "hades_core:mese_crystal_fragment"
    a.dye_dark = "dye:dark_grey"
    a.dye_light = "dye:white"
    a.wool_dark = "wool:grey"
    a.wool_light = "wool:white"
    a.wood_dark = "hades_trees:jungle_wood"
    a.stone_block = "hades_core:stone_block"
    a.sandstone_block = "hades_core:sandstone"
    a.dirt = "hades_core:dirt"
    a.grass = "hades_grass:grass_1"
    a.string = "hades_farming:cotton"
    a.stick = "hades_core:stick"
end

-- Use basic_materials brass if available, otherwise register our own.
if minetest.get_modpath("basic_materials") then
    a.brass = "basic_materials:brass_ingot"
end

local path = minetest.get_modpath("morelights")
dofile(path .. "/nodes.lua")
