-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--

return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal_cmd = "/Users/michael/.local/bin/claude", -- Use output from 'which claude'
    },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  {
    "LintaoAmons/bookmarks.nvim",
    -- pin the plugin at specific version for stability
    -- backup your bookmark sqlite db when there are breaking changes (major version change)
    tag = "3.2.0",
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "stevearc/dressing.nvim" }, -- optional: better UI
    },
    config = function()
      local opts = {} -- check the "./lua/bookmarks/default-config.lua" file for all the options
      require("bookmarks").setup(opts) -- you must call setup to init sqlite db
    end,
    keys = {
      { "<leader>b", nil, desc = "Bookmarks" },
      { "<leader>bm", "<cmd>BookmarksMark<cr>", desc = "Mark bookmark" },
      { "<leader>bl", "<cmd>BookmarksGoto<cr>", desc = "List bookmarks" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      open_mapping = [[<C-\>]],
      winbar = {
        enabled = true,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })

      vim.keymap.set("n", "<leader>gg", function()
        lazygit:toggle()
      end, { desc = "Lazygit" })
    end,
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select terminal" },
      { "<leader>gg", desc = "Lazygit" },
    },
  },
}

-- See the kickstart.nvim README for more information
