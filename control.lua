
local must_check_for_levels = not not script.active_mods["factory-levels"]

---@param name string
---@return string
local function normalize_name(name)
  if not must_check_for_levels then
    return name
  end
  return string.match(name, "^(.-)%-level%-%d+$") or name
end

---@param player LuaPlayer
---@return LuaEntity? copy_source
local function try_get_copy_source(player)
  local copy_source = player.entity_copy_source
  if copy_source then
    return copy_source
  end
  player.create_local_flying_text{text = {"AreaPaste.missing-entity-copy-source"}, position = player.position}
end

script.on_event(defines.events.on_player_selected_area, function(event)
  if event.item ~= "AreaPaste-paste-planner" then return end
  local player_index = event.player_index
  local player = game.get_player(player_index)
  ---@cast player -nil
  local copy_source = try_get_copy_source(player)
  if not copy_source then return end
  local copy_source_name = normalize_name(copy_source.name)
  for _, entity in pairs(event.entities) do
    if not copy_source.valid then break end
    if not entity.valid or normalize_name(entity.name) ~= copy_source_name then goto continue end
    local entity_position = entity.position
    local surface = entity.surface
    -- `copy_settings` raises an event, so every LuaObject could be invalidated by this call.
    local returned_items = entity.copy_settings(copy_source, player)
    if not returned_items[1] or not surface.valid then goto continue end
    if entity.valid and player.can_reach_entity(entity) then
      for _, item_count_with_quality in pairs(returned_items) do
        item_count_with_quality.count = item_count_with_quality.count - player.insert(item_count_with_quality--[[@as ItemStackDefinition]])
        if item_count_with_quality.count == 0 then goto continue end
        surface.spill_item_stack{
          position = player.position,
          stack = item_count_with_quality--[[@as ItemStackDefinition]],
          force = player.force,
          allow_belts = false,
        }
        ::continue::
      end
    else
      for _, item_count_with_quality in pairs(returned_items) do
        surface.spill_item_stack{
          position = entity_position,
          stack = item_count_with_quality--[[@as ItemStackDefinition]],
          force = player.force,
          allow_belts = false,
        }
      end
    end
    ::continue::
  end
end)
