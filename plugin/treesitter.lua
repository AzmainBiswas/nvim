require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help" }, 
  sync_install = false,  -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true, -- `false` will disable the whole extension
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, desable = { "yaml" } },
}
