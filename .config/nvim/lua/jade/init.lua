require("jade.opts")
require("jade.plugins")
require("jade.remap")
require("jade.treesitter")
require("jade.lsp")
require("jade.telescope")

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = {'*'},
    command = [[%s/\s\+$//e]],
})
