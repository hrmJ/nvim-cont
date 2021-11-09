
require('hop').setup()
require('keys')
-- require('linters-config')
require('treesitter-conf')
-- require('navigator-config')
require('lsp-config')
require('cmp-config')
require'nvim-web-devicons'.setup()
vim.cmd('source ~/.config/nvim/vim/vimkeys.vim')

vim.cmd [[

  let g:ultest_use_pty = 1
  let test#javascript#reactscripts#options = "--watchAll=false"
  colorscheme sonokai

]]


vim.cmd('source ~/.config/nvim/keys.vim')

-- use omnifunc
-- vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}


-- vim.cmd [[ autocmd VimEnter * COQnow --shut-up ]]

-- vim.cmd [[ 
-- let g:coq_settings = { 'keymap.jump_to_mark': '<c-j>' }
-- 
-- ]]
