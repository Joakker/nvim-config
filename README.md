# :moon: nvim-config: A neovim configuration focused on lua

<!-- > NOTE: Some of the plugin paths specified in my
> [specification](lua/plugins/init.lua) are local to my machine, but they can be
> found here on github too -->

My personal neovim configuration. It is mostly written in lua, so it pays to
know the language

## Keymaps

### Tab navigation

| Mapping | Modes | Effect       |
|:-------:|-------|--------------|
| `<C-j>` | ni    | Next tab     |
| `<C-k>` | ni    | Previous tab |

### Window navigation

| Mapping | Modes | Effect               |
|:-------:|-------|----------------------|
| `<M-h>` | n     | Jump to left window  |
| `<M-j>` | n     | Jump to right window |
| `<M-k>` | n     | Jump to upper window |
| `<M-l>` | n     | Jump to lower window |

### Function keys

| Mapping | Modes | Effect                                             |
|:-------:|-------|----------------------------------------------------|
| `<F1>`  | n     | Open Telescope window and search through help tags |
| `<F3>`  | n     | Toggle `tree.nvim`                                 |
| `<F5>`  | n     | Build project                                      |
| `<F7>`  | nt    | Toggle `FTerm.nvim`                                |

### Leader mappings

All the following mappings start with `<leader>`, which is defined as `,`
(comma) by default.

| Mapping | Modes | Effect                 |
|:-------:|-------|------------------------|
|   vs    | n     | Reload configuration   |
|   wo    | n     | `:only`                |
|   wc    | n     | `:close`               |
|   ms    | n     | `:messages`            |
|   cc    | n     | `:cclose`              |

### Jumping around

|       Mapping       | Modes | Effect                      |
|:-------------------:|-------|-----------------------------|
| `<leader><leader>w` | n     | Hop to a word on the screen |
| `<leader><leader>w` | n     | Hop to line on the screen   |

## LSP

I've set up the following language servers (you'll need to install them
manually):

- Efm-langserver
- Clangd
- Gdscript
- Omnisharp
- Jedi
- Gopls
- Sumneko lua
- Vimls
- Rust analyzer
- Tsserver

With snippet support for most of them. Speaking of snippets, the following
filetypes also have snippets defined, without the need of a language server:

- Vimwiki
