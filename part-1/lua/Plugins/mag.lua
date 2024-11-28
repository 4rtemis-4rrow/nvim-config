return { --* the completion engine *--
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    dependencies={
        "hrsh7th/cmp-nvim-lsp",
        'saadparwaiz1/cmp_luasnip',
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            build = "make install_jsregexp",
            dependencies = { "rafamadriz/friendly-snippets" },
        },
    },
    config=function()
        local kind_icons = {
            Class = "",
            Color = "",
            Constant = "",
            Constructor = "",
            Enum = "",
            EnumMember = "",
            Event = "",
            Field = "",
            File = "",
            Folder = "",
            Function = "󰊕",
            Interface = "",
            Keyword = "",
            Method = "",
            Module = "",
            Operator = "",
            Property = "",
            Reference = "",
            Snippet = "",
            Struct = "󰙅",
            Text = "",
            TypeParameter = "",
            Unit = "󰑭",
            Value = "󰎠",
            Variable = "󰀫",
        }

        local luasnip = require("luasnip")
        require('cmp').setup({
            formatting = {
                fields = { 'abbr', 'kind' },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]
                    return vim_item
                end
            },
            matching = {
                disallow_fuzzy_matching = true,
                disallow_fullfuzzy_matching = true,
                disallow_partial_fuzzy_matching = true,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = true,
            },
            sources = {
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'path' }
            },
            mapping = {
                ['<CR>'] = require('cmp').mapping(function(fallback)
                    if require('cmp').visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            require('cmp').confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),

                ["<Tab>"] = require('cmp').mapping(function(fallback)
                    if require('cmp').visible() then
                        require('cmp').select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = require('cmp').mapping(function(fallback)
                    if require('cmp').visible() then
                        require('cmp').select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            window = {
                completion = require('cmp').config.window.bordered(),
                documentation = require('cmp').config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })
    end
}
