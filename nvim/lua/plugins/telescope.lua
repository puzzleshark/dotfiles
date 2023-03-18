return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- basic telescope mappings
            { "<leader>ff", function() require('telescope.builtin').find_files() end, desc="Find files" },
            { "<leader>fo", function() require('telescope.builtin').git_files() end, desc="Find files in git" },
            { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc="Find in files" },
            { "<leader>fb", function() require('telescope.builtin').buffers() end, desc="Find buffers" },
            { "<leader>fh", function() require('telescope.builtin').help_tags() end, desc="Find help tags" },

            -- lsp telescope mappings
            { "<leader>fr", function() require('telescope.builtin').lsp_references() end, desc="Find references" },
            { "<leader>fd", function() require('telescope.builtin').lsp_document_symbols() end, desc="Find document symbols" },
            { "<leader>fs", function() require('telescope.builtin').symbols() end, desc="Find symbols" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        keys = {
            { "<leader>fp", function() require('telescope').extensions.projects.projects() end, desc="Find projects" },
        },
        config = function()
            require("project_nvim").setup({
                -- need this because for some reason
                -- it is detecting .dotfiles/nvim/lua as a project
                detection_methods = { "pattern" },
            })
        end,

        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        }
    }
}
