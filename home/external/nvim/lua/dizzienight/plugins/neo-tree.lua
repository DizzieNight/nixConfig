require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    mappings = {
      ["<TAB>"] = {
        "toggle_preview",
        config = {
          use_float = false,
          -- use_image_nvim = true,
          -- title = 'Neo-tree Preview',
        },
      },
    },
    width = 30
  },
  filesystem = {
      bind_to_cwd = true,
      cwd_target = {
          sidebar = "tab",
          current = "window"
      },
      filtered_items = {
          hide_dotfiles = false,
      },
      follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
      },
      group_empty_dirs = true,
  },
  default_component_configs = {
    git_status = {
          symbols = {
            -- Change type
            added     = "✚",
            deleted   = "✖",
            modified  = "",
            renamed   = "󰁕",
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
     indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
  },
})
