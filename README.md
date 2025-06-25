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
}
```

### Packer

```lua
use 'aekasitt/tylsp.nvim'
```


## Project structure

```
tylsp.nvim/
│
├── lua/
│   └── tylsp/
│       ├── build.lua       # Install python dependencies
│       └── init.lua        # Setup tylsp if not existed
│
├── plugin/
│   └── tylsp.lua           # Verify dependencies before setup
│
├── LICENSE                 # Details of MIT License
└── README.md               # Descriptions and roadmap
```

## Acknowledgements

1. [astral-sh/ty](https://github.com/astral-sh/ty) plugin written by the amazing [@astral-sh](https://astral.sh) team
1. [นฤชา - Narucha](https://www.f0nt.com/release/sov-narucha) typeface by [uvSOV - Worawut Thanawatanawanich](https://fb.com/worawut.thanawatanawanich)

## License

This project is licensed under the terms of the MIT license.
