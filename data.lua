
data:extend{
  {
    type = "selection-tool",
    name = "AreaPaste-paste-planner",
    icon = "__AreaPaste__/graphics/icons/AreaPaste-paste-planner.png",
    icon_size = 64,
    icon_mipmaps = 4,

    stack_size = 1,
    draw_label_for_cursor_render = true,
    flags = {"hidden", "not-stackable", "only-in-cursor", "spawnable"},

    selection_color = {0, 1, 0},
    alt_selection_color = {0, 1, 0},
    selection_cursor_box_type = "copy",
    alt_selection_cursor_box_type = "copy",
    selection_mode = {"any-entity", "same-force", "friend"},
    alt_selection_mode = {"any-entity", "same-force", "friend"},
  },
  {
    type = "custom-input",
    name = "AreaPaste-give-paste-planner",
    action = "spawn-item",
    key_sequence = "CONTROL + SHIFT + mouse-button-1",
    item_to_spawn = "AreaPaste-paste-planner",
  },
  {
    type = "shortcut",
    name = "AreaPaste-give-paste-planner",
    action = "spawn-item",
    associated_control_input = "AreaPaste-give-paste-planner",
    item_to_spawn = "AreaPaste-paste-planner",
    icon =
    {
      filename = "__AreaPaste__/graphics/icons/shortcut-toolbar/mip/AreaPaste-paste-planner-x32.png",
      priority = "extra-high-no-scale",
      size = 32,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    small_icon =
    {
      filename = "__AreaPaste__/graphics/icons/shortcut-toolbar/mip/AreaPaste-paste-planner-x24.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
    disabled_small_icon =
    {
      filename = "__AreaPaste__/graphics/icons/shortcut-toolbar/mip/AreaPaste-paste-planner-x24-white.png",
      priority = "extra-high-no-scale",
      size = 24,
      scale = 0.5,
      mipmap_count = 2,
      flags = {"gui-icon"}
    },
  },
}
