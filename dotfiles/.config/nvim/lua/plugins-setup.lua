
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "/"


require('lazy').setup({

  {'andersevenrud/nordic.nvim'},
  {'nvim-lua/plenary.nvim'}, -- lua functions that many plugins use
  {'christoomey/vim-tmux-navigator'},  -- tmux & split window navigation
  {'szw/vim-maximizer'}, -- maximizes and restores current window
   -- essential plugins
   --
  {'tpope/vim-surround'}, -- add, delete, change surroundings 
  {'inkarkat/vim-ReplaceWithRegister'}, -- replace with register contents using motion (gr + motion)
  {'numToStr/Comment.nvim'},

  {'nvim-tree/nvim-tree.lua'},
  {'nvim-tree/nvim-web-devicons'},
  {'nvim-lualine/lualine.nvim'},

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim"},
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  {"L3MON4D3/LuaSnip"},
  {"saadparwaiz1/cmp_luasnip"},
  {"rafamadriz/friendly-snippets"},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {"elixir-tools/elixir-tools.nvim", tag = "stable", dependencies = { "nvim-lua/plenary.nvim" }},
  {"neoclide/jsonc.vim"},
  {"arnaupv/nvim-devcontainer-cli",
  opts = {
    -- By default, if no extra config is added, following nvim_dotfiles are
    -- installed: "https://github.com/LazyVim/starter"
    -- This is an example for configuring other nvim_dotfiles inside the docker container
    nvim_dotfiles_repo = "https://github.com/chubarovNick/dotfiles.git",

    nvim_dotfiles_install_command = "./install.sh -d 'nvim'",
    -- In case you want to change the way the devenvironment is setup, you can also provide your own setup
    setup_environment_repo = "https://github.com/chubarovNick/dotfiles.git",
    setup_environment_install_command = "./install.sh -p 'nvim zsh'",
    setup_environment_dir = "dotfiles",
  },
  keys = {
    -- stylua: ignore
    {
      "<leader>cdu",
      ":DevcontainerUp<cr>",
      desc = "Up the DevContainer",
    },
    {
      "<leader>cdc",
      ":DevcontainerConnect<cr>",
      desc = "Connect to DevContainer",
    },
  }
  },
})




