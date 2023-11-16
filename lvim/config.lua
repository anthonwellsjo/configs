--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- copy absolute file path
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- copy from git root absolute file path
vim.api.nvim_create_user_command("Cprootpath", function()
  local path = vim.fn.expand('%')
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- general
lvim.log.level = "info"
lvim.format_on_save.enabled = false
lvim.colorscheme = "papercolor"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- move the cursor without leaving insert mode
lvim.keys.insert_mode["<C-j>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.normal_mode["<C-Up>"] = false
lvim.keys.normal_mode["<C-Down>"] = false


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.lsp.automatic_servers_installation = false

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["a"] = {
  name = "+Two slash queries",
  i = { "<cmd>InspectTwoslashQueries<cr>", "Inspect" },
  e = { "<cmd>EnableTwoslashQueries<cr>", "Enable" },
  d = { "<cmd>DisableTwoslashQueries<cr>", "Disable" },
  r = { "<cmd>RemoveTwoslashQueries<cr>", "Remove all" }
}

lvim.builtin.which_key.mappings["z"] = {
  name = "+Change background",
  l = { "<cmd>set background=light<cr>", "Light" },
  d = { "<cmd>set background=dark<cr>", "Dark" },
  b = { "<cmd>colorscheme zenburned<cr><cmd>set background=dark<cr>", "Burned" },
  z = { "<cmd>colorscheme zenbones<cr>", "Zen" },
  g = { "<cmd>colorscheme gruvbox<cr>", "Gruv" },
  p = { "<cmd>colorscheme papercolor<cr>", "Paper" }
}
lvim.builtin.which_key.mappings["n"] = {
  name = "+Harpoon",
  a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
  s = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle quick menu" },
  n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next" },
  p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Next" },

}

lvim.builtin.which_key.mappings["o"] = { "<cmd>only<cr>", "Only" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>:%! rustfmt<cr>", "rustfmt" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>Neoformat<cr>", "Format buffer" }


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true


-- Additional Plugins
lvim.plugins = {
  { "arcticicestudio/nord-vim" },
  { "catppuccin/nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'terryma/vim-multiple-cursors' },
  { 'marko-cerovac/material.nvim' },
  { 'NLKNguyen/papercolor-theme' },
  { 'rust-lang/rust.vim' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'prettier/vim-prettier' },
  { 'fedepujol/move.nvim' },
  { 'ThePrimeagen/harpoon' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'sbdchd/neoformat' }
}

-- fedepujol/move keybindings
-- -- Visual-mode commands
local opts = {} -- check the lspconfig documentation for a list of all possible options

vim.keymap.set('v', '<S-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<S-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-l>', ':MoveHBlock(1)<CR>', opts)


-- Treesitter sticky header setup
require 'treesitter-context'.setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      'class',
      'function',
      'method',
      -- 'for', -- These won't appear in the context
      -- 'while',
      -- 'if',
      -- 'switch',
      -- 'case',
    },
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20, -- The Z-index of the context window
  mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
}
