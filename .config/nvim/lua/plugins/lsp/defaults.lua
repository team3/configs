local keyset = vim.keymap.set

keyset("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {silent = true})
keyset("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {silent = true})
keyset('n', 'gi', "<Cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true})
keyset('n', 'gr', "<Cmd>lua vim.lsp.buf.references()<CR>", {silent = true})
keyset('n', 'K', "<CMD>lua vim.lsp.buf.hover<CR>", {silent = true})
keyset('n', '<C-k>', "<CMD>lua vim.lsp.buf.signature_help()<CR>", {silent = true})
keyset('n', 'tD', "<CND>lua vim.lsp.buf.type_definition()<CR>", {silent = true})
keyset('n', '<leader>rn', "<CMD>lua vim.lsp.buf.rename<CR>", {silent = truye})
keyset('n', '<leader>ca', "<CMD>lua vim.lsp.buf.code_action()<CR>", {silent = true})
keyset('v', "<leader>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>", { noremap=true, silent=true})
keyset('n', '<leader>f', "<Cmd>lua vim.lsp.buf.format()<CR>", {silent = true})
