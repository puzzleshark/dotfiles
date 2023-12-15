return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {

        -- Navigation
        { ']c', function() if vim.wo.diff then return ']c' end vim.schedule(function() require("gitsigns").next_hunk() end) return '<Ignore>' end, desc="Next hunk" },
        { '[c', function() if vim.wo.diff then return '[c' end vim.schedule(function() require("gitsigns").prev_hunk() end) return '<Ignore>' end, desc="Previous hunk"},

        -- Actions
        -- { '<leader>hs', ':Gitsigns stage_hunk<CR>', mode={'n', 'v'}, desc="Stage hunk" },
        -- { '<leader>hr', ':Gitsigns reset_hunk<CR>', mode={'n', 'v'}, desc="Reset hunk" },
            -- Actions
        { '<leader>hs', function() require("gitsigns").stage_hunk() end, desc="Stage hunk", mode={'n'}},
        { '<leader>hr', function() require("gitsigns").reset_hunk() end, desc="Reset hunk", mode={'n'}},
        { '<leader>hs', function() require("gitsigns").stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, desc="Stage hunk visual?", mode={'v'}},
        { '<leader>hr', function() require("gitsigns").reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, desc="Stage hunk visual?", mode={'v'}},
        { '<leader>hS', function() require("gitsigns").stage_buffer() end, desc="Stage buffer", mode={'n'}},
        { '<leader>hu', function() require("gitsigns").undo_stage_hunk() end, desc="Undo stage hunk", mode={'n'}},
        { '<leader>hR', function() require("gitsigns").reset_buffer() end, desc="Reset buffer", mode={'n'}},
        { '<leader>hp', function() require("gitsigns").preview_hunk() end, desc="Preview hunk", mode={'n'}},
        { '<leader>hb', function() require("gitsigns").blame_line({full=true}) end, desc="Git blame", mode={'n'}},
        { '<leader>tb', function() require("gitsigns").toggle_current_line_blame() end, desc="Toggle current line git blame", mode={'n'}},
        { '<leader>hd', function() require("gitsigns").diffthis() end, desc="git diff this", mode={'n'}},
        { '<leader>hD', function() require("gitsigns").diffthis('~') end, desc="git diff this 2?", mode={'n'}},
        { '<leader>td', function() require("gitsigns").toggle_deleted() end, desc="toggle git delete?", mode={'n'}},

        -- text object
        { 'ih', ':<C-U>Gitsigns select_hunk<CR>', mode={'o', 'x'}, desc="Select hunk" },
        { 'ah', ':<C-U>Gitsigns select_hunk<CR>', mode={'o', 'x'}, desc="Select hunk" },
    },
    config = function()
        require('gitsigns').setup {
          signs = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
          linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
          word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
          watch_gitdir = {
            follow_files = true
          },
          attach_to_untracked = true,
          current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
          },
          current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
          sign_priority = 6,
          update_debounce = 100,
          status_formatter = nil, -- Use default
          max_file_length = 40000, -- Disable if file is longer than this (in lines)
          preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
          },
          yadm = {
            enable = false
          },
        }
    end,
}
