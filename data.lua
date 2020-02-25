
local upgrade_planner = data.raw["upgrade-item"]["upgrade-planner"]
local upgrade_planner_shortcut = data.raw["shortcut"]["give-upgrade-planner"]

data:extend{
  {
    type = "selection-tool",
    name = "AreaPaste-paste-planner",
    icons = upgrade_planner.icons,
    icon = upgrade_planner.icon,
    icon_size = upgrade_planner.icon_size,
    category = upgrade_planner.category,

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
  {
    type = "custom-input",
    name = "AreaPaste-give-paste-planner",
    action = "create-blueprint-item",
    key_sequence = "CONTROL + SHIFT + mouse-button-1",
    item_to_create = "AreaPaste-paste-planner",
  },
  {
    type = "shortcut",
    name = "AreaPaste-give-paste-planner",
    action = "create-blueprint-item",
    associated_control_input = "AreaPaste-give-paste-planner",
    item_to_create = "AreaPaste-paste-planner",
    icon = upgrade_planner_shortcut.icon,
    disabled_icon = upgrade_planner_shortcut.disabled_icon,
    small_icon = upgrade_planner_shortcut.small_icon,
    disabled_small_icon = upgrade_planner_shortcut.disabled_small_icon,
  },
}
