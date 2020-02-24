
local upgrade_planner = data.raw["upgrade-item"]["upgrade-planner"]

data:extend{
  {
    type = "selection-tool",
    name = "AreaPaste-paste-planner",
    icons = upgrade_planner.icons,
    icon = upgrade_planner.icon,
    icon_size = upgrade_planner.icon_size,

    stack_size = 1,
    stackable = false,
    draw_label_for_cursor_render = true,
    flags = {"hidden", "not-stackable", "only-in-cursor"},

    selection_color = {0, 1, 0},
    alt_selection_color = {0, 1, 0},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    selection_mode = {"blueprint", "same-force", "friend"},
    alt_selection_mode = {"blueprint", "same-force", "friend"},
  },
}
