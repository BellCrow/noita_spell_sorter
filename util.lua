--- Returns the players id. Asserts if the player was not found.
--- TODO: can this cause problems, if the player died already and tries to sort theire inventory ?
--- We assume here, that there are never multiple players.
--- I dont know how that behaves with multiplayer mods
---@return number
function GetPlayerId()
    local playerId = EntityGetWithTag("player_unit")
    assert(playerId ~= nil, "Could not retrieve the player entity id as a valid number")
    return playerId[1]
end

function GetAllChildrenWithName(entityId, childName)
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

--- Returns the value of the first member found with a given name.
--- The return value is always a string. So you might have to convert numbers
---@param entityId integer
---@param memberName string
---@return string
function GetValueOfFirstMemberWithName(entityId, memberName)
    assert(entityId, "Argument entityId must not be nil")
    assert(memberName, "Argument memberName must not be nil")
    ---{[string]: string}
    local members = ComponentGetMembers(entityId)
    assert(members, string.format("Entity with id %d has no members", entityId))
    for name, member in pairs(members) do
        if name == memberName then
            return member
        end
    end
    assert(false, string.format("No member found with name '%s' found in entity %d", memberName, entityId))
end
--- Returns the first encountered component(that has the specified name) contained in an given entity.
--- Useful, if you are certain there can only be one such component.
--- Asserts if the given arguments are not well formed or if there is another error.
---@param entityId integer
---@param componentName string
---@return integer
function GetFirstComponentWithName(entityId, componentName)
    assert(entityId, "Given entityId cannot be nil")
    local allComponentsWithName = GetAllComponentsWithName(entityId, componentName)
    assert(
        allComponentsWithName and #allComponentsWithName > 0,
        string.format("Didnt find any components with name %s for entity %d", componentName, entityId)
    )
    return allComponentsWithName[1]
end

--- Returns all components with a given name for the given entity as a table
--- Asserts if there was an error.
---@param entityId number Entity that contains the components
---@param componentName string Name of the components to look for
---@return integer[]
function GetAllComponentsWithName(entityId, componentName)
    assert(entityId and type(entityId) == "number")
    local components = EntityGetAllComponents(entityId)
    assert(components, string.format("Trying to get components of entity %s, but gotten nil", tostring(entityId)))
    --- number[]
    local componentsWithName = {}
    for _, component in ipairs(components) do
        local iterComponentName = ComponentGetTypeName(component)
        if iterComponentName == componentName then
            table.insert(componentsWithName, component)
        end
    end
    return componentsWithName
end

function GetFirstChildWithName(entityId, childName)
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

--- Groups the elements of a given table based on the values, that
--- a key function creates from each element. The resulting objects from the keyfunction
--- should be comparable on equality
--- Example:
--- Given an input table like {1,1,3,5,8,7,9,3,4,6} and a key function like 'function(key) return key end' (an identity function)
--- It will return such a table:
--- {
--- 	{key = 1, values = { 1,1 }},
--- 	{key = 3, values = { 3,3 }},
--- 	{key = 5, values = { 5 }},
--- 	{key = 8, values = { 8 }},
--- 	{key = 7, values = { 7 }},
--- 	{key = 9, values = { 9 }},
--- 	{key = 4, values = { 4 }},
--- 	{key = 6, values = { 6 }}
--- }
--- Mind, that the individiual sub tables are in the order in which the contained key first appared in the
--- original list. If you need the groups to be in order, you can sort the original array before grouping.
--- As the values are also a table. You can also replace them with another grouping and get hierachical grouping that way
---@param tableToGroup table
---@param keyFunction fun(key:any): any
---@return {key: number, values:table}
function GroupBy(tableToGroup, keyFunction)
    assert(tableToGroup and type(tableToGroup) == "table", "Table to group must be not be nil and of type table")
    assert(keyFunction and type(keyFunction) == "function", "key function must not be null and of type function")
    local ret = {}
    local index = 1
    local function GetEntryForGroupKey(tableToSearch, key)
        for i, v in ipairs(tableToSearch) do
            if key == v.key then
                return v
            end
        end
        return nil
    end
    for k, v in pairs(tableToGroup) do
        local key = keyFunction(v)
        -- print(string.format("Key: %s -> value: %s", k, v))

        local existingGroup = GetEntryForGroupKey(ret, key)
        if existingGroup == nil then
            -- print("Creating new table for key " .. k)
            existingGroup = { key = key, values = {} }
            table.insert(ret, existingGroup)
        end
        table.insert(existingGroup.values, v)
    end
    return ret
end

function GetInventoryFull()
    local playerId = GetPlayerId()
    local fullInventoryEntity = GetFirstChildWithName(playerId, "inventory_full")
    return fullInventoryEntity
end

function GetPlayerPosition()
    local playerId = GetPlayerId()
    local x, y, _, _, _ = EntityGetTransform(playerId)
    return x, y
end
