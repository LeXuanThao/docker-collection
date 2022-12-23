local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
  
local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])
  
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons' 
    use 'nvim-lualine/lualine.nvim'
    use {
	    'romgrk/barbar.nvim',
	    wants = 'nvim-tree/nvim-web-devicons'
    }
    use 'm4xshen/autoclose.nvim'
    use {
	    'kyazdani42/nvim-tree.lua',
	    requires = { 'nvim-tree/nvim-web-devicons' },
	    tag = 'nightly'
    }
    -- use 'nvim-lua/plenary.nvim'
    -- use 'brendalf/mix.nvim'
    use 'folke/tokyonight.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip' 
    use 'saadparwaiz1/cmp_luasnip' 
    use 'neovim/nvim-lsp'  

    use {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
    }
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-lint'
    use 'jose-elias-alvarez/null-ls.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
