# How to use

## Prerequisites

install and load plugin `yegappan/mru` `nvim-telescope/telescope.nvim`

## install

packer
```lua
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'alan-w-255/telescope-mru.nvim',
    },
    config = function()
        require'telescope'.load_extension('mru')
    end,
}
```
