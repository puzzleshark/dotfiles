local wk = require("which-key")

wk.register({

    -- alternate file remapping
    -- vim.api.nvim_set_keymap("n", "<C-p>", "<C-^>", { noremap = true })
    ["<C-p>"] = { "<C-^>", "Alternate file" },

    -- delete but don't change copy buffer
    -- vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", { noremap = true })
    -- vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", { noremap = true })
    ["<leader>d"] = { "\"_d", "Delete but don't change copy buffer", mode={"n", "v"}, noremap=true },
    ["<leader>p"] = { "\"_dp", "Paste but don't change copy buffer", mode={"v"}, noremap=true },
    -- ["<leader>p"] = { "pgv\"<C-r>=v:register<CR>y", "Paste but don't change copy buffer", mode = {"x"} },
    -- ["<leader>q"] = { ":terminal ranger :startInsert", "Open Ranger", mode={"n"}, noremap=true},
    -- ["<leader>q"] = { ":terminal ranger<CR>:startinsert<CR>", "Open Ranger", mode={"n"}, noremap=true},
    ["<leader>q"] = { ':terminal ranger --selectfile=%<CR>:startinsert<CR>', "Open Ranger", mode={"n"}, noremap=true},
    -- vim.api.nvim_set_keymap('n', '<leader>q', ':terminal ranger<CR>:startinsert<CR>', { noremap = true, silent = true })



    -- netrw
    -- vim.keymap.set("n", "<leader>nn", vim.cmd.Ex, { noremap = true })
    ["<leader>nn"] = { vim.cmd.Ex, "Netrw" },
})


