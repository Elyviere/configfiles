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
          accept = "<CR>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-d>",
        },
      },
    })
  end,
  keys = {
    {
      "<leader>Cv",
      function()
        require("copilot.suggestion").is_visible()
      end,
      desc = "Is visible",
    },
    -- {
    --   "<leader>Ca",
    --   function()
    --     require("copilot.suggestion").accept_word()
    --   end,
    --   desc = "Accept word",
    -- },
    -- {
    --   "<leader>CA",
    --   function()
    --     require("copilot.suggestion").accept_line()
    --   end,
    --   desc = "Accept line",
    -- },
    -- {
    --   "<leader>Cn",
    --   function()
    --     require("copilot.suggestion").next()
    --   end,
    --   desc = "Next",
    -- },
    -- {
    --   "<leader>Cp",
    --   function()
    --     require("copilot.suggestion").prev()
    --   end,
    --   desc = "Previous",
    -- },
    {
      "<leader>Ct",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
      end,
      desc = "Toggle auto-trigger",
    },
  },
}
