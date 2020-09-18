morelights = {}

function morelights.register_variants(variants, fixedDef)
    for _, variant in ipairs(variants) do
        local name = variant.name
        local def = table.copy(fixedDef)

        for k,v in pairs(variant) do
            if k ~= "name" then
                def[k] = v
            end
        end

        minetest.register_node(name, def)
    end
end

function morelights.on_place_hanging(itemstack, placer, pointed_thing, replaceName)
    local ceiling = minetest.get_node(vector.add(pointed_thing.above,
        {x=0, y=1, z=0}))

    if ceiling and ceiling.name ~= "air"
        and minetest.get_item_group(ceiling.name, "mounted_ceiling") == 0
        and not (placer and placer:get_player_control().sneak) then

        local name = itemstack:get_name()
        local fakestack = itemstack
        fakestack:set_name(replaceName)

        minetest.item_place(fakestack, placer, pointed_thing, 0)
        itemstack:set_name(name)

        return itemstack
    end

    minetest.item_place(itemstack, placer, pointed_thing, 0)
    return itemstack
end

function morelights.rotate_and_place(itemstack, placer, pointed_thing, lookup)
    local dir = minetest.dir_to_wallmounted(vector.subtract(pointed_thing.under, pointed_thing.above))
    local fDirs = lookup or {[0] = 20, 0, 16, 12, 8, 4}
    minetest.item_place(itemstack, placer, pointed_thing, fDirs[dir] or 0)
    return itemstack
end


morelights.craft_items = {
    glass = "default:glass",
    glass_pane = "default:glass",
    steel = "default:steel_ingot",
    copper = "default:copper_ingot",
    mese_fragment = "default:mese_crystal_fragment",
    dye_dark = "dye:dark_grey",
    dye_light = "dye:white",
    wool_dark = "wool:dark_grey",
    wool_light = "wool:white",
    wood_dark = "default:junglewood",
    cotton = "farming:cotton",
    dirt = "default:dirt",
    stone_block = "default:stone_block",
    sandstone_block = "default:sandstone_block",
    grass = "default:grass_1",
}

if minetest.get_modpath("xpanes") then
    morelights.craft_items.glass_pane = "xpanes:pane_flat"
end

-- Use basic_materials brass if available, otherwise register our own.
if minetest.get_modpath("basic_materials") then
    morelights.craft_items.brass = "basic_materials:brass_ingot"
end

local path = minetest.get_modpath("morelights")

dofile(path .. DIR_DELIM .. "nodes.lua")
