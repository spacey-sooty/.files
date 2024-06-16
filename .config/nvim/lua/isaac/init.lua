require("isaac.opts")
require("isaac.plugins")
require("isaac.remap")
require("isaac.treesitter")
require("isaac.lsp")
require("isaac.telescope")

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = {'*'},
    command = [[%s/\s\+$//e]],
})
