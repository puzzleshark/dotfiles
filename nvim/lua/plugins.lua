return {
    -- colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                transparent = true
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- lua dev stuff
    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    { "folke/neoconf.nvim", lazy=false, },
    {'folke/neodev.nvim', lazy=false, },

    -- nice icons
    'kyazdani42/nvim-web-devicons',

    -- comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({})
        end,
        lazy = false,
    },
    -- the primeeagon's harpoon
    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { "<leader>l", function() require("harpoon.ui").toggle_quick_menu() end, desc="Toggle Harpoon Quick Menu" },
            -- { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc="Navigate to Harpoon 1" },
            -- { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc="Navigate to Harpoon 2" },
            -- { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc="Navigate to Harpoon 3" },
            -- { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc="Navigate to Harpoon 4" },
            -- { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc="Navigate to Harpoon 5" },
            -- { "<leader>6", function() require("harpoon.ui").nav_file(6) end, desc="Navigate to Harpoon 6" },
            -- { "<leader>7", function() require("harpoon.ui").nav_file(7) end, desc="Navigate to Harpoon 7" },
            -- { "<leader>8", function() require("harpoon.ui").nav_file(8) end, desc="Navigate to Harpoon 8" },
            -- { "<leader>9", function() require("harpoon.ui").nav_file(9) end, desc="Navigate to Harpoon 9" },
            -- { "<leader>0", function() require("harpoon.ui").nav_file(10) end, desc="Navigate to Harpoon 10" },
            { "<leader>s", function() require("harpoon.mark").add_file() end, desc="Add File to Harpoon" },
        },
    },

    -- copilot
    { "github/copilot.vim", lazy = false },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = "norg",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    }
}
