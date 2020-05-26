
local function try_get_copy_source(player)
  local copy_source = player.entity_copy_source
  if copy_source then
    return copy_source
  end
  player.create_local_flying_text{text = {"AreaPaste.missing-entity-copy-source"}, position = player.position}
end

script.on_event(defines.events.on_player_selected_area, function (event)
  if event.item == "AreaPaste-paste-planner" then
    local player_index = event.player_index
    local player = game.get_player(player_index)
    local copy_source = try_get_copy_source(player)
    if copy_source then
      local copy_source_name = copy_source.name
      local player_position = player.position
      local force = player.force
      local player_insert = player.insert
      local spill_item_stack = player.surface.spill_item_stack
      local simple_item_stack = {}
      for _, entity in pairs(event.entities) do
        if entity.name == copy_source_name then
          local returned_items = entity.copy_settings(copy_source, player)
          if next(returned_items) then
            if player.can_reach_entity(entity) then
              for name, count in pairs(returned_items) do
                simple_item_stack.name = name
                simple_item_stack.count = count
                count = count - player_insert(simple_item_stack)
                if count > 0 then
                  simple_item_stack.count = count
                  spill_item_stack(player_position, simple_item_stack, false, force, false)
                end
              end
            else
              local entity_position = entity.position
              for name, count in pairs(returned_items) do
                simple_item_stack.name = name
                simple_item_stack.count = count
                spill_item_stack(entity_position, simple_item_stack, false, force, false)
              end
            end
          end
        end
      end
    end
  end
end)
