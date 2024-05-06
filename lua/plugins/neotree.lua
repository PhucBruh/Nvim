return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup {
        enable_git_status = false,
        filesystem = {
          filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = {},
          },
        },
        popup_border_style = "rounded",
        window = {
          position = "float",
          mappings = {
            ["h"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" and node:is_expanded() then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,

            ["l"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                if not node:is_expanded() then
                  require("neo-tree.sources.filesystem").toggle_directory(state, node)
                elseif node:has_children() then
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                else
                  require("neo-tree.sources.filesystem").open_tabnew(state, node)
                end
              end
            end,

            ["o"] = "open",
          },
        },
      }
    end,
  },
}
