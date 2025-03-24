--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
function EntityLoad(filename, pos_x, pos_y)end
--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
function EntityLoadEndGameItem(filename, pos_x, pos_y)end
--- @param filename string
--- @param pos_x number default value 0
--- @param pos_y number default value 0
function EntityLoadCameraBound(filename, pos_x, pos_y)end
--- @param filename string
--- @param entity integer
function EntityLoadToEntity(filename, entity)end
--- @param entity_id integer
--- @param filename string
function EntitySave(entity_id, filename)end
--- @param name string default value ""
function EntityCreateNew(name)end
--- @param entity_id integer
function EntityKill(entity_id)end
--- @param entity_id integer
function EntityGetIsAlive(entity_id)end
--- @param entity_id integer
--- @param component_type_name string
--- @param table_of_component_values string[] default value nil
function EntityAddComponent(entity_id, component_type_name, table_of_component_values)end
--- @param entity_id integer
--- @param component_id integer
function EntityRemoveComponent(entity_id, component_id)end
--- @param entity_id integer
function EntityGetAllComponents(entity_id)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
function EntityGetComponent(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
function EntityGetFirstComponent(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
function EntityGetComponentIncludingDisabled(entity_id, component_type_name, tag)end
--- @param entity_id integer
--- @param component_type_name string
--- @param tag string default value ""
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
function EntityApplyTransform(entity_id, x, y, rotation, scale_x, scale_y)end
--- @param entity_id integer
function EntityGetTransform(entity_id)end
--- @param parent_id integer
--- @param child_id integer
function EntityAddChild(parent_id, child_id)end
--- @param entity_id integer
--- @param tag string default value ""
function EntityGetAllChildren(entity_id, tag)end
--- @param entity_id integer
function EntityGetParent(entity_id)end
--- @param entity_id integer
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
function EntityGetName(entity_id)end
--- @param entity_id integer
--- @param name string
function EntitySetName(entity_id, name)end
--- @param entity_id integer
function EntityGetTags(entity_id)end
--- @param tag string
function EntityGetWithTag(tag)end
--- @param pos_x number
--- @param pos_y number
--- @param radius number
function EntityGetInRadius(pos_x, pos_y, radius)end
--- @param pos_x number
--- @param pos_y number
--- @param radius number
--- @param entity_tag string
function EntityGetInRadiusWithTag(pos_x, pos_y, radius, entity_tag)end
--- @param pos_x number
--- @param pos_y number
function EntityGetClosest(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @param tag string
function EntityGetClosestWithTag(pos_x, pos_y, tag)end
--- @param name string
function EntityGetWithName(name)end
--- @param entity_id integer
--- @param tag string
function EntityAddTag(entity_id, tag)end
--- @param entity_id integer
--- @param tag string
function EntityRemoveTag(entity_id, tag)end
--- @param entity_id integer
--- @param tag string
function EntityHasTag(entity_id, tag)end
--- @param entity_id integer
function EntityGetFilename(entity_id)end

function EntitiesGetMaxID()end
--- @param component_id integer
--- @param variable_name string
function ComponentGetValue(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
function ComponentGetValueBool(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
function ComponentGetValueInt(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
function ComponentGetValueFloat(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
function ComponentGetValueVector2(component_id, variable_name)end
--- @param component_id integer
--- @param variable_name string
--- @param value string
function ComponentSetValue(component_id, variable_name, value)end
--- @param component_id integer
--- @param variable_name string
--- @param x number
--- @param y number
function ComponentSetValueVector2(component_id, variable_name, x, y)end
--- @param component_id integer
--- @param variable_name string
--- @param min number
--- @param max number
function ComponentSetValueValueRange(component_id, variable_name, min, max)end
--- @param component_id integer
--- @param variable_name string
--- @param min number
--- @param max number
function ComponentSetValueValueRangeInt(component_id, variable_name, min, max)end
--- @param component_id integer
--- @param variable_name string
--- @param value string
function ComponentSetMetaCustom(component_id, variable_name, value)end
--- @param component_id integer
--- @param variable_name string
function ComponentGetMetaCustom(component_id, variable_name)end
--- @param component_id integer
--- @param object_name string
--- @param variable_name string
function ComponentObjectGetValue(component_id, object_name, variable_name)end
--- @param component_id integer
--- @param object_name string
--- @param variable_name string
--- @param value string
function ComponentObjectSetValue(component_id, object_name, variable_name, value)end
--- @param component_id integer
--- @param tag string
function ComponentAddTag(component_id, tag)end
--- @param component_id integer
--- @param tag string
function ComponentRemoveTag(component_id, tag)end
--- @param component_id integer
function ComponentGetTags(component_id)end
--- @param component_id integer
--- @param tag string
function ComponentHasTag(component_id, tag)end
--- @param component_id integer
--- @param field_name string
function ComponentGetValue2(component_id, field_name)end
--- @param component_id integer
--- @param field_name string
--- @param value_or_values any
function ComponentSetValue2(component_id, field_name, value_or_values)end
--- @param component_id integer
--- @param object_name string
--- @param field_name string
function ComponentObjectGetValue2(component_id, object_name, field_name)end
--- @param component_id integer
--- @param object_name string
--- @param field_name string
--- @param value_or_values any
function ComponentObjectSetValue2(component_id, object_name, field_name, value_or_values)end
--- @param entity_id integer
--- @param component_type_name
--- @param table_of_component_values table<string, multiple_types> default value nil
function EntityAddComponent2(entity_id, component_type_name, table_of_component_values)end
--- @param component_id integer
--- @param array_member_name string
--- @param type_stored_in_vector string
function ComponentGetVectorSize(component_id, array_member_name, type_stored_in_vector)end
--- @param component_id integer
--- @param array_name string
--- @param type_stored_in_vector string
--- @param index integer
function ComponentGetVectorValue(component_id, array_name, type_stored_in_vector, index)end
--- @param component_id integer
--- @param array_name string
--- @param type_stored_in_vector string
function ComponentGetVector(component_id, array_name, type_stored_in_vector)end
--- @param component_id integer
function ComponentGetIsEnabled(component_id)end
--- @param component_id integer
function ComponentGetEntity(component_id)end
--- @param component_id integer
function ComponentGetMembers(component_id)end
--- @param component_id integer
--- @param object_name string
function ComponentObjectGetMembers(component_id, object_name)end
--- @param component_id integer
function ComponentGetTypeName(component_id)end

function GetUpdatedEntityID()end

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
function SpawnStash(x, y, level, action_count)end
--- @param x number
--- @param y number
--- @param level integer
--- @param spawn_now boolean default value false
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
function RemoveMaterialInventoryMaterial(entity_id, material_name)end
--- @param entity_id integer
--- @param ignore_box2d_materials boolean default value true
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
function GetParallelWorldPosition(world_pos_x, world_pos_y)end
--- @param filename string
--- @param pixel_scenes string default value "data/biome/_pixel_scenes.xml"
function BiomeMapLoad_KeepPlayer(filename, pixel_scenes)end
--- @param filename string
function BiomeMapLoad(filename)end
--- @param filename string
--- @param field_name string
--- @param value any
function BiomeSetValue(filename, field_name, value)end
--- @param filename string
--- @param field_name string
function BiomeGetValue(filename, field_name)end
--- @param filename string
--- @param meta_object_name string
--- @param field_name string
--- @param value any
function BiomeObjectSetValue(filename, meta_object_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
--- @param value any
function BiomeVegetationSetValue(filename, material_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
--- @param value any
function BiomeMaterialSetValue(filename, material_name, field_name, value)end
--- @param filename string
--- @param material_name string
--- @param field_name string
function BiomeMaterialGetValue(filename, material_name, field_name)end

function GameIsIntroPlaying()end

function GameGetIsGamepadConnected()end

function GameGetWorldStateEntity()end

function GameGetPlayerStatsEntity()end

function GameGetOrbCountAllTime()end

function GameGetOrbCountThisRun()end
--- @param orb_id_zero_based integer
function GameGetOrbCollectedThisRun(orb_id_zero_based)end
--- @param orb_id_zero_based integer
function GameGetOrbCollectedAllTime(orb_id_zero_based)end

function GameClearOrbsFoundThisRun()end

function GameGetOrbCountTotal()end
--- @param material_id integer
function CellFactory_GetName(material_id)end
--- @param material_name string
function CellFactory_GetType(material_name)end
--- @param material_id integer
function CellFactory_GetUIName(material_id)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
function CellFactory_GetAllLiquids(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
function CellFactory_GetAllSands(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
function CellFactory_GetAllGases(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
function CellFactory_GetAllFires(include_statics, include_particle_fx_materials)end
--- @param include_statics boolean default value true
--- @param include_particle_fx_materials boolean default value false
function CellFactory_GetAllSolids(include_statics, include_particle_fx_materials)end
--- @param material_id integer
function CellFactory_GetTags(material_id)end
--- @param material_id integer
--- @param tag string
function CellFactory_HasTag(material_id, tag)end

function GameGetCameraPos()end
--- @param x number
--- @param y number
function GameSetCameraPos(x, y)end
--- @param is_free boolean
function GameSetCameraFree(is_free)end

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
function GameGetAllInventoryItems(entity_id)end
--- @param entity_id integer
function GameDropAllItems(entity_id)end
--- @param entity_id integer
function GameDropPlayerInventoryItems(entity_id)end
--- @param entity_id integer
function GameDestroyInventoryItems(entity_id)end

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
function RemovePixelSceneBackgroundSprite(background_file, x, y)end
--- @param x_min number
--- @param y_min number
--- @param x_max number
--- @param y_max number
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
function EntityAddRandomStains(entity, material_type, amount)end
--- @param entity integer
--- @param material_name string
--- @param damage number
function EntitySetDamageFromMaterial(entity, material_name, damage)end
--- @param entity integer
--- @param sprite_component integer
function EntityRefreshSprite(entity, sprite_component)end
--- @param entity integer
function EntityGetWandCapacity(entity)end
--- @param entity integer
--- @param hotspot_tag string
--- @param transformed boolean
--- @param include_disabled_components boolean default value false
function EntityGetHotspot(entity, hotspot_tag, transformed, include_disabled_components)end
--- @param entity_id integer
--- @param name string
--- @param priority integer
--- @param followup_name string default value ""
--- @param followup_priority integer default value 0
function GamePlayAnimation(entity_id, name, priority, followup_name, followup_priority)end
--- @param entity_id integer
function GameGetVelocityCompVelocity(entity_id)end
--- @param entity_id integer
--- @param game_effect_name string
function GameGetGameEffect(entity_id, game_effect_name)end
--- @param entity_id integer
--- @param game_effect_name string
function GameGetGameEffectCount(entity_id, game_effect_name)end
--- @param entity_id integer
--- @param game_effect_entity_file string
function LoadGameEffectEntityTo(entity_id, game_effect_entity_file)end
--- @param entity_id integer
--- @param game_effect_name string
--- @param always_load_new boolean
function GetGameEffectLoadTo(entity_id, game_effect_name, always_load_new)end
--- @param entity_xml string
--- @param is_rare boolean default value false
--- @param add_only_one_copy boolean default value true
function PolymorphTableAddEntity(entity_xml, is_rare, add_only_one_copy)end
--- @param entity_xml string
--- @param from_common_table boolean default value true
--- @param from_rare_table boolean default value true
function PolymorphTableRemoveEntity(entity_xml, from_common_table, from_rare_table)end
---bool rare_table = false
function PolymorphTableGet(bool)end
---{table_of_xml_entities}
---bool rare_table = false
function PolymorphTableSet({, bool)end
--- @param x number
--- @param y number
function SetPlayerSpawnLocation(x, y)end
--- @param action_id string
function UnlockItem(action_id)end
--- @param entity_id integer
function GameGetPotionColorUint(entity_id)end
--- @param entity_id integer
function EntityGetFirstHitboxCenter(entity_id)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
function Raytrace(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
function RaytraceSurfaces(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
function RaytraceSurfacesAndLiquiform(x1, y1, x2, y2)end
--- @param x1 number
--- @param y1 number
--- @param x2 number
--- @param y2 number
function RaytracePlatforms(x1, y1, x2, y2)end
--- @param ideal_pos_x number
--- @param idea_pos_y number
--- @param velocity_x number
--- @param velocity_y number
--- @param body_radius number
function FindFreePositionForBody(ideal_pos_x, idea_pos_y, velocity_x, velocity_y, body_radius)end
--- @param pos_x number
--- @param pos_y number
--- @param ray_length number
--- @param ray_count integer
function GetSurfaceNormal(pos_x, pos_y, ray_length, ray_count)end
--- @param pos_x number
--- @param pos_y number
function GameGetSkyVisibility(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
function GameGetFogOfWar(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
function GameGetFogOfWarBilinear(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
--- @param fog_of_war integer
function GameSetFogOfWar(pos_x, pos_y, fog_of_war)end
--- @param min_x integer
--- @param min_y integer
--- @param max_x integer
--- @param max_y integer
function DoesWorldExistAt(min_x, min_y, max_x, max_y)end
--- @param herd_name string
function StringToHerdId(herd_name)end
--- @param herd_id integer
function HerdIdToString(herd_id)end
--- @param herd_id_a integer
--- @param herd_id_b integer
function GetHerdRelation(herd_id_a, herd_id_b)end
--- @param entity_a integer
--- @param entity_b integer
function EntityGetHerdRelation(entity_a, entity_b)end
--- @param entity_a integer
--- @param entity_b integer
function EntityGetHerdRelationSafe(entity_a, entity_b)end
--- @param entity_id integer
--- @param new_herd_id string
function GenomeSetHerdId(entity_id, new_herd_id)end
--- @param pos_x number
--- @param pos_y number
function EntityGetClosestWormAttractor(pos_x, pos_y)end
--- @param pos_x number
--- @param pos_y number
function EntityGetClosestWormDetractor(pos_x, pos_y)end
--- @param log_line string
function GamePrint(log_line)end
--- @param title string
--- @param description string default value ""
--- @param ui_custom_decoration_file string default value ""
function GamePrintImportant(title, description, ui_custom_decoration_file)end

function DEBUG_GetMouseWorld()end
--- @param x number
--- @param y number
--- @param message string default value ""
--- @param color_r number default value 1
--- @param color_g number default value 0
--- @param color_b number default value 0
function DEBUG_MARK(x, y, message, color_r, color_g, color_b)end

function GameGetFrameNum()end

function GameGetRealWorldTimeSinceStarted()end
--- @param key_code integer
function InputIsKeyDown(key_code)end
--- @param key_code integer
function InputIsKeyJustDown(key_code)end
--- @param key_code integer
function InputIsKeyJustUp(key_code)end

function InputGetMousePosOnScreen()end
--- @param mouse_button integer
function InputIsMouseButtonDown(mouse_button)end
--- @param mouse_button integer
function InputIsMouseButtonJustDown(mouse_button)end
--- @param mouse_button integer
function InputIsMouseButtonJustUp(mouse_button)end
--- @param joystick_index integer
--- @param joystick_button integer
function InputIsJoystickButtonDown(joystick_index, joystick_button)end
--- @param joystick_index integer
--- @param joystick_button integer
function InputIsJoystickButtonJustDown(joystick_index, joystick_button)end
--- @param joystick_index integer
--- @param analog_button_index integer
function InputGetJoystickAnalogButton(joystick_index, analog_button_index)end
--- @param joystick_index integer
function InputIsJoystickConnected(joystick_index)end
--- @param joystick_index integer
--- @param stick_id integer default value 0
function InputGetJoystickAnalogStick(joystick_index, stick_id)end
--- @param entity_id integer
function IsPlayer(entity_id)end
--- @param entity_id integer
function IsInvisible(entity_id)end

function GameIsDailyRun()end

function GameIsDailyRunOrDailyPracticeRun()end

function GameIsModeFullyDeterministic()end
--- @param key string
--- @param value string
function GlobalsSetValue(key, value)end
--- @param key string
--- @param default_value string default value ""
function GlobalsGetValue(key, default_value)end
--- @param key string
function MagicNumbersGetValue(key)end
--- @param new_seed integer
function SetWorldSeed(new_seed)end
--- @param key string
function SessionNumbersGetValue(key)end
--- @param key string
--- @param value string
function SessionNumbersSetValue(key, value)end

function SessionNumbersSave()end

function AutosaveDisable()end
--- @param key string
function StatsGetValue(key)end
--- @param key string
function StatsGlobalGetValue(key)end
--- @param key string
function StatsBiomeGetValue(key)end

function StatsBiomeReset()end
--- @param killed_entity_id integer default value 0
function StatsLogPlayerKill(killed_entity_id)end
--- @param action_id string
--- @param x number default value 0
--- @param y number default value 0
function CreateItemActionEntity(action_id, x, y)end
--- @param x number
--- @param y number
--- @param max_level integer
--- @param type integer
--- @param i integer default value 0
function GetRandomActionWithType(x, y, max_level, type, i)end
--- @param x number
--- @param y number
--- @param max_level number
--- @param i integer default value 0
function GetRandomAction(x, y, max_level, i)end

function GameGetDateAndTimeUTC()end

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
function GameCutThroughWorldVertical(x, y_min, y_max, radius, edge_darkening_width)end
--- @param width integer
--- @param height integer
function BiomeMapSetSize(width, height)end

function BiomeMapGetSize()end
--- @param x integer
--- @param y integer
--- @param color_int integer
function BiomeMapSetPixel(x, y, color_int)end
--- @param x integer
--- @param y integer
function BiomeMapGetPixel(x, y)end
--- @param color integer
function BiomeMapConvertPixelFromUintToInt(color)end
--- @param x integer
--- @param y integer
--- @param image_filename string
function BiomeMapLoadImage(x, y, image_filename)end
--- @param x integer
--- @param y integer
--- @param image_filename string
--- @param image_x integer
--- @param image_y integer
--- @param image_w integer
--- @param image_h integer
function BiomeMapLoadImageCropped(x, y, image_filename, image_x, image_y, image_w, image_h)end
--- @param x number
--- @param y number
function BiomeMapGetVerticalPositionInsideBiome(x, y)end
--- @param x number default value camera_x
--- @param y number default value camera_y
function BiomeMapGetName(x, y)end
--- @param x number
--- @param y number
function SetRandomSeed(x, y)end
--- @param a integer default value optional
--- @param b integer default value optional
function Random(a, b)end
--- @param min number default value optional
--- @param max number default value optional
function Randomf(min, max)end
--- @param min integer
--- @param max integer
--- @param mean integer
--- @param sharpness number default value 1
--- @param baseline number default value 0.005
function RandomDistribution(min, max, mean, sharpness, baseline)end
--- @param min number
--- @param max number
--- @param mean number
--- @param sharpness number default value 1
--- @param baseline number default value 0.005
function RandomDistributionf(min, max, mean, sharpness, baseline)end
--- @param x number
--- @param y number
--- @param a int|number default value optional
--- @param b int|number default value optional
function ProceduralRandom(x, y, a, b)end
--- @param x number
--- @param y number
--- @param a number default value optional
--- @param b number default value optional
function ProceduralRandomf(x, y, a, b)end
--- @param x number
--- @param y number
--- @param a integer default value optional
--- @param b integer default value optional
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
function PhysicsAddBodyImage(entity_id, image_file, material, offset_x, offset_y, centered, is_circle, material_image_file, use_image_as_colors)end
--- @param entity_id integer
--- @param material string
--- @param offset_x number
--- @param offset_y number
--- @param width integer
--- @param height integer
--- @param centered boolean default value false
function PhysicsAddBodyCreateBox(entity_id, material, offset_x, offset_y, width, height, centered)end
--- @param entity_id integer
--- @param body_id0 integer
--- @param body_id1 integer
--- @param offset_x number
--- @param offset_y number
--- @param joint_type string
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
function PhysicsGetComponentVelocity(entity_id, component_id)end
--- @param entity_id integer
--- @param component_id integer
function PhysicsGetComponentAngularVelocity(entity_id, component_id)end
--- @param component_id integer
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
function PhysicsBodyIDGetFromEntity(entity_id, component_id)end
--- @param world_pos_min_x number
--- @param world_pos_min_y number
--- @param world_pos_max_x number
--- @param world_pos_max_y number
--- @param include_static_bodies boolean default value false
--- @param are_these_box2d_units boolean default value false
function PhysicsBodyIDQueryBodies(world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y, include_static_bodies, are_these_box2d_units)end
--- @param physics_body_id integer
function PhysicsBodyIDGetTransform(physics_body_id)end
--- @param physics_body_id integer
--- @param x number
--- @param y number
--- @param angle number
--- @param vel_x number
--- @param vel_y number
--- @param angular_vel number
function PhysicsBodyIDSetTransform(physics_body_id, x, y, angle, vel_x, vel_y, angular_vel)end
--- @param physics_body_id integer
--- @param force_x number
--- @param force_y number
--- @param world_pos_x number default value nil
--- @param world_pos_y number default value nil
function PhysicsBodyIDApplyForce(physics_body_id, force_x, force_y, world_pos_x, world_pos_y)end
--- @param physics_body_id integer
--- @param force_x number
--- @param force_y number
--- @param world_pos_x number default value nil
--- @param world_pos_y number default value nil
function PhysicsBodyIDApplyLinearImpulse(physics_body_id, force_x, force_y, world_pos_x, world_pos_y)end
--- @param physics_body_id integer
--- @param torque number
function PhysicsBodyIDApplyTorque(physics_body_id, torque)end
--- @param physics_body_id integer
function PhysicsBodyIDGetWorldCenter(physics_body_id)end
--- @param physics_body_id integer
function PhysicsBodyIDGetDamping(physics_body_id)end
--- @param physics_body_id integer
--- @param linear_damping number
--- @param angular_damping number default value nil
function PhysicsBodyIDSetDamping(physics_body_id, linear_damping, angular_damping)end
--- @param physics_body_id integer
function PhysicsBodyIDGetGravityScale(physics_body_id)end
--- @param physics_body_id integer
--- @param gravity_scale number
function PhysicsBodyIDSetGravityScale(physics_body_id, gravity_scale)end
--- @param physics_body_id integer
function PhysicsBodyIDGetBodyAABB(physics_body_id)end
--- @param entity_id integer
function PhysicsBody2InitFromComponents(entity_id)end
--- @param x number
--- @param y number default value 0
function PhysicsPosToGamePos(x, y)end
--- @param x number
--- @param y number default value 0
function GamePosToPhysicsPos(x, y)end
--- @param x number
--- @param y number default value 0
function PhysicsVecToGameVec(x, y)end
--- @param x number
--- @param y number default value 0
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
function AddFlagPersistent(key)end
--- @param key string
function RemoveFlagPersistent(key)end
--- @param key string
function HasFlagPersistent(key)end
--- @param flag string
function GameAddFlagRun(flag)end
--- @param flag string
function GameRemoveFlagRun(flag)end
--- @param flag string
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
function GameEntityPlaySound(entity_id, event_name)end
--- @param entity integer
--- @param component_tag string
--- @param intensity number
--- @param intensity2 number default value 0
function GameEntityPlaySoundLoop(entity, component_tag, intensity, intensity2)end
--- @param parameter_name string
--- @param x number
--- @param y number
--- @param z number
--- @param w number
function GameSetPostFxParameter(parameter_name, x, y, z, w)end
--- @param parameter_name string
function GameUnsetPostFxParameter(parameter_name)end
--- @param parameter_name string
--- @param texture_filename string
--- @param filtering_mode integer
--- @param wrapping_mode integer
--- @param update_texture boolean default value false
function GameSetPostFxTextureParameter(parameter_name, texture_filename, filtering_mode, wrapping_mode, update_texture)end
--- @param name string
function GameUnsetPostFxTextureParameter(name)end
--- @param text_or_key string
function GameTextGetTranslatedOrNot(text_or_key)end
--- @param key string
--- @param param0 string default value ""
--- @param param1 string default value ""
--- @param param2 string default value ""
function GameTextGet(key, param0, param1, param2)end

function GuiCreate()end
--- @param gui obj
function GuiDestroy(gui)end
--- @param gui obj
function GuiStartFrame(gui)end
--- @param gui obj
--- @param option integer
function GuiOptionsAdd(gui, option)end
--- @param gui obj
--- @param option integer
function GuiOptionsRemove(gui, option)end
--- @param gui obj
function GuiOptionsClear(gui)end
--- @param gui obj
--- @param option integer
function GuiOptionsAddForNextWidget(gui, option)end
--- @param gui obj
--- @param red number
--- @param green number
--- @param blue number
--- @param alpha number
function GuiColorSetForNextWidget(gui, red, green, blue, alpha)end
--- @param gui obj
--- @param z number
function GuiZSet(gui, z)end
--- @param gui obj
--- @param z number
function GuiZSetForNextWidget(gui, z)end
--- @param gui obj
--- @param id integer
function GuiIdPush(gui, id)end
--- @param gui obj
--- @param str string
function GuiIdPushString(gui, str)end
--- @param gui obj
function GuiIdPop(gui)end
--- @param gui obj
function GuiAnimateBegin(gui)end
--- @param gui obj
function GuiAnimateEnd(gui)end
--- @param gui obj
--- @param id integer
--- @param speed number
--- @param step number
--- @param reset boolean
function GuiAnimateAlphaFadeIn(gui, id, speed, step, reset)end
--- @param gui obj
--- @param id integer
--- @param acceleration number
--- @param reset boolean
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
function GuiButton(gui, id, x, y, text, scale, font, font_is_pixel_font)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param sprite_filename string
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
function GuiSlider(gui, id, x, y, text, value, value_min, value_max, value_default, value_display_multiplier, value_formatting, width)end
--- @param gui obj
--- @param id integer
--- @param x number
--- @param y number
--- @param text string
--- @param width number
--- @param max_length integer
--- @param allowed_characters string default value ""
function GuiTextInput(gui, id, x, y, text, width, max_length, allowed_characters)end
--- @param gui obj
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
function GuiBeginScrollContainer(gui, id, x, y, width, height, scrollbar_gamepad_focusable, margin_x, margin_y)end
--- @param gui obj
function GuiEndScrollContainer(gui)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param position_in_ui_scale boolean default value false
--- @param margin_x number default value 2
--- @param margin_y number default value 2
function GuiLayoutBeginHorizontal(gui, x, y, position_in_ui_scale, margin_x, margin_y)end
--- @param gui obj
--- @param x number
--- @param y number
--- @param position_in_ui_scale boolean default value false
--- @param margin_x number default value 0
--- @param margin_y number default value 0
function GuiLayoutBeginVertical(gui, x, y, position_in_ui_scale, margin_x, margin_y)end
--- @param gui obj
--- @param amount number default value optional
function GuiLayoutAddHorizontalSpacing(gui, amount)end
--- @param gui obj
--- @param amount number default value optional
function GuiLayoutAddVerticalSpacing(gui, amount)end
--- @param gui obj
function GuiLayoutEnd(gui)end
--- @param gui obj
function GuiLayoutBeginLayer(gui)end
--- @param gui obj
function GuiLayoutEndLayer(gui)end
--- @param gui obj
function GuiGetScreenDimensions(gui)end
--- @param gui obj
--- @param text string
--- @param scale number default value 1
--- @param line_spacing number default value 2
--- @param font string default value ""
--- @param font_is_pixel_font boolean default value true
function GuiGetTextDimensions(gui, text, scale, line_spacing, font, font_is_pixel_font)end
--- @param gui obj
--- @param image_filename string
--- @param scale number default value 1
function GuiGetImageDimensions(gui, image_filename, scale)end
--- @param gui obj
function GuiGetPreviousWidgetInfo(gui)end

function GameIsBetaBuild()end

function DebugGetIsDevBuild()end

function DebugEnableTrailerMode()end

function GameGetIsTrailerModeEnabled()end

function Debug_SaveTestPlayer()end
--- @param x number default value camera_x
--- @param y number default value camera_y
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
function ConvertMaterialEverywhere(material_from_type, material_to_type)end
--- @param area_x integer
--- @param area_y integer
--- @param area_w integer
--- @param area_h integer
--- @param material_from_type integer
--- @param material_to_type integer
--- @param trim_box2d boolean
--- @param update_edge_graphics_dummy boolean
function ConvertMaterialOnAreaInstantly(area_x, area_y, area_w, area_h, material_from_type, material_to_type, trim_box2d, update_edge_graphics_dummy)end
--- @param filename string
--- @param pos_x number
--- @param pos_y number
--- @param material string default value "meat"
--- @param scale_x number default value 1
--- @param impulse_x number default value 0
--- @param impulse_y number default value 0
function LoadRagdoll(filename, pos_x, pos_y, material, scale_x, impulse_x, impulse_y)end

function GetDailyPracticeRunSeed()end
--- @param mod_id string
function ModIsEnabled(mod_id)end

function ModGetActiveModIDs()end

function ModGetAPIVersion()end
--- @param filename string
function ModDoesFileExist(filename)end

function ModMaterialFilesGet()end
--- @param id string
function ModSettingGet(id)end
--- @param id string
--- @param value bool|number|string
function ModSettingSet(id, value)end
--- @param id string
function ModSettingGetNextValue(id)end
--- @param id string
--- @param value bool|number|string
--- @param is_default boolean
function ModSettingSetNextValue(id, value, is_default)end
--- @param id string
function ModSettingRemove(id)end

function ModSettingGetCount()end
--- @param index integer
function ModSettingGetAtIndex(index)end

function StreamingGetIsConnected()end

function StreamingGetConnectedChannelName()end

function StreamingGetVotingCycleDurationFrames()end

function StreamingGetRandomViewerName()end

function StreamingGetSettingsGhostsNamedAfterViewers()end
--- @param time_between_votes_seconds number
--- @param time_voting_seconds number
function StreamingSetCustomPhaseDurations(time_between_votes_seconds, time_voting_seconds)end

function StreamingForceNewVoting()end
--- @param enabled boolean
function StreamingSetVotingEnabled(enabled)end
--- @param to_filename string
--- @param from_filename string
function ModLuaFileAppend(to_filename, from_filename)end
--- @param filename string
function ModLuaFileGetAppends(filename)end
--- @param filename string
---{string}
function ModLuaFileSetAppends(filename, {)end
--- @param filename string
function ModTextFileGetContent(filename)end
--- @param filename string
--- @param new_content string
function ModTextFileSetContent(filename, new_content)end
--- @param filename string
function ModTextFileWhoSetContent(filename)end
--- @param filename string
--- @param width integer
--- @param height integer
function ModImageMakeEditable(filename, width, height)end
--- @param filename string
function ModImageIdFromFilename(filename)end
--- @param id integer
--- @param x integer
--- @param y integer
function ModImageGetPixel(id, x, y)end
--- @param id integer
--- @param x integer
--- @param y integer
--- @param color uint
function ModImageSetPixel(id, x, y, color)end
--- @param filename string
function ModImageWhoSetContent(filename)end
--- @param filename string
function ModImageDoesExist(filename)end
--- @param filename string
function ModMagicNumbersFileAdd(filename)end
--- @param filename string
function ModMaterialsFileAdd(filename)end
--- @param filename string
function ModRegisterAudioEventMappings(filename)end
--- @param filename string
function ModRegisterMusicBank(filename)end
--- @param directory_path string
--- @param override_existing boolean default value false
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
function GetValueNumber(key, default_value)end
--- @param key string
--- @param value integer
function SetValueInteger(key, value)end
--- @param key string
--- @param default_value integer
function GetValueInteger(key, default_value)end
--- @param key string
--- @param value number
function SetValueBool(key, value)end
--- @param key string
--- @param default_value number
function GetValueBool(key, default_value)end
--- @param filename string
function dofile(filename)end
--- @param filename string
function dofile_once(filename)end
