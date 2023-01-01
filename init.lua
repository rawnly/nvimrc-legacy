--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "stable", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "tokyonight-moon",

        icons = {
                VimIcon = "",
                ScrollText = "",
                GitBranch = "",
                GitAdd = "",
                GitChange = "",
                GitDelete = "",
        },

        heirline = {
                -- define the separators between each section
                separators = {
                        left = { "", " " }, -- separator for the left side of the statusline
                        right = { " ", "" }, -- separator for the right side of the statusline
                },
                -- add new colors that can be used by heirline
                colors = function(hl)
                        -- use helper function to get highlight group properties
                        local comment_fg = astronvim.get_hlgroup("Comment").fg
                        hl.git_branch_fg = comment_fg
                        hl.git_added = comment_fg
                        hl.git_changed = comment_fg
                        hl.git_removed = comment_fg
                        hl.blank_bg = astronvim.get_hlgroup("Folded").fg
                        hl.file_info_bg = astronvim.get_hlgroup("Visual").bg
                        hl.nav_icon_bg = astronvim.get_hlgroup("String").fg
                        hl.nav_fg = hl.nav_icon_bg
                        hl.folder_icon_bg = astronvim.get_hlgroup("Error").fg
                        return hl
                end,
                attributes = {
                        mode = { bold = true },
                },
                icon_highlights = {
                        file_icon = {
                                statusline = false,
                        },
                },
        },

        -- set vim options here (vim.<first_key>.<second_key> =  value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = true, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
                },
                g = {
                        heirline_bufferline = true,
                        mapleader = " ", -- sets vim.g.mapleader
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        ["sneak#prompt"] = "",
                        ["sneak#s_next"] = 1,
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        },

        --
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Configure plugins
        plugins = {
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup functino call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function() end,
}

return config
