
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
    local player = game.get_player(event.player_index)
    local copy_source = try_get_copy_source(player)
    if copy_source then
      for _, entity in pairs(event.entities) do
        entity.copy_settings(copy_source)
      end
    end
  end
end)
