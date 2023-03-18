return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {

        -- Navigation
        { ']c', function() if vim.wo.diff then return ']c' end vim.schedule(function() require("gitsigns").next_hunk() end) return '<Ignore>' end, desc="Next hunk" },
        { '[c', function() if vim.wo.diff then return '[c' end vim.schedule(function() require("gitsigns").prev_hunk() end) return '<Ignore>' end, desc="Previous hunk"},

        -- Actions
        { '<leader>hs', ':Gitsigns stage_hunk<CR>', mode={'n', 'v'}, desc="Stage hunk" },
        { '<leader>hr', ':Gitsigns reset_hunk<CR>', mode={'n', 'v'}, desc="Reset hunk" },

        -- text object
        { 'ih', ':<C-U>Gitsigns select_hunk<CR>', mode={'o', 'x'}, desc="Select hunk" },
        { 'ah', ':<C-U>Gitsigns select_hunk<CR>', mode={'o', 'x'}, desc="Select hunk" },
    },
    config = true,
}
