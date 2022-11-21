## Prerequisites

You need install and load plugins `yegappan/mru` and `nvim-telescope/telescope.nvim` first.

## Install

Example configuration:

packer
```lua
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'yegappan/mru',
        'alan-w-255/telescope-mru.nvim',
    },
    config = function()
        require'telescope'.load_extension('mru')
    end,
}
```

## Usage

`:Telescope mru`

## Preview
![Cheese_Wed-23Feb22_12 52](https://user-images.githubusercontent.com/15076589/155263653-39021c59-0cfb-49a3-8305-fd31a536a1d0.png)
