local M = {}

M.builtin = require('telescope.builtin')

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzf')
require('telescope').setup({
    defaults = {
        file_ignore_patterns = { '.git/' },
    }
})

M.is_inside_work_tree = {}

M.project_files = function()
    local opts = {}

    local cwd = vim.fn.getcwd()
    if M.is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        M.is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if M.is_inside_work_tree[cwd] then
        M.builtin.git_files(opts)
    else
        M.builtin.find_files(opts)
    end
end

M.find_all = function()
    local opts = {
        hidden = true,
    }

    M.builtin.find_files(opts)
end

M.project_grep = function()
    M.builtin.grep_string({ search = vim.fn.input('Grep > ') })
end

return M
