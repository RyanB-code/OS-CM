-- Set local leader before loading lazy
vim.g.mapleader = " "       -- Set space as leader
vim.g.maplocalleader = " "  -- set local leader (NEW)

require("config.lazy")



-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Auto reload files changed outside vim
vim.opt.autoread    = true      

-- Tab settings
vim.opt.wrap        = false     -- Text wrapping off
vim.opt.number      = true		-- show line numbers
vim.opt.tabstop     = 4	        -- set tab to 4 spaces
vim.opt.shiftwidth  = 4         -- I think I need this to make tab work again
vim.opt.expandtab	= true      -- makes tab into spaces
vim.opt.smartindent = true      -- Smart auto indent
vim.opt.autoindent  = true      -- copy indent from current line

-- Search settings
vim.opt.ignorecase  = true      -- Case insensitive
vim.opt.smartcase   = true      -- Case sensitive if using uppercase in search
vim.opt.incsearch   = true      -- Show matches as I type

-- Line centering
vim.keymap.set('n', 'j', 'jzz', { desc = "Go down keeping line centered"})
vim.keymap.set('n', 'k', 'kzz', { desc = "Go up keeping line centered"})
vim.keymap.set('n', 'G', 'Gzz', { desc = "Go to bottom of file keeping line centered"})
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Next search result centered"})
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Previous search result centered"})

vim.keymap.set('n', '<Up>', 'kzz', { desc = "Go up keeping line centered"})
vim.keymap.set('n', '<Down>', 'jzz', { desc = "Go down keeping line centered"})

-- Half page movement
vim.keymap.set('n', '<C-j>', '<C-d>zz', { desc = "Half page down centered"})
vim.keymap.set('n', '<C-k>', '<C-u>zz', { desc = "Half page up centered"})

-- Bounce open/closed items
vim.keymap.set('n', '%', '%zz', { desc = "Bounce centered"})


-- Moving Window
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Decrease window width"})
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Increase window width"})

 -- Tab interaction
vim.keymap.set("n", "<M-t>", "<Cmd>$tabnew<CR>") 	-- set Alt+T to open a new tab at the end of the tab row
vim.keymap.set("n", "<M-h>", "<Cmd>-tabnext<CR>")	-- Set Alt+h to go back a tab
vim.keymap.set("n", "<M-l>", "<Cmd>+tabnext<CR>")	-- Set Alt+l to go forward a tab
vim.keymap.set("n", "<M-c>", "<Cmd>tabclose<CR>")	-- Set Alt+c to close tab

-- Move lines
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", {desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", {desc = "Move line up" })	    
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", {desc = "Move selection down" })	    
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", {desc = "Move selection up" })	    

-- Better indenting
vim.keymap.set("v", "<", "<gv", {desc = "Indent left and reselect" })	    
vim.keymap.set("v", ">", ">gv", {desc = "Indent right and reselect" })	    

-- Relative line number when window is entered
vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = true
    end,
})

-- Turn off relative line numbers when leaving window
vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = true
    end,
})
