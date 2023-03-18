return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy=false,
        config = function()
            require('nvim-treesitter.configs').setup({
              -- A list of parser names, or "all"
              ensure_installed = { "c", "lua", "rust", "python", "jsonc"},

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,

              -- Automatically install missing parsers when entering buffer
              auto_install = true,

              -- List of parsers to ignore installing (for "all")
              -- ignore_install = { "javascript" },

              ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
              -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

              highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- disable = { "c", "rust" },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },

              textobjects = {
                select = {
                  enable = true,

                  -- Automatically jump forward to textobj, similar to targets.vim
                  lookahead = true,

                  keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                  },
                  -- You can choose the select mode (default is charwise 'v')
                  selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                  },
                  -- If you set this to `true` (default is `false`) then any textobject is
                  -- extended to include preceding xor succeeding whitespace. Succeeding
                  -- whitespace has priority in order to act similarly to eg the built-in
                  -- `ap`.
                  -- include_surrounding_whitespace = true,
                },
                swap = {
                  enable = true,
                  swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                  },
                  swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                  },
                },
                move = {
                  enable = true,
                  set_jumps = true, -- whether to set jumps in the jumplist
                  goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                  },
                  goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                  },
                  goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                  },
                  goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                  },
                },
              },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },
}
