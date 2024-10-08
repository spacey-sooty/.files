local builtin = require('telescope.builtin')
local telescopeconf = require('jade.telescope')
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {})
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", "<leader><leader>x", function()
    vim.cmd.w()
    vim.cmd.so("%")
end, {})

vim.keymap.set('n', '<C-b>', '<CMD>BlameToggle<cr>', {})

vim.keymap.set('n', '<C-j>', '<CMD>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', '<CMD>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<C-h>', '<CMD>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', '<CMD>TmuxNavigateRight<cr>')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>pa', telescopeconf.find_all, {})
vim.keymap.set('n', '<leader>pg', telescopeconf.project_files, {})
vim.keymap.set("n", "<leader>pw", require("telescope").extensions.git_worktree.git_worktrees);

vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

vim.keymap.set('n', '<leader>ps', telescopeconf.project_grep, {})
vim.keymap.set('n', '<leader>pq', builtin.live_grep, {})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>;", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>d", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>f", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>cd", function()
    local input = vim.fn.input('Worktree > ')
    require("git-worktree").switch_worktree(input)
end)
vim.keymap.set("n", "<leader>co", function()
    local input = vim.fn.input('Worktree > ')
    require("git-worktree").create_worktree(input, "master", "origin")
end)
vim.keymap.set("n", "<leader>dw", function()
    local input = vim.fn.input('Worktree > ')
    require("git-worktree").create_worktree(input)
end)

vim.keymap.set("n", "<leader>c", function()
    vim.cmd("!gcc -o output input")
    vim.cmd("!./output")
end)
