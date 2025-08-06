# tylsp.nvim

[![Neovim plugin](https://img.shields.io/badge/neovim-plugin-57A143?logo=neovim)](https://neovim.io)
[![Top](https://img.shields.io/github/languages/top/aekasitt/tylsp.nvim)](https://github.com/aekasitt/tylsp.nvim)
[![Languages](https://img.shields.io/github/languages/count/aekasitt/tylsp.nvim)](https://github.com/aekasitt/tylsp.nvim)
[![Last commit](https://img.shields.io/github/last-commit/aekasitt/tylsp.nvim/master)](https://github.com/aekasitt/tylsp.nvim)
![Tylsp Banner](static/tylsp-banner.svg)

## Installation

### Lazy

```lua
{
  'aekasitt/tylsp.nvim',
  config = function()
    require('tylsp').setup()
  end,
}
```

### Packer

```lua
use {
  'aekasitt/tylsp.nvim',
  setup = function()
    require('tylsp').setup()
  end,
}
```


## Project structure

```
tylsp.nvim/
│
├── lua/
│   └── tylsp/
│       └── init.lua         # Initiate tylsp using lspconfig for python
│
├── plugin/
│   ├── build.lua            # Check & install python packages if not existed
│   └── tylsp.lua            # Verify lua dependencies before setup
│
├── LICENSE                  # Details of MIT License
└── README.md                # Descriptions and roadmap
```

## Acknowledgements

1. [astral-sh/ty](https://github.com/astral-sh/ty) plugin written by the amazing [@astral-sh](https://astral.sh) team
1. [นฤชา - Narucha](https://www.f0nt.com/release/sov-narucha) typeface by [uvSOV - Worawut Thanawatanawanich](https://fb.com/worawut.thanawatanawanich)

## License

This project is licensed under the terms of the MIT license.
