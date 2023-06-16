local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

local mark = require('harpoon.mark')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local telescope_custom_actions = {}

function telescope_custom_actions.harpoon_mark(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local multi_selection = picker:get_multi_selection()

    -- require("telescope.pickers").on_close_prompt(prompt_bufnr)
    -- pcall(vim.api.nvim_set_current_win, picker.original_win_id)
    for _, entry in ipairs(multi_selection) do
        local filename

        if entry.path or entry.filename then
            filename = entry.path or entry.filename
            mark.add_file(filename);
        end
    end
end

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<ESC>'] = actions.close,
                ['<C-J>'] = actions.move_selection_next,
                ['<C-K>'] = actions.move_selection_previous,
                ['<TAB>'] = actions.toggle_selection,
                ['<C-TAB>'] = actions.toggle_selection + actions.move_selection_next,
                ['<S-TAB>'] = actions.toggle_selection + actions.move_selection_previous,
                ['<C-A>'] = telescope_custom_actions.harpoon_mark,
                ['<C-DOWN>'] = require('telescope.actions').cycle_history_next,
                ['<C-UP>'] = require('telescope.actions').cycle_history_prev,
            },
            n = i,
        },
    }
})
