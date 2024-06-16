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

local plugins = {
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("catppuccin")
    --     end
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()
            vim.cmd.colorscheme("rose-pine")
        end
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    {
      "FabijanZulj/blame.nvim",
      config = function()
        require("blame").setup()
      end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon"):setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
        }
    },
    "neovim/nvim-lspconfig",
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    'christoomey/vim-tmux-navigator',
}

local opts = {}

require("lazy").setup(plugins, opts)
