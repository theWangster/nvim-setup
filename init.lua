-- Here's a great guide on custom creating a nvim setup
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- quality of life
vim.opt.mouse = 'a' -- mouse in all modes

-- searching
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true  -- use case when case used
vim.opt.hlsearch = false  -- stop highlighting prev search

-- wrapping & tabs
vim.opt.wrap = true        -- long text can wrap around
vim.opt.breakindent = true -- wrapped text has indents
vim.opt.tabstop = 4        -- max space of tab
vim.opt.shiftwidth = 4     -- space of tab
vim.opt.expandtab = false  -- whether or not to expand tab

-- sidebar numbers
vim.opt.number = true         -- cur line number
vim.opt.relativenumber = true -- rel line number

-- netrw
vim.g.netrw_banner = false -- show actions in netrw
vim.g.netrw_winsize = 30   -- idk what this does

-- clipboard
vim.g.clipboard = unnamedplus -- set clipboard provider

require('bindings')
require('plugins_core')
