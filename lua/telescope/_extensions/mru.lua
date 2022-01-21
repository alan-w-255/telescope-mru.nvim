local pickers = require'telescope.pickers'
local async_static_finder = require'telescope.finders.async_static_finder'
local conf = require'telescope.config'.values
local make_entry = require'telescope.make_entry'

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
    opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
    opts.results = entries

    pickers.new(opts, {
        prompt_title = "MRU files",
        finder = async_static_finder(opts),
        sorter = conf.file_sorter(opts),
        previewer = conf.file_previewer(opts),
    }):find()
end

return require'telescope'.register_extension{
    exports = {
        mru = MRUFiles,
    }
}
