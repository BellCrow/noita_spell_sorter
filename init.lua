--noita
--this comment tells my IDE to load the
-- noita api for auto completion and documetation

-- noita api
dofile_once("scripts/lib/utilities.lua")
-- order of these two imports is important
dofile_once("data/scripts/gun/gun_enums.lua")
dofile_once("data/scripts/gun/gun_actions.lua")

-- custom files
dofile_once("mods/noita_spell_sorter/util.lua")
dofile_once("mods/noita_spell_sorter/spellSorting.lua")

--TODO comment these out again
-- require("./util.lua")
--END TODO

function OnPlayerSpawned(_)
    GUI_HANDLE = GuiCreate()
    -- _GiveRandomSpells()
end
function GetIndexOfItem(item)
    local itemComponent = EntityGetComponentIncludingDisabled(item, "ItemComponent")
    if not itemComponent then
        return
    end

    ComponentGetValue2(itemComponent[1], "inventory_slot")
end
function SetIndexOfItem(item, index)
    local itemComponent = EntityGetComponentIncludingDisabled(item, "ItemComponent")
    if not itemComponent then
        return
    end

    ComponentSetValue2(itemComponent[1], "inventory_slot", index, 0)
end

----GAME----
function _GiveRandomSpells()
    local x, y = GetPlayerPosition()
    local itemId = EntityLoad("data/entities/items/pickup/random_card.xml", x + 10, y - 20)
    GamePickUpInventoryItem(GetPlayerId(), itemId, false)
    -- GamePickUpInventoryItem(PLAYER_ENTITY, "data/entities/items/pickup/thunderstone.xml")
end

function OnWorldPreUpdate()
    if AreSpellsStored() then
        -- in this case we sorted the spells in the previous iteration
        -- now we have to add them back to the inventory
        ReAddStoredSpells()
    end

    GuiStartFrame(GUI_HANDLE)
    -- GuiLayoutBeginHorizontal(GUI_HANDLE, 100, 0, true, 0, 0)
    -- if GuiButton(GUI_HANDLE, 0, 100, 100, "Give random spell") then
    --     _GiveRandomSpells()
    -- end
    if
        GameIsInventoryOpen()
        and GuiImageButton(GUI_HANDLE, 69420, 520, 20, "", "mods/noita_spell_sorter/assets/broom20.png")
    then
        PrintSpellInfos()
        SortInventory()
        -- PrintSpellInfos()
    end
    -- GuiLayoutEnd(GUI_HANDLE)
end
