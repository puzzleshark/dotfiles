local wk = require("which-key")

wk.register({

    -- alternate file remapping
    -- vim.api.nvim_set_keymap("n", "<C-p>", "<C-^>", { noremap = true })
    ["<C-p>"] = { "<C-^>", "Alternate file" },

    -- delete but don't change copy buffer
    -- vim.api.nvim_set_keymap("n", "<leader>d", "\"_d", { noremap = true })
    -- vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", { noremap = true })
    ["<leader>d"] = { "\"_d", "Delete but don't change copy buffer", mode={"n", "v"} },


    -- netrw
    -- vim.keymap.set("n", "<leader>nn", vim.cmd.Ex, { noremap = true })
    ["<leader>nn"] = { vim.cmd.Ex, "Netrw" },
})


