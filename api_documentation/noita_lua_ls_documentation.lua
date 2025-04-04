---@meta
---@alias component_id integer
--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
--- @return integer entity_id
function EntityLoad(filename, pos_x, pos_y)end
--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
--- @return integer entity_id
function EntityLoadEndGameItem(filename, pos_x, pos_y)end
--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
function EntityLoadCameraBound(filename, pos_x, pos_y)end
--- @param filename string
--- @param entity integer
--- Loads components from 'filename' to 'entity'. Does not load tags and other stuff.
function EntityLoadToEntity(filename, entity)end
--- @param entity_id integer
--- @param filename string
--- Note: works only in dev builds.
function EntitySave(entity_id, filename)end
--- @param name string default value ""
--- @return integer entity_id
function EntityCreateNew(name)end
--- @param entity_id integer
function EntityKill(entity_id)end
--- @param entity_id integer
--- @return boolean
function EntityGetIsAlive(entity_id)end
--- @param entity_id integer
--- @param component_type_name string
--- @param table_of_component_values string[] default value nil
--- @return integer component_id
function EntityAddComponent(entity_id, component_type_name, table_of_component_values)end
--- @param entity_id integer
--- @param component_id integer
function EntityRemoveComponent(entity_id, component_id)end
--- @param entity_id integer
--- @return integer[]
--- Returns a table of component ids.
function EntityGetAllComponents(entity_id)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
--- @return {component_id}|nil
function EntityGetComponent(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
--- @return component_id|nil
function EntityGetFirstComponent(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
--- @return {component_id}|nil
function EntityGetComponentIncludingDisabled(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
--- @return component_id|nil
function EntityGetFirstComponentIncludingDisabled(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param x number
--- @param y number default value 0
--- @param rotation number default value 0
--- @param scale_x number default value 1
--- @param scale_y number default value 1
function EntitySetTransform(entity_id, x, y, rotation, scale_x, scale_y)end
--- @param entity_id integer
--- @param x number
--- @param y number default value 0
--- @param rotation number default value 0
--- @param scale_x number default value 1
--- @param scale_y number default value 1
--- Sets the transform and tries to immediately refresh components that calculate values based on an entity's transform.
function EntityApplyTransform(entity_id, x, y, rotation, scale_x, scale_y)end
--- @param entity_id integer
--- @return number x:number,y:number,rotation:number,scale_x:number,scale_y
function EntityGetTransform(entity_id)end
--- @param parent_id integer
--- @param child_id integer
function EntityAddChild(parent_id, child_id)end
--- @param entity_id integer
--- @param tag string default value ""
--- @return int}|nil {entity_id
--- If passed the optional 'tag' parameter, will return only child entities that have that tag (If 'tag' isn't a valid tag name, will return no entities). If no entities are returned, might return either an empty table or nil.
function EntityGetAllChildren(entity_id, tag)end
--- @param entity_id integer
--- @return integer entity_id
function EntityGetParent(entity_id)end
--- @param entity_id integer
--- @return integer entity_id
--- Returns the given entity if it has no parent, otherwise walks up the parent hierarchy to the topmost parent and returns it.
function EntityGetRootEntity(entity_id)end
--- @param entity_id integer
function EntityRemoveFromParent(entity_id)end
--- @param entity_id integer
--- @param tag string
--- @param enabled boolean
function EntitySetComponentsWithTagEnabled(entity_id, tag, enabled)end
--- @param entity_id integer
--- @param component_id integer
--- @param is_enabled boolean
function EntitySetComponentIsEnabled(entity_id, component_id, is_enabled)end
--- @param entity_id integer
--- @return string name
function EntityGetName(entity_id)end
--- @param entity_id integer
--- @param name string
function EntitySetName(entity_id, name)end
--- @param entity_id integer
--- @return string|nil
--- Returns a string where the tags are comma-separated, or nil if 'entity_id' doesn't point to a valid entity.
function EntityGetTags(entity_id)end
--- @param tag string
--- @return int} {entity_id
--- Returns all entities with 'tag'.
function EntityGetWithTag(tag)end
--- @param pos_x number
--- @param pos_y number
--- @param radius number
--- @return int} {entity_id
--- Returns all entities in 'radius' distance from 'x','y'.
function EntityGetInRadius(pos_x, pos_y, radius)end
--- @param pos_x number
--- @param pos_y number
--- @param radius number
--- @param entity_tag string
--- @return int} {entity_id
--- Returns all entities in 'radius' distance from 'x','y'.
function EntityGetInRadiusWithTag(pos_x, pos_y, radius, entity_tag)end
--- @param pos_x number
--- @param pos_y number
--- @return integer entity_id
function EntityGetClosest(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @param tag string
--- @return integer entity_id
function EntityGetClosestWithTag(pos_x, pos_y, tag)end
--- @param name string
--- @return integer entity_id
function EntityGetWithName(name)end
--- @param entity_id integer
--- @param tag string
function EntityAddTag(entity_id, tag)end
--- @param entity_id integer
--- @param tag string
function EntityRemoveTag(entity_id, tag)end
--- @param entity_id integer
--- @param tag string
--- @return boolean
function EntityHasTag(entity_id, tag)end
--- @param entity_id integer
--- @return string full_path
--- Return value example: 'data/entities/items/flute.xml'. Incorrect value is returned if the entity has passed through the world streaming system.
function EntityGetFilename(entity_id)end

--- @return number entity_max_id
--- Returns the max entity ID currently in use. Entity IDs are increased linearly. 
function EntitiesGetMaxID()end
--- @param component_id integer
--- @param variable_name string
--- @return string|nil
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetValue(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @return bool|nil
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetValueBool(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @return int|nil
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetValueInt(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @return number|nil
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetValueFloat(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @return number|nil x:number,y
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetValueVector2(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @param value string
--- Deprecated, use ComponentSetValue2() instead.
function ComponentSetValue(component_id, variable_name, value)end
--- @param component_id integer
--- @param variable_name string
--- @param x number
--- @param y number
--- Deprecated, use ComponentSetValue2() instead.
function ComponentSetValueVector2(component_id, variable_name, x, y)end
--- @param component_id integer
--- @param variable_name string
--- @param min number
--- @param max number
--- Deprecated, use ComponentSetValue2() instead.
function ComponentSetValueValueRange(component_id, variable_name, min, max)end
--- @param component_id integer
--- @param variable_name string
--- @param min number
--- @param max number
--- Deprecated, use ComponentSetValue2() instead.
function ComponentSetValueValueRangeInt(component_id, variable_name, min, max)end
--- @param component_id integer
--- @param variable_name string
--- @param value string
--- Deprecated, use ComponentSetValue2() instead.
function ComponentSetMetaCustom(component_id, variable_name, value)end
--- @param component_id integer
--- @param variable_name string
--- @return string|nil
--- Deprecated, use ComponentGetValue2() instead.
function ComponentGetMetaCustom(component_id, variable_name)end
--- @param component_id integer
--- @param object_name string
--- @param variable_name string
--- @return string|nil
--- Deprecated, use ComponentObjectGetValue2() instead.
function ComponentObjectGetValue(component_id, object_name, variable_name)end
--- @param component_id integer
--- @param object_name string
--- @param variable_name string
--- @param value string
--- Deprecated, use ComponentObjectSetValue2() instead.
function ComponentObjectSetValue(component_id, object_name, variable_name, value)end
--- @param component_id integer
--- @param tag string
function ComponentAddTag(component_id, tag)end
--- @param component_id integer
--- @param tag string
function ComponentRemoveTag(component_id, tag)end
--- @param component_id integer
--- @return string|nil
--- Returns a string where the tags are comma-separated, or nil if can't find 'component_id' component.
function ComponentGetTags(component_id)end
--- @param component_id integer
--- @param tag string
--- @return boolean
function ComponentHasTag(component_id, tag)end
--- @param component_id integer
--- @param field_name string
--- @return multiple_types|nil
--- Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is not supported or field was not found. This is up to 7.5x faster than the old ComponentSetValue functions.
function ComponentGetValue2(component_id, field_name)end
--- @param component_id integer
--- @param field_name string
--- @param value_or_values any
--- Sets the value of a field. Value(s) should have a type matching the field type. Reports error if the values weren't given in correct type, the field type is not supported, or the component does not exist. This is up to 20x faster than the old ComponentSetValue functions.
function ComponentSetValue2(component_id, field_name, value_or_values)end
--- @param component_id integer
--- @param object_name string
--- @param field_name string
--- @return multiple types|nil
--- Returns one or many values matching the type or subtypes of the requested field in a component subobject. Reports error and returns nil if the field type is not supported or 'object_name' is not a metaobject.
function ComponentObjectGetValue2(component_id, object_name, field_name)end
--- @param component_id integer
--- @param object_name string
--- @param field_name string
--- @param value_or_values any
--- Sets the value of a field in a component subobject. Value(s) should have a type matching the field type. Reports error if the values weren't given in correct type, the field type is not supported or 'object_name' is not a metaobject.
function ComponentObjectSetValue2(component_id, object_name, field_name, value_or_values)end
--- @param entity_id integer
--- @param component_type_name
--- @param table_of_component_values table<string, multiple_types> default value nil
--- @return component_id
--- Creates a component of type 'component_type_name' and adds it to 'entity_id'. 'table_of_component_values' should be a string-indexed table, where keys are field names and values are field values of correct type. The value setting works like ComponentObjectSetValue2(), with the exception that multivalue types are not supported. Additional supported values are _tags:comma_separated_string and _enabled:bool, which basically work like the those fields work in entity XML files. Returns the created component, if creation succeeded, or nil.
function EntityAddComponent2(entity_id, component_type_name, table_of_component_values)end
--- @param component_id integer
--- @param array_member_name string
--- @param type_stored_in_vector string
--- @return integer
--- 'type_stored_in_vector' should be "int", "float" or "string".
function ComponentGetVectorSize(component_id, array_member_name, type_stored_in_vector)end
--- @param component_id integer
--- @param array_name string
--- @param type_stored_in_vector string
--- @param index integer
--- @return int|number|string|nil
--- 'type_stored_in_vector' should be "int", "float" or "string".
function ComponentGetVectorValue(component_id, array_name, type_stored_in_vector, index)end
--- @param component_id integer
--- @param array_name string
--- @param type_stored_in_vector string
--- @return {int|number|string}|nil
--- 'type_stored_in_vector' should be "int", "float" or "string".
function ComponentGetVector(component_id, array_name, type_stored_in_vector)end
--- @param component_id integer
--- @return boolean
--- Returns true if the given component exists and is enabled, else false.
function ComponentGetIsEnabled(component_id)end
--- @param component_id integer
--- @return integer entity_id
--- Returns the id of the entity that owns a component, or 0.
function ComponentGetEntity(component_id)end
--- @param component_id integer
--- @return {string-string}|nil
--- Returns a string-indexed table of string.
function ComponentGetMembers(component_id)end
--- @param component_id integer
--- @param object_name string
--- @return {string-string}|nil
--- Returns a string-indexed table of string or nil.
function ComponentObjectGetMembers(component_id, object_name)end
--- @param component_id integer
--- @return string
function ComponentGetTypeName(component_id)end

--- @return integer entity_id
function GetUpdatedEntityID()end

--- @return integer component_id
function GetUpdatedComponentID()end
--- @param time_to_execute number
--- @param file_to_execute string
--- @param function_to_call string default value nil
function SetTimeOut(time_to_execute, file_to_execute, function_to_call)end
--- @param color integer
--- @param function_name string
function RegisterSpawnFunction(color, function_name)end
--- @param x number
--- @param y number
--- @param level integer
function SpawnActionItem(x, y, level)end
--- @param x number
--- @param y number
--- @param level integer
--- @param action_count integer
--- @return integer entity_id
function SpawnStash(x, y, level, action_count)end
--- @param x number
--- @param y number
--- @param level integer
--- @param spawn_now boolean default value false
--- @return integer spawn_state_id:int,entity_id
function SpawnApparition(x, y, level, spawn_now)end
--- @param entity_file string
--- @param stash_entity_id integer
function LoadEntityToStash(entity_file, stash_entity_id)end
--- @param entity_id integer
--- @param material_name string
--- @param count integer
function AddMaterialInventoryMaterial(entity_id, material_name, count)end
--- @param entity_id integer
--- @param material_name string default value ""
--- If material_name is empty, all materials will be removed.
function RemoveMaterialInventoryMaterial(entity_id, material_name)end
--- @param entity_id integer
--- @param ignore_box2d_materials boolean default value true
--- @return integer material_type
--- Returns the id of the material taking the largest part of the first MaterialInventoryComponent in 'entity_id', or 0 if nothing is found.
function GetMaterialInventoryMainMaterial(entity_id, ignore_box2d_materials)end
--- @param strength number
--- @param x number default value camera_x
--- @param y number default value camera_y
function GameScreenshake(strength, x, y)end

function GameOnCompleted()end
--- @param id string
function GameGiveAchievement(id)end

function GameDoEnding2()end
--- @param world_pos_x number
--- @param world_pos_y number
--- @return x, y
--- x = 0 normal world, -1 is first west world, +1 is first east world, if y < 0 it is sky, if y > 0 it is hell 
function GetParallelWorldPosition(world_pos_x, world_pos_y)end
--- @param filename string
--- @param pixel_scenes string default value "data/biome/_pixel_scenes.xml"
function BiomeMapLoad_KeepPlayer(filename, pixel_scenes)end
--- @param filename string
--- Deprecated. Might trigger various bugs. Use BiomeMapLoad_KeepPlayer() instead.
function BiomeMapLoad(filename)end
--- @param filename string
--- @param field_name string
--- @param value any
--- Can be used to edit biome configs during initialization. See the nightmare mod for an usage example.
function BiomeSetValue(filename, field_name, value)end
--- @param filename string
--- @param field_name string
--- @return multiple types|nil
--- Can be used to read biome configs. Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is not supported or field was not found.
function BiomeGetValue(filename, field_name)end
--- @param filename string
--- @param meta_object_name string
--- @param field_name string
--- @param value any
--- Can be used to edit biome configs during initialization. See biome_modifiers.lua for an usage example.
function BiomeObjectSetValue(filename, meta_object_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
--- @param value any
--- Can be used to edit biome config MaterialComponents during initialization. Sets the given value in all found VegetationComponent with matching tree_material. See biome_modifiers.lua for an usage example.
function BiomeVegetationSetValue(filename, material_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
--- @param value any
--- Can be used to edit biome config MaterialComponents during initialization. Sets the given value in the first found MaterialComponent with matching material_name. See biome_modifiers.lua for an usage example.
function BiomeMaterialSetValue(filename, material_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
--- @return multiple types|nil
--- Can be used to read biome config MaterialComponents during initialization. Returns the given value in the first found MaterialComponent with matching material_name. See biome_modifiers.lua for an usage example.
function BiomeMaterialGetValue(filename, material_name, field_name)end

--- @return boolean
function GameIsIntroPlaying()end

--- @return boolean
function GameGetIsGamepadConnected()end

--- @return integer entity_id
function GameGetWorldStateEntity()end

--- @return integer entity_id
function GameGetPlayerStatsEntity()end

--- @return integer
function GameGetOrbCountAllTime()end

--- @return integer
function GameGetOrbCountThisRun()end
--- @param orb_id_zero_based integer
--- @return boolean
function GameGetOrbCollectedThisRun(orb_id_zero_based)end
--- @param orb_id_zero_based integer
--- @return boolean
function GameGetOrbCollectedAllTime(orb_id_zero_based)end

function GameClearOrbsFoundThisRun()end

--- @return integer
--- Returns the number of orbs, picked or not.
function GameGetOrbCountTotal()end
--- @param material_id integer
--- @return string
--- Converts a numeric material id to the material's strings id.
function CellFactory_GetName(material_id)end
--- @param material_name string
--- @return integer
--- Returns the id of a material.
function CellFactory_GetType(material_name)end
--- @param material_id integer
--- @return string
--- Returns the displayed name of a material, or an empty string if 'material_id' is not valid. Might return a text key.
function CellFactory_GetUIName(material_id)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
--- @return string[]
function CellFactory_GetAllLiquids(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
--- @return string[]
function CellFactory_GetAllSands(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
--- @return string[]
function CellFactory_GetAllGases(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
--- @return string[]
function CellFactory_GetAllFires(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
--- @return string[]
function CellFactory_GetAllSolids(include_statics, include_particle_fx_materials)end
--- @param material_id integer
--- @return string[]
function CellFactory_GetTags(material_id)end
--- @param material_id integer
--- @param tag string
--- @return boolean[]
function CellFactory_HasTag(material_id, tag)end

--- @return number x:number,y
function GameGetCameraPos()end
--- @param x number
--- @param y number
function GameSetCameraPos(x, y)end
--- @param is_free boolean
function GameSetCameraFree(is_free)end

--- @return number x:number,y:number,w:number,h
--- Returns the camera rectangle. This may not be 100% pixel perfect with regards to what you see on the screen. 'x','y' = top left corner of the rectangle.
function GameGetCameraBounds()end
--- @param entity_id integer
function GameRegenItemAction(entity_id)end
--- @param entity_id integer
function GameRegenItemActionsInContainer(entity_id)end
--- @param entity_id integer
function GameRegenItemActionsInPlayer(entity_id)end
--- @param inventory_owner_entity_id integer
--- @param item_entity_id integer
function GameKillInventoryItem(inventory_owner_entity_id, item_entity_id)end
--- @param who_picks_up_entity_id integer
--- @param item_entity_id integer
--- @param do_pick_up_effects boolean default value true
function GamePickUpInventoryItem(who_picks_up_entity_id, item_entity_id, do_pick_up_effects)end
--- @param entity_id integer
--- @return {item_entity_id}|nil
--- Returns all the inventory items that entity_id has.
function GameGetAllInventoryItems(entity_id)end
--- @param entity_id integer
function GameDropAllItems(entity_id)end
--- @param entity_id integer
function GameDropPlayerInventoryItems(entity_id)end
--- @param entity_id integer
function GameDestroyInventoryItems(entity_id)end

--- @return boolean
function GameIsInventoryOpen()end

function GameTriggerGameOver()end
--- @param materials_filename string
--- @param colors_filename string
--- @param x number
--- @param y number
--- @param background_file string
--- @param skip_biome_checks boolean default value false
--- @param skip_edge_textures boolean default value false
--- @param color_to_material_table table<string, string> default value {}
--- @param background_z_index integer default value 50
--- @param load_even_if_duplicate boolean default value false
function LoadPixelScene(materials_filename, colors_filename, x, y, background_file, skip_biome_checks, skip_edge_textures, color_to_material_table, background_z_index, load_even_if_duplicate)end
--- @param background_file string
--- @param x number
--- @param y number
--- @param background_z_index number default value 40.0
--- @param check_biome_corners boolean default value false
function LoadBackgroundSprite(background_file, x, y, background_z_index, check_biome_corners)end
--- @param background_file string
--- @param x number
--- @param y number
--- @return bool -
--- NOTE! Removes the pixel scene sprite if the name and position match. Will return true if manages the find and destroy the background sprite
function RemovePixelSceneBackgroundSprite(background_file, x, y)end
--- @param x_min number
--- @param y_min number
--- @param x_max number
--- @param y_max number
--- NOTE! Removes pixel scene background sprites inside the given area.
function RemovePixelSceneBackgroundSprites(x_min, y_min, x_max, y_max)end
--- @param material_name string
--- @param x number
--- @param y number
--- @param how_many integer
--- @param xvel number
--- @param yvel number
--- @param color integer default value 0
--- @param lifetime_min number default value 5.0
--- @param lifetime_max number default value 10
--- @param force_create boolean default value true
--- @param draw_front boolean default value false
--- @param collide_with_grid boolean default value true
--- @param randomize_velocity boolean default value true
--- @param gravity_x number default value 0
--- @param gravity_y number default value 100.0
function GameCreateCosmeticParticle(material_name, x, y, how_many, xvel, yvel, color, lifetime_min, lifetime_max, force_create, draw_front, collide_with_grid, randomize_velocity, gravity_x, gravity_y)end
--- @param material_name string
--- @param x number
--- @param y number
--- @param how_many integer
--- @param xvel number
--- @param yvel number
--- @param just_visual boolean
--- @param draw_as_long boolean default value false
--- @param randomize_velocity boolean default value true
function GameCreateParticle(material_name, x, y, how_many, xvel, yvel, just_visual, draw_as_long, randomize_velocity)end
--- @param filename string
--- @param x number
--- @param y number
--- @param centered boolean default value true
--- @param sprite_offset_x number default value 0
--- @param sprite_offset_y number default value 0
--- @param frames integer default value 1
--- @param emissive boolean default value false
function GameCreateSpriteForXFrames(filename, x, y, centered, sprite_offset_x, sprite_offset_y, frames, emissive)end
--- @param shooter_entity integer
--- @param x number
--- @param y number
--- @param target_x number
--- @param target_y number
--- @param projectile_entity integer
--- @param send_message boolean default value true
--- @param verlet_parent_entity integer default value 0
--- 'shooter_entity' can be 0. Warning: If 'projectile_entity' has PhysicsBodyComponent and ItemComponent, components without the "enabled_in_world" tag will be disabled, as if the entity was thrown by player.
function GameShootProjectile(shooter_entity, x, y, target_x, target_y, projectile_entity, send_message, verlet_parent_entity)end
--- @param entity integer
--- @param amount number
--- @param damage_type string
--- @param description string
--- @param ragdoll_fx string
--- @param impulse_x number
--- @param impulse_y number
--- @param entity_who_is_responsible integer default value 0
--- @param world_pos_x number default value entity_x
--- @param world_pos_y number default value entity_y
--- @param knockback_force number default value 0
function EntityInflictDamage(entity, amount, damage_type, description, ragdoll_fx, impulse_x, impulse_y, entity_who_is_responsible, world_pos_x, world_pos_y, knockback_force)end
--- @param entity integer
--- @param material_type number
--- @param amount number
--- Has the same effects that would occur if 'entity' eats 'amount' number of cells of 'material_type' from the game world. Use this instead of directly modifying IngestionComponent values, if possible. Might not work with non-player entities. Use CellFactory_GetType() to convert a material name to material type.
function EntityIngestMaterial(entity, material_type, amount)end
--- @param entity integer
--- @param status_type_id string
function EntityRemoveIngestionStatusEffect(entity, status_type_id)end
--- @param entity integer
--- @param status_type_id string
--- @param status_cooldown integer default value 0
function EntityRemoveStainStatusEffect(entity, status_type_id, status_cooldown)end
--- @param entity integer
--- @param material_type number
--- @param amount number
--- Adds random visible stains of 'material_type' to entity. 'amount' controls the number of stain cells added. Does nothing if 'entity' doesn't have a SpriteStainsComponent. Use CellFactory_GetType() to convert a material name to material type.
function EntityAddRandomStains(entity, material_type, amount)end
--- @param entity integer
--- @param material_name string
--- @param damage number
--- Modifies DamageModelComponents materials_that_damage and materials_how_much_damage variables (and their parsed out data structures)
function EntitySetDamageFromMaterial(entity, material_name, damage)end
--- @param entity integer
--- @param sprite_component integer
--- Immediately refreshes the given SpriteComponent. Might be useful with text sprites if you want them to update more often than once a second.
function EntityRefreshSprite(entity, sprite_component)end
--- @param entity integer
--- @return integer
--- Returns the capacity of a wand entity, or 0 if 'entity' doesnt exist.
function EntityGetWandCapacity(entity)end
--- @param entity integer
--- @param hotspot_tag string
--- @param transformed boolean
--- @param include_disabled_components boolean default value false
--- @return number x:number,y
--- Returns the position of a hot spot defined by a HotspotComponent. If 'transformed' is true, will return the position in world coordinates, transformed using the entity's transform.
function EntityGetHotspot(entity, hotspot_tag, transformed, include_disabled_components)end
--- @param entity_id integer
--- @param name string
--- @param priority integer
--- @param followup_name string default value ""
--- @param followup_priority integer default value 0
--- Plays animation. Follow up animation ('followup_name') is applied only if 'followup_priority' is given.
function GamePlayAnimation(entity_id, name, priority, followup_name, followup_priority)end
--- @param entity_id integer
--- @return number x:number,y
function GameGetVelocityCompVelocity(entity_id)end
--- @param entity_id integer
--- @param game_effect_name string
--- @return integer component_id
function GameGetGameEffect(entity_id, game_effect_name)end
--- @param entity_id integer
--- @param game_effect_name string
--- @return integer
function GameGetGameEffectCount(entity_id, game_effect_name)end
--- @param entity_id integer
--- @param game_effect_entity_file string
--- @return integer effect_entity_id
function LoadGameEffectEntityTo(entity_id, game_effect_entity_file)end
--- @param entity_id integer
--- @param game_effect_name string
--- @param always_load_new boolean
--- @return integer effect_component_id:int,effect_entity_id
function GetGameEffectLoadTo(entity_id, game_effect_name, always_load_new)end
--- @param entity_xml string
--- @param is_rare boolean default value false
--- @param add_only_one_copy boolean default value true
--- Adds the entity to the polymorph random table
function PolymorphTableAddEntity(entity_xml, is_rare, add_only_one_copy)end
--- @param entity_xml string
--- @param from_common_table boolean default value true
--- @param from_rare_table boolean default value true
--- Removes the entity from the polymorph random table
function PolymorphTableRemoveEntity(entity_xml, from_common_table, from_rare_table)end
---bool rare_table = false
--- @return string[]
--- Returns a list of all the entities in the polymorph random table
function PolymorphTableGet(bool)end
---{table_of_xml_entities}
---bool rare_table = false
--- Set a list of all entities sas the polymorph random table
function PolymorphTableSet({, bool)end
--- @param x number
--- @param y number
function SetPlayerSpawnLocation(x, y)end
--- @param action_id string
function UnlockItem(action_id)end
--- @param entity_id integer
--- @return uint
function GameGetPotionColorUint(entity_id)end
--- @param entity_id integer
--- @return number)|nil (x:number,y
--- Returns the centroid of first enabled HitboxComponent found in entity, the position of the entity if no hitbox is found, or nil if the entity does not exist. All returned positions are in world coordinates.
function EntityGetFirstHitboxCenter(entity_id)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
--- @return number did_hit:bool,hit_x:number,hit_y
--- Does a raytrace that stops on any cell it hits.
function Raytrace(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
--- @return number did_hit:bool,hit_x:number,hit_y
--- Does a raytrace that stops on any cell that is not fluid, gas (yes, technically gas is a fluid), or fire.
function RaytraceSurfaces(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
--- @return number did_hit:bool,hit_x:number,hit_y
--- Does a raytrace that stops on any cell that is not gas or fire.
function RaytraceSurfacesAndLiquiform(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
--- @return number did_hit:bool,hit_x:number,hit_y
--- Does a raytrace that stops on any cell a character can stand on.
function RaytracePlatforms(x1, y1, x2, y2)end
--- @param ideal_pos_x number
--- @param idea_pos_y number
--- @param velocity_x number
--- @param velocity_y number
--- @param body_radius number
--- @return number x:number,y
function FindFreePositionForBody(ideal_pos_x, idea_pos_y, velocity_x, velocity_y, body_radius)end
--- @param pos_x number
--- @param pos_y number
--- @param ray_length number
--- @param ray_count integer
--- @return number found_normal:bool,normal_x:number,normal_y:number,approximate_distance_from_surface
function GetSurfaceNormal(pos_x, pos_y, ray_length, ray_count)end
--- @param pos_x number
--- @param pos_y number
--- @return number sky
--- Returns the approximate sky visibility (sky ambient level) at a point as a number between 0 and 1. The value is not affected by weather or time of day. This value is used by the post fx shader after some temporal and spatial smoothing.
function GameGetSkyVisibility(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @return integer fog_of_war
--- Returns an integer between 0 and 255. Larger value means more coverage. Returns -1 if query is outside the bounds of the fog of war grid. For performance reasons consider using the components that manipulate fog of war.
function GameGetFogOfWar(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @return integer fog_of_war
--- Returns an integer between 0 and 255. Larger value means more coverage. Returns -1 if query is outside the bounds of the fog of war grid. The value is bilinearly filtered using four samples around 'pos'. For performance reasons consider using the components that manipulate fog of war.
function GameGetFogOfWarBilinear(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @param fog_of_war integer
--- @return boolean pos_valid
--- 'fog_of_war' should be between 0 and 255 (but will be clamped to the correct range with a int32->uint8 cast). Larger value means more coverage. Returns a boolean indicating whether or not the position was inside the bounds of the fog of war grid. For performance reasons consider using the components that manipulate fog of war.
function GameSetFogOfWar(pos_x, pos_y, fog_of_war)end
--- @param min_x integer
--- @param min_y integer
--- @param max_x integer
--- @param max_y integer
--- @return boolean
--- Returns true if the area inside the bounding box defined by the parameters has been streamed in and no pixel scenes are loading in the area.
function DoesWorldExistAt(min_x, min_y, max_x, max_y)end
--- @param herd_name string
--- @return integer
function StringToHerdId(herd_name)end
--- @param herd_id integer
--- @return string
function HerdIdToString(herd_id)end
--- @param herd_id_a integer
--- @param herd_id_b integer
--- @return number
function GetHerdRelation(herd_id_a, herd_id_b)end
--- @param entity_a integer
--- @param entity_b integer
--- @return number
function EntityGetHerdRelation(entity_a, entity_b)end
--- @param entity_a integer
--- @param entity_b integer
--- @return number
--- does not spam errors, but returns 0 if anything fails
function EntityGetHerdRelationSafe(entity_a, entity_b)end
--- @param entity_id integer
--- @param new_herd_id string
--- Deprecated, use GenomeStringToHerdID() and ComponentSetValue2() instead.
function GenomeSetHerdId(entity_id, new_herd_id)end
--- @param pos_x number
--- @param pos_y number
--- @return number entity_id:int, pos_x:number, pos_y
--- NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid.
function EntityGetClosestWormAttractor(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @return number entity_id:int, pos_x:number, pos_y:number, radius
--- NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid
function EntityGetClosestWormDetractor(pos_x, pos_y)end
--- @param log_line string
function GamePrint(log_line)end
--- @param title string
--- @param description string default value ""
--- @param ui_custom_decoration_file string default value ""
function GamePrintImportant(title, description, ui_custom_decoration_file)end

--- @return number x:number,y
function DEBUG_GetMouseWorld()end
--- @param x number
--- @param y number
--- @param message string default value ""
--- @param color_r number default value 1
--- @param color_g number default value 0
--- @param color_b number default value 0
function DEBUG_MARK(x, y, message, color_r, color_g, color_b)end

--- @return integer
function GameGetFrameNum()end

--- @return number
function GameGetRealWorldTimeSinceStarted()end
--- @param key_code integer
--- @return bool (Debugish function - returns if a key is down, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants).
function InputIsKeyDown(key_code)end
--- @param key_code integer
--- @return bool (Debugish function - returns if a key is down this frame, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants)
function InputIsKeyJustDown(key_code)end
--- @param key_code integer
--- @return bool (Debugish function - returns if a key is up this frame, does not depend on state. E.g. player could be in menus or inputting text. See data/scripts/debug/keycodes.lua for the constants)
function InputIsKeyJustUp(key_code)end

--- @return number (Debugish function - returns raw x, y coordinates of the mouse on screen) x:number, y
function InputGetMousePosOnScreen()end
--- @param mouse_button integer
--- @return bool (Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsMouseButtonDown(mouse_button)end
--- @param mouse_button integer
--- @return bool (Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsMouseButtonJustDown(mouse_button)end
--- @param mouse_button integer
--- @return bool (Debugish function - returns if mouse button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsMouseButtonJustUp(mouse_button)end
--- @param joystick_index integer
--- @param joystick_button integer
--- @return bool (Debugish function - returns if 'joystick' button is down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsJoystickButtonDown(joystick_index, joystick_button)end
--- @param joystick_index integer
--- @param joystick_button integer
--- @return bool (Debugish function - returns if 'joystick' button is just down. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsJoystickButtonJustDown(joystick_index, joystick_button)end
--- @param joystick_index integer
--- @param analog_button_index integer
--- @return float (Debugish function - returns analog 'joystick' button value (0-1). analog_button_index 0 = left trigger, 1 = right trigger Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputGetJoystickAnalogButton(joystick_index, analog_button_index)end
--- @param joystick_index integer
--- @return bool (Debugish function - returns true if 'joystick' at that index is connected. Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputIsJoystickConnected(joystick_index)end
--- @param joystick_index integer
--- @param stick_id integer default value 0
--- @return float x, float y (Debugish function - returns analog stick positions (-1,+1). stick_id 0 = left, 1 = right, Does not depend on state. E.g. player could be in menus. See data/scripts/debug/keycodes.lua for the constants)
function InputGetJoystickAnalogStick(joystick_index, stick_id)end
--- @param entity_id integer
--- @return boolean
function IsPlayer(entity_id)end
--- @param entity_id integer
--- @return boolean
function IsInvisible(entity_id)end

--- @return boolean
function GameIsDailyRun()end

--- @return boolean
function GameIsDailyRunOrDailyPracticeRun()end

--- @return boolean
function GameIsModeFullyDeterministic()end
--- @param key string
--- @param value string
function GlobalsSetValue(key, value)end
--- @param key string
--- @param default_value string default value ""
function GlobalsGetValue(key, default_value)end
--- @param key string
--- @return string
function MagicNumbersGetValue(key)end
--- @param new_seed integer
function SetWorldSeed(new_seed)end
--- @param key string
--- @return string
function SessionNumbersGetValue(key)end
--- @param key string
--- @param value string
function SessionNumbersSetValue(key, value)end

function SessionNumbersSave()end

function AutosaveDisable()end
--- @param key string
--- @return string|nil
function StatsGetValue(key)end
--- @param key string
--- @return string
function StatsGlobalGetValue(key)end
--- @param key string
--- @return string
function StatsBiomeGetValue(key)end

function StatsBiomeReset()end
--- @param killed_entity_id integer default value 0
function StatsLogPlayerKill(killed_entity_id)end
--- @param action_id string
--- @param x number default value 0
--- @param y number default value 0
--- @return integer entity_id
function CreateItemActionEntity(action_id, x, y)end
--- @param x number
--- @param y number
--- @param max_level integer
--- @param type integer
--- @param i integer default value 0
--- @return string
function GetRandomActionWithType(x, y, max_level, type, i)end
--- @param x number
--- @param y number
--- @param max_level number
--- @param i integer default value 0
--- @return string
function GetRandomAction(x, y, max_level, i)end

--- @return integer year:int,month:int,day:int,hour:int,minute:int,second
function GameGetDateAndTimeUTC()end

--- @return integer year:int,month:int,day:int,hour:int,minute:int,second
function GameGetDateAndTimeLocal()end
--- @param num_particles integer
--- @param width_outside_camera number
--- @param material_name string
--- @param velocity_min number
--- @param velocity_max number
--- @param gravity number
--- @param droplets_bounce boolean
--- @param draw_as_long boolean
function GameEmitRainParticles(num_particles, width_outside_camera, material_name, velocity_min, velocity_max, gravity, droplets_bounce, draw_as_long)end
--- @param x integer
--- @param y_min integer
--- @param y_max integer
--- @param radius number
--- @param edge_darkening_width number
--- Each beam adds a little overhead to things like chunk creation, so please call this sparingly.
function GameCutThroughWorldVertical(x, y_min, y_max, radius, edge_darkening_width)end
--- @param width integer
--- @param height integer
--- This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
function BiomeMapSetSize(width, height)end

--- @return integer width:int,height
--- if BIOME_MAP in magic_numbers.xml points to a lua file returns that context, if not will return the biome_map size
function BiomeMapGetSize()end
--- @param x integer
--- @param y integer
--- @param color_int integer
--- This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
function BiomeMapSetPixel(x, y, color_int)end
--- @param x integer
--- @param y integer
--- @return integer color
--- This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
function BiomeMapGetPixel(x, y)end
--- @param color integer
--- @return integer
--- Swaps red and blue channels of 'color'. This can be used make sense of the BiomeMapGetPixel() return values. E.g. if( BiomeMapGetPixel( x, y ) == BiomeMapConvertPixelFromUintToInt( 0xFF36D517 ) ) then print('hills') end 
function BiomeMapConvertPixelFromUintToInt(color)end
--- @param x integer
--- @param y integer
--- @param image_filename string
--- This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
function BiomeMapLoadImage(x, y, image_filename)end
--- @param x integer
--- @param y integer
--- @param image_filename string
--- @param image_x integer
--- @param image_y integer
--- @param image_w integer
--- @param image_h integer
--- This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
function BiomeMapLoadImageCropped(x, y, image_filename, image_x, image_y, image_w, image_h)end
--- @param x number
--- @param y number
--- @return number
function BiomeMapGetVerticalPositionInsideBiome(x, y)end
--- @param x number default value camera_x
--- @param y number default value camera_y
--- @return name
function BiomeMapGetName(x, y)end
--- @param x number
--- @param y number
function SetRandomSeed(x, y)end
--- @param a integer default value optional
--- @param b integer default value optional
--- @return number|int.
--- This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns int between 0 and 'a'. If given 2 arguments returns int between 'a' and 'b'.
function Random(a, b)end
--- @param min number default value optional
--- @param max number default value optional
--- @return number
--- This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns number between 0.0 and 'a'. If given 2 arguments returns number between 'a' and 'b'.
function Randomf(min, max)end
--- @param min integer
--- @param max integer
--- @param mean integer
--- @param sharpness number default value 1
--- @param baseline number default value 0.005
--- @return integer
function RandomDistribution(min, max, mean, sharpness, baseline)end
--- @param min number
--- @param max number
--- @param mean number
--- @param sharpness number default value 1
--- @param baseline number default value 0.005
--- @return number
function RandomDistributionf(min, max, mean, sharpness, baseline)end
--- @param x number
--- @param y number
--- @param a int|number default value optional
--- @param b int|number default value optional
--- @return int|number
--- This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns int between 0 and 'a'. If given 4 arguments returns number between 'a' and 'b'.
function ProceduralRandom(x, y, a, b)end
--- @param x number
--- @param y number
--- @param a number default value optional
--- @param b number default value optional
--- @return number
--- This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns a number between 0 and 'a'. If given 4 arguments returns a number between 'a' and 'b'.
function ProceduralRandomf(x, y, a, b)end
--- @param x number
--- @param y number
--- @param a integer default value optional
--- @param b integer default value optional
--- @return number
--- This is kinda messy. If given 2 arguments, returns 0 or 1. If given 3 arguments, returns an int between 0 and 'a'. If given 4 arguments returns an int between 'a' and 'b'.
function ProceduralRandomi(x, y, a, b)end
--- @param entity_id integer
--- @param image_file string
--- @param material string default value ""
--- @param offset_x number default value 0
--- @param offset_y number default value 0
--- @param centered boolean default value false
--- @param is_circle boolean default value false
--- @param material_image_file string default value ""
--- @param use_image_as_colors boolean default value true
--- @return int_body_id
--- Does not work with PhysicsBody2Component. Returns the id of the created physics body.
function PhysicsAddBodyImage(entity_id, image_file, material, offset_x, offset_y, centered, is_circle, material_image_file, use_image_as_colors)end
--- @param entity_id integer
--- @param material string
--- @param offset_x number
--- @param offset_y number
--- @param width integer
--- @param height integer
--- @param centered boolean default value false
--- @return int|nil
--- Does not work with PhysicsBody2Component. Returns the id of the created physics body.
function PhysicsAddBodyCreateBox(entity_id, material, offset_x, offset_y, width, height, centered)end
--- @param entity_id integer
--- @param body_id0 integer
--- @param body_id1 integer
--- @param offset_x number
--- @param offset_y number
--- @param joint_type string
--- @return int|nil
--- Does not work with PhysicsBody2Component. Returns the id of the created joint.
function PhysicsAddJoint(entity_id, body_id0, body_id1, offset_x, offset_y, joint_type)end
--- @param entity_id integer
--- @param force_x number
--- @param force_y number
function PhysicsApplyForce(entity_id, force_x, force_y)end
--- @param entity_id integer
--- @param torque number
function PhysicsApplyTorque(entity_id, torque)end
--- @param entity_id integer
--- @param component_id integer
--- @param torque number
function PhysicsApplyTorqueToComponent(entity_id, component_id, torque)end
--- @param calculate_force_for_body_fn function
--- @param ignore_this_entity integer
--- @param area_min_x number
--- @param area_min_y number
--- @param area_max_x number
--- @param area_max_y number
--- Applies a force calculated by 'calculate_force_for_body_fn' to all bodies in an area. 'calculate_force_for_body_fn' should be a lua function with the following signature: function( body_entity:int, body_mass:number, body_x:number, body_y:number, body_vel_x:number, body_vel_y:number, body_vel_angular:number ) -> force_world_pos_x:number,force_world_pos_y:number,force_x:number,force_y:number,force_angular:number
function PhysicsApplyForceOnArea(calculate_force_for_body_fn, ignore_this_entity, area_min_x, area_min_y, area_max_x, area_max_y)end
--- @param world_pos_min_x number
--- @param world_pos_min_y number
--- @param world_pos_max_x number
--- @param world_pos_max_y number
function PhysicsRemoveJoints(world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y)end
--- @param entity_id integer
--- @param is_static boolean
function PhysicsSetStatic(entity_id, is_static)end
--- @param entity_id integer
--- @param component_id integer
--- @return number vel_x:number,vel_y
function PhysicsGetComponentVelocity(entity_id, component_id)end
--- @param entity_id integer
--- @param component_id integer
--- @return number vel
function PhysicsGetComponentAngularVelocity(entity_id, component_id)end
--- @param component_id integer
--- @return number x:number, y:number, angle:number, vel_x:number, vel_y:number, angular_vel
--- NOTE! results are Box2D units. Velocities need to converted with PhysicsVecToGameVec.
function PhysicsComponentGetTransform(component_id)end
--- @param component_id integer
--- @param x number
--- @param y number
--- @param angle number
--- @param vel_x number
--- @param vel_y number
--- @param angular_vel number
function PhysicsComponentSetTransform(component_id, x, y, angle, vel_x, vel_y, angular_vel)end
--- @param entity_id integer
--- @param component_id integer default value 0
--- @return physics_body_id[]
--- NOTE! If component_id is given, will return all the bodies linked to that component. If component_id is not given, will return all the bodies linked to the entity (with joints or through components).
function PhysicsBodyIDGetFromEntity(entity_id, component_id)end
--- @param world_pos_min_x number
--- @param world_pos_min_y number
--- @param world_pos_max_x number
--- @param world_pos_max_y number
--- @param include_static_bodies boolean default value false
--- @param are_these_box2d_units boolean default value false
--- @return physics_body_id[]
--- NOTE! returns an array of physics_body_id(s) of all the box2d bodies in the given area. The default coordinates are in game world space. If passing a sixth argument with true, we will assume the coordinates are in box2d units. 
function PhysicsBodyIDQueryBodies(world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y, include_static_bodies, are_these_box2d_units)end
--- @param physics_body_id integer
--- @return number nil | x:number, y:number, angle:number, vel_x:number, vel_y:number, angular_vel
--- NOTE! returns nil, if body was not found. Results are Box2D units. Velocities need to converted with PhysicsVecToGameVec.
function PhysicsBodyIDGetTransform(physics_body_id)end
--- @param physics_body_id integer
--- @param x number
--- @param y number
--- @param angle number
--- @param vel_x number
--- @param vel_y number
--- @param angular_vel number
--- Requires min 3 first parameters.
function PhysicsBodyIDSetTransform(physics_body_id, x, y, angle, vel_x, vel_y, angular_vel)end
--- @param physics_body_id integer
--- @param force_x number
--- @param force_y number
--- @param world_pos_x number default value nil
--- @param world_pos_y number default value nil
--- NOTE! force is in box2d units. world_pos_ is game world coordinates. If world_pos is not given will use the objects center as the position of where the force will be applied.],
function PhysicsBodyIDApplyForce(physics_body_id, force_x, force_y, world_pos_x, world_pos_y)end
--- @param physics_body_id integer
--- @param force_x number
--- @param force_y number
--- @param world_pos_x number default value nil
--- @param world_pos_y number default value nil
--- NOTE! impulse is in box2d units. world_pos_ is game world coordinates. If world_pos is not given will use the objects center as the position of where the force will be applied.],
function PhysicsBodyIDApplyLinearImpulse(physics_body_id, force_x, force_y, world_pos_x, world_pos_y)end
--- @param physics_body_id integer
--- @param torque number
function PhysicsBodyIDApplyTorque(physics_body_id, torque)end
--- @param physics_body_id integer
--- @return number x:number, y
--- NOTE! returns nil, if body was not found. Results are Box2D units. 
function PhysicsBodyIDGetWorldCenter(physics_body_id)end
--- @param physics_body_id integer
--- @return number linear_damping:number, angular_damping
--- NOTE! returns nil, if body was not found. Results are 0-1. 
function PhysicsBodyIDGetDamping(physics_body_id)end
--- @param physics_body_id integer
--- @param linear_damping number
--- @param angular_damping number default value nil
--- NOTE! if angular_damping is given will set it as well.
function PhysicsBodyIDSetDamping(physics_body_id, linear_damping, angular_damping)end
--- @param physics_body_id integer
--- @return number gravity_scale
--- NOTE! returns nil, if body was not found. 
function PhysicsBodyIDGetGravityScale(physics_body_id)end
--- @param physics_body_id integer
--- @param gravity_scale number
function PhysicsBodyIDSetGravityScale(physics_body_id, gravity_scale)end
--- @param physics_body_id integer
--- @return nil
function PhysicsBodyIDGetBodyAABB(physics_body_id)end
--- @param entity_id integer
function PhysicsBody2InitFromComponents(entity_id)end
--- @param x number
--- @param y number default value 0
--- @return number x:number,y
function PhysicsPosToGamePos(x, y)end
--- @param x number
--- @param y number default value 0
--- @return number x:number,y
function GamePosToPhysicsPos(x, y)end
--- @param x number
--- @param y number default value 0
--- @return number x:number,y
function PhysicsVecToGameVec(x, y)end
--- @param x number
--- @param y number default value 0
--- @return number x:number,y
function GameVecToPhysicsVec(x, y)end
--- @param world_pos_x number
--- @param world_pos_y number
--- @param image_filename string
--- @param max_durability integer default value 2147483647
function LooseChunk(world_pos_x, world_pos_y, image_filename, max_durability)end
--- @param world_pos_x number
--- @param world_pos_y number
--- @param radius number
--- @param force number
function VerletApplyCircularForce(world_pos_x, world_pos_y, radius, force)end
--- @param world_pos_x number
--- @param world_pos_y number
--- @param radius number
--- @param force_x number
--- @param force_y number
function VerletApplyDirectionalForce(world_pos_x, world_pos_y, radius, force_x, force_y)end
--- @param key string
--- @return bool_is_new
function AddFlagPersistent(key)end
--- @param key string
function RemoveFlagPersistent(key)end
--- @param key string
--- @return boolean
function HasFlagPersistent(key)end
--- @param flag string
function GameAddFlagRun(flag)end
--- @param flag string
function GameRemoveFlagRun(flag)end
--- @param flag string
--- @return boolean
function GameHasFlagRun(flag)end
--- @param event_path string
--- @param can_be_faded boolean
--- @param x number
--- @param y number
function GameTriggerMusicEvent(event_path, can_be_faded, x, y)end
--- @param name string
function GameTriggerMusicCue(name)end
--- @param relative_fade_speed number default value 1
function GameTriggerMusicFadeOutAndDequeueAll(relative_fade_speed)end
--- @param bank_filename string
--- @param event_path string
--- @param x number
--- @param y number
function GamePlaySound(bank_filename, event_path, x, y)end
--- @param entity_id integer
--- @param event_name string
--- Plays a sound through all AudioComponents with matching sound in 'entity_id'.
function GameEntityPlaySound(entity_id, event_name)end
--- @param entity integer
--- @param component_tag string
--- @param intensity number
--- @param intensity2 number default value 0
--- Plays a sound loop through an AudioLoopComponent tagged with 'component_tag' in 'entity'. 'intensity' & 'intensity2' affect the intensity parameters passed to the audio event. Must be called every frame when the sound should play.
function GameEntityPlaySoundLoop(entity, component_tag, intensity, intensity2)end
--- @param parameter_name string
--- @param x number
--- @param y number
--- @param z number
--- @param w number
--- Can be used to pass custom parameters to the post_final shader, or override values set by the game code. The shader uniform called 'parameter_name' will be set to the latest given values on this and following frames.
function GameSetPostFxParameter(parameter_name, x, y, z, w)end
--- @param parameter_name string
--- Will remove a post_final shader parameter value binding set via game GameSetPostFxParameter().
function GameUnsetPostFxParameter(parameter_name)end
--- @param parameter_name string
--- @param texture_filename string
--- @param filtering_mode integer
--- @param wrapping_mode integer
--- @param update_texture boolean default value false
--- Can be used to pass 2D textures to the post_final shader. The shader uniform called 'parameter_name' will be set to the latest given value on this and following frames. 'texture_filename' can either point to a file, or a virtual file created using the ModImage API.\nIf 'update_texture' is true, the texture will be re-uploaded to the GPU (could be useful with dynamic textures, but will incur a heavy performance hit with textures that are loaded from the disk).\nAccepted values for 'filtering_mode' and 'wrapping_mode' can be found in 'data/libs/utilities.lua'. Each call with a unique 'parameter_name' will create a separate texture while the parameter is in use, so this should be used with some care. While it's possible to change 'texture_filename' on the fly, if texture size changed, this causes destruction of the old texture and allocating a new one, which can be quite slow.
function GameSetPostFxTextureParameter(parameter_name, texture_filename, filtering_mode, wrapping_mode, update_texture)end
--- @param name string
--- Will remove a post_final shader parameter value binding set via game GameSetPostFxTextureParameter().
function GameUnsetPostFxTextureParameter(name)end
--- @param text_or_key string
--- @return string
function GameTextGetTranslatedOrNot(text_or_key)end
--- @param key string
--- @param param0 string default value ""
--- @param param1 string default value ""
--- @param param2 string default value ""
--- @return string
function GameTextGet(key, param0, param1, param2)end

--- @return obj gui
function GuiCreate()end
--- @param gui obj
function GuiDestroy(gui)end
--- @param gui obj
function GuiStartFrame(gui)end
--- @param gui obj
--- @param option integer
--- Sets the options that apply to widgets during this frame. For 'option' use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutive calls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. The options will be cleared on next call to GuiStartFrame().
function GuiOptionsAdd(gui, option)end
--- @param gui obj
--- @param option integer
--- Sets the options that apply to widgets during this frame. For 'option' use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutive calls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. The options will be cleared on next call to GuiStartFrame().
function GuiOptionsRemove(gui, option)end
--- @param gui obj
--- Clears the options that apply to widgets during this frame.
function GuiOptionsClear(gui)end
--- @param gui obj
--- @param option integer
--- Sets the options that apply to the next widget during this frame. For 'option' use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutive calls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget.
function GuiOptionsAddForNextWidget(gui, option)end
--- @param gui obj
--- @param red number
--- @param green number
--- @param blue number
--- @param alpha number
--- Sets the color of the next widget during this frame. Color components should be in the 0-1 range.
function GuiColorSetForNextWidget(gui, red, green, blue, alpha)end
--- @param gui obj
--- @param z number
--- Sets the rendering depth ('z') of the widgets following this call. Larger z = deeper. The z will be set to 0 on the next call to GuiStartFrame(). 
function GuiZSet(gui, z)end
--- @param gui obj
--- @param z number
--- Sets the rendering depth ('z') of the next widget following this call. Larger z = deeper.
function GuiZSetForNextWidget(gui, z)end
--- @param gui obj
--- @param id integer
--- Can be used to solve ID conflicts. All ids given to Gui* functions will be hashed with the ids stacked (and hashed together) using GuiIdPush() and GuiIdPop(). The id stack has a max size of 1024, and calls to the function will do nothing if the size is exceeded.
function GuiIdPush(gui, id)end
--- @param gui obj
--- @param str string
--- Pushes the hash of 'str' as a gui id. See GuiIdPush().
function GuiIdPushString(gui, str)end
--- @param gui obj
--- See GuiIdPush().
function GuiIdPop(gui)end
--- @param gui obj
--- Starts a scope where animations initiated using GuiAnimateAlphaFadeIn() etc. will be applied to all widgets.
function GuiAnimateBegin(gui)end
--- @param gui obj
--- Ends a scope where animations initiated using GuiAnimateAlphaFadeIn() etc. will be applied to all widgets.
function GuiAnimateEnd(gui)end
--- @param gui obj
--- @param id integer
--- @param speed number
--- @param step number
--- @param reset boolean
--- Does an alpha tween animation for all widgets inside a scope set using GuiAnimateBegin() and GuiAnimateEnd().
function GuiAnimateAlphaFadeIn(gui, id, speed, step, reset)end
--- @param gui obj
--- @param id integer
--- @param acceleration number
--- @param reset boolean
--- Does a scale tween animation for all widgets inside a scope set using GuiAnimateBegin() and GuiAnimateEnd().
function GuiAnimateScaleIn(gui, id, acceleration, reset)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param text string
--- @param scale number default value 1
--- @param font string default value ""
--- @param font_is_pixel_font boolean default value true
function GuiText(gui, x, y, text, scale, font, font_is_pixel_font)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param text string
--- Deprecated. Use GuiOptionsAdd() or GuiOptionsAddForNextWidget() with GUI_OPTION.Align_HorizontalCenter and GuiText() instead.
function GuiTextCentered(gui, x, y, text)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param sprite_filename string
--- @param alpha number default value 1
--- @param scale number default value 1
--- @param scale_y number default value 0
--- @param rotation number default value 0
--- @param rect_animation_playback_type integer default value GUI_RECT_ANIMATION_PLAYBACK.PlayToEndAndHide
--- @param rect_animation_name string default value ""
--- 'scale' will be used for 'scale_y' if 'scale_y' equals 0.
function GuiImage(gui, id, x, y, sprite_filename, alpha, scale, scale_y, rotation, rect_animation_playback_type, rect_animation_name)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param width number
--- @param height number
--- @param alpha number default value 1
--- @param sprite_filename string default value "data/ui_gfx/decorations/9piece0_gray.png"
--- @param sprite_highlight_filename string default value "data/ui_gfx/decorations/9piece0_gray.png"
function GuiImageNinePiece(gui, id, x, y, width, height, alpha, sprite_filename, sprite_highlight_filename)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param scale number default value 1
--- @param font string default value ""
--- @param font_is_pixel_font boolean default value true
--- @return boolean clicked:bool,right_clicked
--- The old parameter order where 'id' is the last parameter is still supported. The function dynamically picks the correct order based on the type of the 4th parameter.
function GuiButton(gui, id, x, y, text, scale, font, font_is_pixel_font)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param sprite_filename string
--- @return boolean clicked:bool,right_clicked
function GuiImageButton(gui, id, x, y, text, sprite_filename)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param value number
--- @param value_min number
--- @param value_max number
--- @param value_default number
--- @param value_display_multiplier number
--- @param value_formatting string
--- @param width number
--- @return number new_value
--- This is not intended to be outside mod settings menu, and might bug elsewhere.
function GuiSlider(gui, id, x, y, text, value, value_min, value_max, value_default, value_display_multiplier, value_formatting, width)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param width number
--- @param max_length integer
--- @param allowed_characters string default value ""
--- @return new_text
--- 'allowed_characters' should consist only of ASCII characters. This is not intended to be outside mod settings menu, and might bug elsewhere.
function GuiTextInput(gui, id, x, y, text, width, max_length, allowed_characters)end
--- @param gui obj
--- Together with GuiEndAutoBoxNinePiece() this can be used to draw an auto-scaled background box for a bunch of widgets rendered between the calls.
function GuiBeginAutoBox(gui)end
--- @param gui obj
--- @param margin number default value 5
--- @param size_min_x number default value 0
--- @param size_min_y number default value 0
--- @param mirrorize_over_x_axis boolean default value false
--- @param x_axis number default value 0
--- @param sprite_filename string default value "data/ui_gfx/decorations/9piece0_gray.png"
--- @param sprite_highlight_filename string default value "data/ui_gfx/decorations/9piece0_gray.png"
function GuiEndAutoBoxNinePiece(gui, margin, size_min_x, size_min_y, mirrorize_over_x_axis, x_axis, sprite_filename, sprite_highlight_filename)end
--- @param gui obj
--- @param text string
--- @param description string
function GuiTooltip(gui, text, description)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param width number
--- @param height number
--- @param scrollbar_gamepad_focusable boolean default value true
--- @param margin_x number default value 2
--- @param margin_y number default value 2
--- This can be used to create a container with a vertical scroll bar. Widgets between GuiBeginScrollContainer() and GuiEndScrollContainer() will be positioned relative to the container.
function GuiBeginScrollContainer(gui, id, x, y, width, height, scrollbar_gamepad_focusable, margin_x, margin_y)end
--- @param gui obj
function GuiEndScrollContainer(gui)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param position_in_ui_scale boolean default value false
--- @param margin_x number default value 2
--- @param margin_y number default value 2
--- If 'position_in_ui_scale' is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
function GuiLayoutBeginHorizontal(gui, x, y, position_in_ui_scale, margin_x, margin_y)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param position_in_ui_scale boolean default value false
--- @param margin_x number default value 0
--- @param margin_y number default value 0
--- If 'position_in_ui_scale' is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
function GuiLayoutBeginVertical(gui, x, y, position_in_ui_scale, margin_x, margin_y)end
--- @param gui obj
--- @param amount number default value optional
--- Will use the horizontal margin from current layout if amount is not set.
function GuiLayoutAddHorizontalSpacing(gui, amount)end
--- @param gui obj
--- @param amount number default value optional
--- Will use the vertical margin from current layout if amount is not set.
function GuiLayoutAddVerticalSpacing(gui, amount)end
--- @param gui obj
function GuiLayoutEnd(gui)end
--- @param gui obj
--- Puts following things to a new layout layer. Can be used to create non-layouted widgets inside a layout.
function GuiLayoutBeginLayer(gui)end
--- @param gui obj
function GuiLayoutEndLayer(gui)end
--- @param gui obj
--- @return number width:number,height
--- Returns dimensions of viewport in the gui coordinate system (which is equal to the coordinates of the screen bottom right corner in gui coordinates). The values returned may change depending on the game resolution because the UI is scaled for pixel-perfect text rendering.
function GuiGetScreenDimensions(gui)end
--- @param gui obj
--- @param text string
--- @param scale number default value 1
--- @param line_spacing number default value 2
--- @param font string default value ""
--- @param font_is_pixel_font boolean default value true
--- @return number width:number,height
--- Returns size of the given text in the gui coordinate system.
function GuiGetTextDimensions(gui, text, scale, line_spacing, font, font_is_pixel_font)end
--- @param gui obj
--- @param image_filename string
--- @param scale number default value 1
--- @return number width:number,height
--- Returns size of the given image in the gui coordinate system.
function GuiGetImageDimensions(gui, image_filename, scale)end
--- @param gui obj
--- @return number clicked:bool, right_clicked:bool, hovered:bool, x:number, y:number, width:number, height:number, draw_x:number, draw_y:number, draw_width:number, draw_height
--- Returns the final position, size etc calculated for a widget. Some values aren't supported by all widgets.
function GuiGetPreviousWidgetInfo(gui)end

--- @return boolean
function GameIsBetaBuild()end

--- @return boolean
function DebugGetIsDevBuild()end

function DebugEnableTrailerMode()end

--- @return boolean
function GameGetIsTrailerModeEnabled()end

--- This doesn't do anything at the moment.
function Debug_SaveTestPlayer()end
--- @param x number default value camera_x
--- @param y number default value camera_y
--- @return string
function DebugBiomeMapGetFilename(x, y)end
--- @param entity_id integer
--- @param material string
--- @param use_material_colors boolean default value true
--- @param replace_existing_cells default value false
function EntityConvertToMaterial(entity_id, material, use_material_colors, replace_existing_cells)end
--- @param material_dynamic string default value ""
--- @param material_static string default value ""
function ConvertEverythingToGold(material_dynamic, material_static)end
--- @param material_from_type integer
--- @param material_to_type integer
--- Converts 'material_from' to 'material_to' everwhere in the game world, replaces 'material_from_type' to 'material_to_type' in the material (CellData) global table, and marks 'material_from' as a "Transformed" material. Every call will add a new entry to WorldStateComponent which serializes these changes, so please call sparingly. The material conversion will be spread over multiple frames. 'material_from' will still retain the original name id and wang color. Use CellFactory_GetType() to convert a material name to material type.
function ConvertMaterialEverywhere(material_from_type, material_to_type)end
--- @param area_x integer
--- @param area_y integer
--- @param area_w integer
--- @param area_h integer
--- @param material_from_type integer
--- @param material_to_type integer
--- @param trim_box2d boolean
--- @param update_edge_graphics_dummy boolean
--- Converts cells of 'material_from_type' to 'material_to_type' in the given area. If 'box2d_trim' is true, will attempt to trim the created cells where they might otherwise cause physics glitching. 'update_edge_graphics_dummy' is not yet supported.
function ConvertMaterialOnAreaInstantly(area_x, area_y, area_w, area_h, material_from_type, material_to_type, trim_box2d, update_edge_graphics_dummy)end
--- @param filename string
--- @param pos_x number
--- @param pos_y number
--- @param material string default value "meat"
--- @param scale_x number default value 1
--- @param impulse_x number default value 0
--- @param impulse_y number default value 0
--- Loads a given .txt file as a ragdoll into the game, made of the material given in material.
function LoadRagdoll(filename, pos_x, pos_y, material, scale_x, impulse_x, impulse_y)end

--- @return integer
function GetDailyPracticeRunSeed()end
--- @param mod_id string
--- @return boolean
--- Returns true if a mod with the id 'mod_id' is currently active. For example mod_id = "nightmare". 
function ModIsEnabled(mod_id)end

--- @return string[]
--- Returns a table filled with the IDs of currently active mods.
function ModGetActiveModIDs()end

--- @return integer
function ModGetAPIVersion()end
--- @param filename string
--- @return boolean
--- Returns true if the file exists.
function ModDoesFileExist(filename)end

--- @return string[]
--- Returns a list of filenames from which materials were loaded.
function ModMaterialFilesGet()end
--- @param id string
--- @return bool|number|string|nil
--- Returns the value of a mod setting. 'id' should normally be in the format 'mod_name.setting_id'. Cache the returned value in your lua context if possible.
function ModSettingGet(id)end
--- @param id string
--- @param value bool|number|string
--- Sets the value of a mod setting. 'id' should normally be in the format 'mod_name.setting_id'.
function ModSettingSet(id, value)end
--- @param id string
--- @return bool|number|string|nil
--- Returns the latest value set by the user, which might not be equal to the value that is used in the game (depending on the 'scope' value selected for the setting).
function ModSettingGetNextValue(id)end
--- @param id string
--- @param value bool|number|string
--- @param is_default boolean
--- Sets the latest value set by the user, which might not be equal to the value that is displayed to the game (depending on the 'scope' value selected for the setting).
function ModSettingSetNextValue(id, value, is_default)end
--- @param id string
--- @return boolean was_removed
function ModSettingRemove(id)end

--- @return integer
--- Returns the number of mod settings defined. Use ModSettingGetAtIndex to enumerate the settings.
function ModSettingGetCount()end
--- @param index integer
--- @return bool|number|string|nil) | nil (name:string, value:bool|number|string|nil, value_next
--- 'index' should be 0-based index. Returns nil if 'index' is invalid.
function ModSettingGetAtIndex(index)end

--- @return boolean
function StreamingGetIsConnected()end

--- @return string
function StreamingGetConnectedChannelName()end

--- @return integer
function StreamingGetVotingCycleDurationFrames()end

--- @return string
--- Returns the name of a random stream viewer who recently sent a chat message. Returns "" if the 'Creatures can be named after viewers' setting is off.
function StreamingGetRandomViewerName()end

--- @return boolean
function StreamingGetSettingsGhostsNamedAfterViewers()end
--- @param time_between_votes_seconds number
--- @param time_voting_seconds number
--- Sets the duration of the next wait and voting phases. Use -1 for default duration.
function StreamingSetCustomPhaseDurations(time_between_votes_seconds, time_voting_seconds)end

--- Cancels whatever is currently going on, and starts a new voting. _streaming_on_vote_start() and _streaming_get_event_for_vote() will be called as usually.
function StreamingForceNewVoting()end
--- @param enabled boolean
--- Turns the voting UI on or off.
function StreamingSetVotingEnabled(enabled)end
--- @param to_filename string
--- @param from_filename string
--- Basically calls dofile(from_filename) at the end of 'to_filename'. Available only in init.lua. Should not be called after OnMostPostInit(should be avoided after that because changes might not propagate, or could work in non-deterministic manner).
function ModLuaFileAppend(to_filename, from_filename)end
--- @param filename string
--- @return string[]
--- Returns the paths of files that have been appended to 'filename' using ModLuaFileAppend(). Unlike most Mod* functions, this one is available everywhere.
function ModLuaFileGetAppends(filename)end
--- @param filename string
---{string}
--- Replaces the appends list (see ModLuaFileAppend) of a file with the given table. Available only in init.lua. Should not be called after OnMostPostInit(should be avoided after that because changes might not propagate, or could work in non-deterministic manner).
function ModLuaFileSetAppends(filename, {)end
--- @param filename string
--- @return string
--- Returns the current (modded or not) content of the data file 'filename'. Allows access only to data files and files from enabled mods. "mods/mod/data/file.xml" and "data/file.xml" point to the same file. Unlike most Mod* functions, this one is available everywhere.
function ModTextFileGetContent(filename)end
--- @param filename string
--- @param new_content string
--- Sets the content the game sees for the file 'filename'. Allows access only to mod and data files. "mods/mod/data/file.xml" and "data/file.xml" point to the same file. Available only in init.lua. Should not be called after OnMostPostInit (should be avoided after that because changes might not propagate, or could work in non-deterministic manner). ModTextFileWhoSetContent might also return incorrect values if this is used after OnMostPostInit.
function ModTextFileSetContent(filename, new_content)end
--- @param filename string
--- @return string
--- Returns the id of the last mod that called ModTextFileSetContent with 'filename', or "". Unlike most Mod* functions, this one is available everywhere.
function ModTextFileWhoSetContent(filename)end
--- @param filename string
--- @param width integer
--- @param height integer
--- @return integer id:int,w:int,h
--- Makes an image available for in-memory editing through ModImageGetPixel() and ModImageSetPixel(). \nReturns an id that can be used to access the image, and the dimensions of the image. \nIf an image file with the name wasn't found, an in-memory image of the given size will be created, filled with empty pixels (0x0), and added to the virtual filesystem under 'filename'. \nIf an image with the given name has been previously created through ModImageMakeEditable, the id of that image will be returned. In case memory allocation failed, or if this is called outside mod init using a filename that wasn't succesfully used with this function during the init, 0 will be returned as the id. \nThe game will apply further processing to some images, so the final binary data might end up different. For example, R and B channels are sometimes swapped, and on some textures the colors will be extended by one pixel outside areas where A>0. \nIf game code has already loaded the image (for example this could be the case with some UI textures), the changes will probably not be applied. \nThe changes done using the ModImage* API will need to be done again on each game restart/new game. It's possible that some images will be cached over restarts, and changes will not be visible in the game until a full executable restart - you will have to figure out where that applies. \nAllows access to data files and files from enabled mods. "mods/mod/data/file.png" and "data/file.png" point to the same file. Available only in init.lua during mod init. 
function ModImageMakeEditable(filename, width, height)end
--- @param filename string
--- @return integer id:int,w:int,h
--- Returns an id that can be used with ModImageGetPixel and ModImageSetPixel, and the dimensions of the image. \n If a previous successful call to ModImageMakeEditable hasn't been made with the given filename, 0 will be returned as 'id', 'w' and 'h'. \nUnlike most Mod* functions, this one is available everywhere.
function ModImageIdFromFilename(filename)end
--- @param id integer
--- @param x integer
--- @param y integer
--- @return uint
--- Returns the color of a pixel in ABGR format (0xABGR). 'x' and 'y' are zero-based. \nUse ModImageMakeEditable to create an id that can be used with this function. \n While it's possible to edit images after mod init, it's not guaranteed that game systems will see the changes, as the system might already have loaded the image at that point. \nThe function will silently fail nad return 0 if 'id' isn't valid. \nUnlike most Mod* functions, this one is available everywhere.
function ModImageGetPixel(id, x, y)end
--- @param id integer
--- @param x integer
--- @param y integer
--- @param color uint
--- Sets the color of a pixel in ABGR format (0xABGR). 'x' and 'y' are zero-based. \nUse ModImageMakeEditable to create an id that can be used with this function. \n The function will silently fail if 'id' isn't valid. \nUnlike most Mod* functions, this one is available everywhere.
function ModImageSetPixel(id, x, y, color)end
--- @param filename string
--- @return string
--- Returns the id of the last mod that called ModImageMakeEditable with 'filename', or "". Unlike most Mod* functions, this one is available everywhere.
function ModImageWhoSetContent(filename)end
--- @param filename string
--- @return boolean
--- Returns true if a file or virtual image exists for the given filename. Unlike most Mod* functions, this one is available everywhere.
function ModImageDoesExist(filename)end
--- @param filename string
--- Available only during mod initialization in init.lua.
function ModMagicNumbersFileAdd(filename)end
--- @param filename string
--- Available only during mod initialization in init.lua.
function ModMaterialsFileAdd(filename)end
--- @param filename string
--- Registers custom fmod events. Needs to be called to make the game find events in mods' audio banks. Event mapping (GUID) files can be generated using FMOD Studio. Available only during mod initialization in init.lua.
function ModRegisterAudioEventMappings(filename)end
--- @param filename string
--- Registers a custom bank in the music system. After that the tracks can be configured to play through Biome xml, or using GameTriggerMusicEvent. ModRegisterAudioEventMappings also needs to be called to make the game recognize the events in the bank. Available only during mod initialization in init.lua.
function ModRegisterMusicBank(filename)end
--- @param directory_path string
--- @param override_existing boolean default value false
--- Please supply a path starting with "mods/YOUR_MOD_HERE/" or "data/". If override_existing is true, will always generate new maps, overriding existing files. UV maps are generated when you start or continue a game with your mod enabled. Available only during mod initialization in init.lua via noita_dev.exe
function ModDevGenerateSpriteUVsForDirectory(directory_path, override_existing)end
--- @param entity_filename string
function RegisterProjectile(entity_filename)end

function RegisterGunAction()end

function RegisterGunShotEffects()end
--- @param entity_filename string
function BeginProjectile(entity_filename)end

function EndProjectile()end
--- @param timeout_frames integer
function BeginTriggerTimer(timeout_frames)end

function BeginTriggerHitWorld()end

function BeginTriggerDeath()end

function EndTrigger()end

function SetProjectileConfigs()end
--- @param reload_time integer
function StartReload(reload_time)end
--- @param inventoryitem_id integer
--- @param uses_remaining integer
--- @return boolean uses_remaining_reduced
function ActionUsesRemainingChanged(inventoryitem_id, uses_remaining)end
--- @param inventoryitem_id integer
function ActionUsed(inventoryitem_id)end
--- @param action_name string
function LogAction(action_name)end
--- @param action_id string
function OnActionPlayed(action_id)end

function OnNotEnoughManaForAction()end
--- @param name string
function BaabInstruction(name)end
--- @param key string
--- @param value number
function SetValueNumber(key, value)end
--- @param key string
--- @param default_value number
--- @return number
function GetValueNumber(key, default_value)end
--- @param key string
--- @param value integer
function SetValueInteger(key, value)end
--- @param key string
--- @param default_value integer
--- @return integer
function GetValueInteger(key, default_value)end
--- @param key string
--- @param value number
function SetValueBool(key, value)end
--- @param key string
--- @param default_value number
--- @return boolean
function GetValueBool(key, default_value)end
--- @param filename string
--- @return (nil|script_return_type)|(nil,error_string)
--- Returns the script's return value, if any. Returns nil,error_string if the script had errors.
function dofile(filename)end
--- @param filename string
--- @return (nil|script_return_type)|(nil,error_string)
--- Runs the script only once per lua context, returns the script's return value, if any. Returns nil,error_string if the script had errors. For performance reasons it is recommended scripts use dofile_once(), unless the standard dofile behaviour is required.
function dofile_once(filename)end
