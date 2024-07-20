-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    'AstroNvim/astrocommunity',
    { import = 'astrocommunity.pack.lua' },
    { import = 'astrocommunity.pack.python' },
    { import = 'astrocommunity.pack.lua' },
    { import = 'astrocommunity.pack.rust' },
    { import = 'astrocommunity.pack.markdown' },
    { import = 'astrocommunity.pack.toml' },
    { import = 'astrocommunity.pack.xml' },
    { import = 'astrocommunity.motion.hop-nvim' },
    { import = 'astrocommunity.editing-support.rainbow-delimiters-nvim' },
}
