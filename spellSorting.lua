---@module 'util.lua'

-- order of these two imports is important
dofile_once("data/scripts/gun/gun_enums.lua")
dofile_once("data/scripts/gun/gun_actions.lua")
dofile_once("data/scripts/lib/utilities.lua")

-- custom files
dofile_once("mods/noita_spell_sorter/util.lua")

local storedSpells = {}

--- The list of spells to sort. These must be entity ids of the
--- card_action entities in the players "full_inventory" (is one of the children of the players entity)
--- Returns the list of the spell ids, but sorted according to some criteria.
--- !!! The given table might be sorted in place or a new table might be returned !!!
---@param spells integer[]
---@return integer[]
function SortSpells(spells)
    for i, v in ipairs(spells) do
    end
end

local function GetSpellActionId(spellId)
    assert(spellId and type(spellId) == "number")
    local spellsItemActionComponent = GetFirstComponentWithName(spellId, "ItemActionComponent")
    local spellActionId = GetValueOfFirstMemberWithName(spellsItemActionComponent, "action_id")
    return spellActionId
end

--- Returns the type of a given spell as a number
--- Where the following mapping holds:
--- 0 => ACTION_TYPE_PROJECTILE
--- 1 => ACTION_TYPE_STATIC_PROJECTILE
--- 2 => ACTION_TYPE_MODIFIER
--- 3 => ACTION_TYPE_DRAW_MANY
--- 4 => ACTION_TYPE_MATERIAL
--- 5 => ACTION_TYPE_OTHER
--- 6 => ACTION_TYPE_UTILITY
--- 7 => ACTION_TYPE_PASSIVE
--- You can use the 'SpellTypeToReadableName' function
--- to get a human readable name for this number
--- @param spellId integer
---@return string
function GetSpellType(spellId)
    assert(spellId and type(spellId) == "number")
    local spellActionId = GetSpellActionId(spellId)
    -- look into the global action list for the spells id.
    -- this table will also contain the type

    local foundAction = nil
    for i, action in ipairs(actions) do
        if action.id == spellActionId then
            foundAction = action
            break
        end
    end
    assert(
        foundAction,
        string.format("Could not find a spell in the actions list with the action id %s", tostring(spellActionId))
    )
    assert(
        foundAction.type ~= nil,
        string.format(
            "The found action entry in the actions table for spell %s has no field for the type",
            spellActionId
        )
    )
    return foundAction.type
end

function ConvertSpellTypeToReadableName(spellType)
    local spellTypeToHumanReadable = {}
    spellTypeToHumanReadable[0] = "ACTION_TYPE_PROJECTILE"
    spellTypeToHumanReadable[1] = "ACTION_TYPE_STATIC_PROJECTILE"
    spellTypeToHumanReadable[2] = "ACTION_TYPE_MODIFIER"
    spellTypeToHumanReadable[3] = "ACTION_TYPE_DRAW_MANY"
    spellTypeToHumanReadable[4] = "ACTION_TYPE_MATERIAL"
    spellTypeToHumanReadable[5] = "ACTION_TYPE_OTHER"
    spellTypeToHumanReadable[6] = "ACTION_TYPE_UTILITY"
    spellTypeToHumanReadable[7] = "ACTION_TYPE_PASSIVE"

    assert(spellTypeToHumanReadable[spellType], string.format("The given spellType %s is not recognized", spellType))
    return spellTypeToHumanReadable[spellType]
end

local function SpellTypeToSortNumber(spellId)
    local spellTypeToSortNumberMapping = {
        { "ACTION_TYPE_PROJECTILE", 0 },
        { "ACTION_TYPE_STATIC_PROJECTILE", 1 },
        { "ACTION_TYPE_MODIFIER", 2 },
        { "ACTION_TYPE_DRAW_MANY", 3 },
        { "ACTION_TYPE_MATERIAL", 4 },
        { "ACTION_TYPE_OTHER", 5 },
        { "ACTION_TYPE_UTILITY", 6 },
        { "ACTION_TYPE_PASSIVE", 7 },
    }
    assert(spellId and type(spellId) == "number")
    local spellsItemActionComponent = GetFirstComponentWithName(spellId, "ItemActionComponent")
    local spellActionId = GetValueOfFirstMemberWithName(spellsItemActionComponent, "action_id")
end

--- Returns a list of all spell ids currently in the inventory
---@return number[]
local function GetAllSpellIds()
    local inventory = GetInventoryFull()
    local spellIds = EntityGetAllChildren(inventory)
    if spellIds == nil then
        return {}
    end
    return spellIds
end

--- Prints information about the spells in the users inventory
function PrintSpellInfos()
    local spellIds = GetAllSpellIds()
    if #spellIds > 0 then
        print("-----------Spell inventory information-------------")
        for index, spellId in ipairs(spellIds) do
            print(
                string.format(
                    "Slot: %d | Entity-ID %d | action_id %s | type %s",
                    index,
                    spellId,
                    GetSpellActionId(spellId),
                    ConvertSpellTypeToReadableName(GetSpellType(spellId))
                )
            )
        end
        print("---------------------------------------------------")
    end
end

-- public api

local function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then
        tmp = tmp .. name .. " = "
    end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
            tmp = tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
    end

    return tmp
end

function SortInventory()
    local spellIds = GetAllSpellIds()
    if #spellIds > 0 then
        storedSpells = spellIds
        for _, spellId in ipairs(spellIds) do
            EntityRemoveFromParent(spellId)
        end
        -- -- debug_print_table(spellIds)
        -- table.sort(spellIds, function(spellA, spellB)
        --     return GetSpellType(spellA) < GetSpellType(spellB)
        -- end)
        -- we are doing 2 groupings and a sort of the spells one after another
        -- first we group by spelltype (projectile, modifier, material etc.)
        -- then we group by spell type (all multicasts of same type are adjacent)
        -- then we sort by the spell charges, so the spells with the least charges
        -- are on the left

        local grouped = GroupBy(spellIds, function(key)
            return GetSpellType(key)
        end)

        assert(grouped, "Somehow the grouping function returned nil ?????")

        for k, group in pairs(grouped) do
            group.values = GroupBy(group.values, function(spellId)
                return GetSpellActionId(spellId)
            end)
        end
        -- now the grouping table contains all spells grouped by type and then by spellid
        -- we go through this tree like object in order and assign indices
        -- print("Pre")
        -- debug_print_table(grouped)
        print(serializeTable(grouped))

        -- debug_print_table(grouped)

        -- print("Post")
        local inventoryIndex = 0
        table.sort(grouped, function(a, b)
            return a.key < b.key
        end)
        for _, group in ipairs(grouped) do
            for _, spellTypeGrouping in ipairs(group.values) do
                for _, spellGroupedByActionId in ipairs(spellTypeGrouping.values) do
                    -- this is kinda getting out of hand
                    -- for _, spellId in ipairs(spellActionIdGrouping.values) do
                    SetIndexOfItem(spellGroupedByActionId, inventoryIndex)

                    print(
                        string.format(
                            "Set index of spell(%s) %d to %d",
                            GetSpellActionId(spellGroupedByActionId),
                            spellGroupedByActionId,
                            inventoryIndex
                        )
                    )
                    inventoryIndex = inventoryIndex + 1
                    -- end
                end
            end

            -- SetIndexOfItem(spellId, index - 1)
            -- GetSpellInfos(spellId)
        end
    end
end

function AreSpellsStored()
    return storedSpells ~= nil and #storedSpells > 0
end

function ReAddStoredSpells()
    assert(
        AreSpellsStored(),
        "There are no spells to restore. Consider checking if spells are stored with 'AreSpellsStored' function"
    )
    local fullInventory = GetInventoryFull()
    for _, spellId in ipairs(storedSpells) do
        EntityAddChild(fullInventory, spellId)
    end
    storedSpells = nil
end
