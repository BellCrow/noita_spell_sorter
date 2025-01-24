
PLAYER_ENTITY = 0

function get_player()
	return EntityGetWithTag("player_unit")[1]
end

function get_players()
	return EntityGetWithTag("player_unit")
end

function get_player_position_x_y()
    x,y,_,__,___ = EntityGetTransform(get_player())
	return x,y
end

function _Debug_GiveTestItems()
    x,y = get_player_position_x_y();

    itemIds = {
        "BURST_X",
        "BOMB",
        "DUPLICATE",
        "BURST_2",
        "BURST_3",
        "BURST_4",
    }

    for i,id in ipairs(itemIds) do
        itemId = CreateItemActionEntity(id, x+i*2,y + i)
        GamePickUpInventoryItem(PLAYER_ENTITY, itemId)

    end
    
    -- EntityLoad( "data/entities/items/pickup/random_card.xml", x+10, y+10)
    --GamePickUpInventoryItem(PLAYER_ENTITY, "data/entities/items/pickup/thunderstone.xml")
end


function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	if(GameIsInventoryOpen())then

        componentIds = EntityGetAllComponents(PLAYER_ENTITY)
        for i,c in ipairs(componentIds) do
            
            GamePrint( "ID: "..c .. " -> " .. ComponentGetTypeName(c))
        end
        -- inventoryComponentId = EntityGetComponent(PLAYER_ENTITY,"Inventory2Component")
        -- if(inventoryComponentId == nil) then
        --     GamePrint( "No component found on player entity")
        -- else
        --     ComponentGetValue2(inventoryComponentId, "")
        -- end
    end
end

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
    -- GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
    PLAYER_ENTITY = player_entity
    _Debug_GiveTestItems();
end