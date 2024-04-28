-- return {
local spec = {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    -- https://github.com/folke/lazy.nvim/discussions/1167
    --   keys = { "<leader>uC", require("lazyvim.util").telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

vim.keymap.set("n", "<leader>uu", function() --> Show all custom colors in telescope...
  for _, color in ipairs(spec) do --> Load all colors in spec....
    vim.cmd("Lazy load " .. color.name) --> vim colorschemes cannot be required...
  end

  vim.schedule(function() --> Needs to be scheduled:
    -- stylua: ignore
    local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
    "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
    "desert", "delek", "default", "darkblue", "blue" }

    local completion = vim.fn.getcompletion
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.fn.getcompletion = function() --> override
      return vim.tbl_filter(function(color)
        return not vim.tbl_contains(builtins, color) --
      end, completion("", "color"))
    end

    vim.cmd("Telescope colorscheme enable_preview=true")
    vim.fn.getcompletion = completion --> restore
  end)
end, { desc = "Custom Colorschemes", silent = true })

return spec
