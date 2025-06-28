
data:extend{
  {
    type = "selection-tool",
    name = "AreaPaste-paste-planner",
    icon = "__AreaPaste__/graphics/icons/AreaPaste-paste-planner.png",
    icon_size = 64,

    stack_size = 1,
    draw_label_for_cursor_render = true,
    flags = {"not-stackable", "only-in-cursor", "spawnable"},
    hidden = true,

    select = {
      border_color = {0, 1, 0},
      cursor_box_type = "copy",
      mode = {"any-entity", "same-force", "friend"},
    },
    alt_select = {
      border_color = {0, 1, 0},
      cursor_box_type = "copy",
      mode = {"any-entity", "same-force", "friend"},
    },
  },
  {
    type = "custom-input",
    name = "AreaPaste-give-paste-planner",
    action = "spawn-item",
    key_sequence = "CONTROL + SHIFT + V",
    item_to_spawn = "AreaPaste-paste-planner",
  },
  {
    type = "shortcut",
    name = "AreaPaste-give-paste-planner",
    action = "spawn-item",
    associated_control_input = "AreaPaste-give-paste-planner",
    item_to_spawn = "AreaPaste-paste-planner",
    icon = "__AreaPaste__/graphics/icons/shortcut-toolbar/mip/AreaPaste-paste-planner-x32.png",
    icon_size = 32,
    small_icon = "__AreaPaste__/graphics/icons/shortcut-toolbar/mip/AreaPaste-paste-planner-x24.png",
    small_icon_size = 24,
  },
}
