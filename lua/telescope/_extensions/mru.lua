local pickers = require'telescope.pickers'
local finders = require'telescope.finders'
local conf = require'telescope.config'.values

local MRUFiles = function (opts)
    opts = opts or {}
    local mrufiles = vim.fn["MruGetFiles"]()
    local entries  = {}
    local cwd = vim.fn.getcwd()
    for _, v in ipairs(mrufiles) do
        local path = require'plenary.path':new(v)
        if path:expand() ~= vim.api.nvim_buf_get_name(0) then
            table.insert(entries, path:make_relative(cwd))
        end
    end
    pickers.new(opts, {
        prompt_title = "MRU files",
        finder = finders.new_table {
            results = entries,
        },
        sorter = conf.file_sorter(opts),
        previewer = conf.file_previewer(opts),
    }):find()
end

require'telescope'.register_extension({
    exports = {
        mru = MRUFiles,
    }
})
