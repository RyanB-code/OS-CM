local pickers = require 'telescope.pickers'

local multigrep = {}

local live_multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	pickers.new(opts, {
		finder = finder,
	}):find()
end

multigrep.setup = function()
	live_multigrep()
end
	



return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
	    	require('telescope').setup {
		    extensions = { fzf = {} }
	    	}
	    	require('telescope').load_extension('fzf')
	
	    	vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
	    	vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
	    	vim.keymap.set('n', '<leader>en', function()
		    	require('telescope.builtin').find_files {cwd = vim.fn.stdpath('config')} 
	    		end)		
	    	vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)	
    end
  }
}
