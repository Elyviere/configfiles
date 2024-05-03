return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      auto_refresh = true,
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-d>",
        },
      },
    })
  end,
  keys = {
    {
      "<leader>Cp",
      function()
        require("copilot.panel").open({})
      end,
      desc = "Open panel",
    },
    {
      "<leader>Ct",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
      end,
      desc = "Toggle auto-trigger",
    },
  },
}
