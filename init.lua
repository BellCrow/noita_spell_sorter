--noita
--this comment tells my IDE to load the
-- noita api for auto completion and documetation

dofile_once("data/scripts/gun/gun_actions.lua")
dofile_once("data/scripts/gun/gun_enums.lua")
dofile_once("scripts/lib/utilities.lua")

local storedSpells = {}

--- Returns the players id. Asserts if the player was not found.
--- TODO: can this cause problems, if the player died already and tries to sort theire inventory ?
--- We assume here, that there are never multiple players.
--- I dont know how that behaves with multiplayer mods
---@return number
local function getPlayerId()
    local playerId = EntityGetWithTag("player_unit")
    assert(playerId ~= nil, "Could not retrieve the player entity id as a valid number")
    return playerId[1]
end

local function GetAllChildrenWithName(entityId, childName)
    local allChildren = EntityGetAllChildren(entityId)
    assert(
        allChildren ~= nil,
        string.format("Could not find any children for given entity(%s) to enumerate", tostring(entityId))
    )

    local foundChildren = {}
    for _, child in ipairs(allChildren) do
        if EntityGetName(child) == childName then
            table.insert(foundChildren, child)
        end
    end
    assert(
        foundChildren ~= nil,
        string.format("Expected to find a child with name %s in given entity(%s)", childName, entityId)
    )
    return foundChildren
end

local function GetAllComponentsWithName(entityId, componentName)
    assert(entityId ~= nil and type(entityId) == "number")
    local components = EntityGetAllComponents(entityId)
    assert(
        components ~= nil,
        string.format("Trying to get components of entity %s, but gotten nil", tostring(entityId))
    )
    --- number[]
    local componentsWithName = {}
    for _, component in ipairs(components) do
        local iterComponentName = ComponentGetTypeName(component)
        -- print(
        --     string.format(
        --         "received component name of entity %s with typename %s",
        --         tostring(entityId),
        --         iterComponentName
        --     )
        -- )
        if iterComponentName == componentName then
            table.insert(componentsWithName, component)
        end
    end
    return componentsWithName
end

local function GetFirstChildWithName(entityId, childName)
    local allChildren = EntityGetAllChildren(entityId)
    assert(
        allChildren ~= nil,
        string.format("Could not find any children for given entity(%s) to enumerate", tostring(entityId))
    )

    local foundChild = nil
    for _, child in ipairs(allChildren) do
        if EntityGetName(child) == childName then
            foundChild = child
        end
    end
    assert(
        foundChild ~= nil,
        string.format("Expected to find a child with name %s in given entity(%s)", childName, entityId)
    )
    return foundChild
end

local function GetInventoryFull()
    local playerId = getPlayerId()
    local fullInventoryEntity = GetFirstChildWithName(playerId, "inventory_full")
    return fullInventoryEntity
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

function OnPlayerSpawned(_)
    GUI_HANDLE = GuiCreate()
    _GiveRandomSpells()
end

--- Removes all spells, the player has in their inventory and
--- stores them in a local variable after
function SortInventory()
    local spellIds = GetAllSpellIds()
    if #spellIds > 0 then
        storedSpells = spellIds
        for _, spellId in ipairs(spellIds) do
            EntityRemoveFromParent(spellId)
        end
        local spellCount = #spellIds
        print("------------------------")
        for index, spellId in ipairs(spellIds) do
            -- SetIndexOfItem(spellId, spellCount - index)

            GetSpellInfos(spellId)
        end
        print("------------------------")
    end
end

function GetSpellType(spellId)
    print("Trying to get spell info for spell id " .. spellId)
    local spriteComponents = GetAllComponentsWithName(spellId, "SpriteComponent")
    -- assumption is, that one of the the sprite components contains the
    -- type information encoded as the path to the background of the icon
    assert(
        spriteComponents ~= nil and #spriteComponents > 0,
        "Did not find at least one sprite components in a the given spell with id" .. spellId
    )
    -- after this line the variable should contain something like:
    -- "data/ui_gfx/inventory/item_bg_projectile.png"
    for _, spriteComponent in ipairs(spriteComponents) do
        local spritePath = ComponentGetValue2(spriteComponent, "image_file")
        assert(
            spritePath ~= nil and type(spritePath) == "string",
            "Could not get the path for a given sprite component"
        )
        local _, _, spellType = string.find(spritePath, "/item_bg_([%w_-]*)%.png")
        -- print(string.format("Spell type extracted from %s was %s", spritePath, spellType))
        if spellType ~= nil then
            return spellType
        end
    end
    assert(
        false,
        "Did not find a sprite file path, for a given spell, that encodes the type of the spell in the background of the spell with id "
            .. tostring(spellId)
    )
end

function GetSpellType_bak(spellId)
    print("Trying to get spell info for spell id " .. spellId)
    local spriteComponents = GetAllComponentsWithName(spellId, "SpriteComponent")
    -- assumption is, that one of the the sprite components contains the
    -- type information encoded as the path to the background of the icon
    assert(
        spriteComponents ~= nil and #spriteComponents > 0,
        "Did not find at least one sprite components in a the given spell with id" .. spellId
    )
    -- after this line the variable should contain something like:
    -- "data/ui_gfx/inventory/item_bg_projectile.png"
    for _, spriteComponent in ipairs(spriteComponents) do
        local spritePath = ComponentGetValue2(spriteComponent, "image_file")
        assert(
            spritePath ~= nil and type(spritePath) == "string",
            "Could not get the path for a given sprite component"
        )
        local _, _, spellType = string.find(spritePath, "/item_bg_([%w_-]*)%.png")
        -- print(string.format("Spell type extracted from %s was %s", spritePath, spellType))
        if spellType ~= nil then
            return spellType
        end
    end
    assert(
        false,
        "Did not find a sprite file path, for a given spell, that encodes the type of the spell in the background of the spell with id "
            .. tostring(spellId)
    )
end

function GetSpellInfos(spellId)
    local spellType = GetSpellType(spellId)
    print(string.format("Spell ID %s is type %s", tostring(spellId), spellType))
end

function SetIndexOfItem(item, index)
    local itemComponent = EntityGetComponentIncludingDisabled(item, "ItemComponent")
    if not itemComponent then
        return
    end

    ComponentSetValue2(itemComponent[1], "inventory_slot", index, 0)
end

----GAME----

local function get_player_position_x_y()
    local playerId = getPlayerId()
    local x, y, _, _, _ = EntityGetTransform(playerId)
    return x, y
end

function _GiveRandomSpells()
    local x, y = get_player_position_x_y()
    local itemId = EntityLoad("data/entities/items/pickup/random_card.xml", x + 10, y - 20)
    GamePickUpInventoryItem(getPlayerId(), itemId, false)
    -- GamePickUpInventoryItem(PLAYER_ENTITY, "data/entities/items/pickup/thunderstone.xml")
end

function ReAddStoredSpells()
    for _, spellId in ipairs(storedSpells) do
        EntityAddChild(GetInventoryFull(), spellId)
    end
    storedSpells = nil
end

function OnWorldPreUpdate()
    if storedSpells ~= nil then
        -- in this case we sorted the spells in the previous iteration
        -- now we have to add them back to the inventory
        ReAddStoredSpells()
    end

    GuiStartFrame(GUI_HANDLE)
    GuiLayoutBeginHorizontal(GUI_HANDLE, 100, 0, true, 0, 0)
    if GuiButton(GUI_HANDLE, 0, 100, 100, "Give random spell") then
        _GiveRandomSpells()
    end
    if
        GameIsInventoryOpen()
        and GuiImageButton(GUI_HANDLE, 69420, 260, 20, "sort", "mods/noita_spell_sorter/assets/broom20.png")
    then
        -- local gunMapping = {
        --     { 0, "ACTION_TYPE_PROJECTILE" },
        --     { 1, "ACTION_TYPE_STATIC_PROJECTILE" },
        --     { 2, "ACTION_TYPE_MODIFIER" },
        --     { 3, "ACTION_TYPE_DRAW_MANY" },
        --     { 4, "ACTION_TYPE_MATERIAL" },
        --     { 5, "ACTION_TYPE_OTHER" },
        --     { 6, "ACTION_TYPE_UTILITY" },
        --     { 7, "ACTION_TYPE_PASSIVE" },
        -- }
        -- SortInventory()
        for k, v in pairs(actions[1]) do
            -- local action = actions[1]
            -- actions[1]

            print(string.format("Key: %s ; value: %s", tostring(k), tostring(v)))
            -- if v.type ~= nil then
            --     debug_print_table(v)
            -- end
        end
    end
    GuiLayoutEnd(GUI_HANDLE)
end
