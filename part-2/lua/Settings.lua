local o = vim.opt
--UI--
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })

--global options--
o.clipboard = "unnamedplus"
o.nu = true
o.relativenumber = true
o.number = true
o.ignorecase = true
o.smartcase = true
o.wrap = true
o.linebreak = true
o.breakindent = true
o.conceallevel = 3
o.cursorline = true
o.cursorcolumn = true
vim.diagnostic.config({ virtual_text = false })
o.list = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.breakindent = true
o.smartindent = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 20

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = true
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8

o.updatetime = 50
o.laststatus = 2

vim.g.indent_blankline_filetype_exclude = { 'dashboard' }

vim.g.mapleader = " "

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
    },
})

