
require("__RaiseEventProtection__/protection.lua")

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
      local raise_data = {
        player_index = player_index,
        source = copy_source,
      }
      for _, entity in pairs(event.entities) do
        if entity.name == copy_source_name then
          entity.copy_settings(copy_source)
          raise_data.destination = entity
          script.raise_event(defines.events.on_entity_settings_pasted, raise_data)
        end
      end
    end
  end
end)
