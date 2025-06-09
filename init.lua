-- noita
-- the above comment is needed to tell my ide to load the types for the lua api via the lua lsp
dofile_once("Debug.lua")
PLAYER_ENTITY = 0

--- @return number entity_id
local function get_player()
	return EntityGetWithTag("player_unit")[1]
end

local function get_player_position_x_y()
	local x, y, _, __, ___ = EntityGetTransform(get_player())
	return x, y
end
function _GiveFixedSpells()
	local x, y = get_player_position_x_y()

	local itemIds = {
		"BURST_X",
		"BOMB",
		"DUPLICATE",
		"BURST_2",
		"BURST_3",
		"BURST_4",
	}

	for i, id in ipairs(itemIds) do
		local itemId = CreateItemActionEntity(id, x + i * 2, y + i)
		GamePickUpInventoryItem(PLAYER_ENTITY, itemId, true)
	end
end

function _GiveRandomSpells()
	local x, y = get_player_position_x_y()
	local itemId = EntityLoad("data/entities/items/pickup/random_card.xml", x + 10, y + 10)
	GamePickUpInventoryItem(PLAYER_ENTITY, itemId, true)
	-- GamePickUpInventoryItem(PLAYER_ENTITY, "data/entities/items/pickup/thunderstone.xml")
end

--- Returns all children of a specified entity, that have a certain name
---@param entityId integer | integer
---@param name string
---@return table
function GetChildEntitiesByName(entityId, name)
	local children = EntityGetAllChildren(entityId)
	if 0 < #children then
		local ret = {}
		for child in pairs(children) do
			local childName = EntityGetName(child)
			--GamePrint("Found " .. childName)
			if childName == name then
				GamePrint("Added" .. childName)
				table.insert(ret, child)
			end
		end
	end
	return children
end

function OnWorldPreUpdate()
	--- This is called every time the game is about to start updating the world
	GuiStartFrame(GUI_HANDLE)
	GuiLayoutBeginHorizontal(GUI_HANDLE, 100, 0, true, 0, 0)
	if GuiButton(GUI_HANDLE, 0, 100, 100, "Give random spell") then
		_GiveRandomSpells()
	end
	if GuiButton(GUI_HANDLE, 0, 100, 100, "Sort spells") then
		GamePrint("Trying to sort..")
		local player = get_player()
		GamePrint(tostring(player))
		local spellInventory = GetChildEntitiesByName(player, "inventory_full")
		GamePrint("Spell inventory table:" .. tostring(spellInventory) .. " Length: " .. #spellInventory)
		--local spells = GetChildEntitiesByName(spellInventory, "card_action")
		for _,v in ipairs(spellInventory) do
			GamePrint(tostring(EntityGetName(v)))
		end
	end
	GuiLayoutEnd(GUI_HANDLE)
end

function OnPlayerSpawned(player_entity) -- This runs when player entity has been created
	-- GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
	PLAYER_ENTITY = player_entity
	GUI_HANDLE = GuiCreate()
	GamePrint("BUTTON CLICKED")
	_GiveRandomSpells()
end
