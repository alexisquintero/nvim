local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true, }

ht.setup {
  hls = {
    -- See nvim-lspconfig's  suggested configuration for keymaps, etc.
    on_attach = function(client, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })

      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, opts)
      end

      bufnnoremap('<space>hs', ht.hoogle.hoogle_signature)
    end,
  },
}

nnoremap('<leader>rr', ht.repl.toggle, def_opts) -- Toggle a GHCi repl for the current package
nnoremap('<leader>rf', function() -- Toggle a GHCi repl for the current buffer
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
nnoremap('<leader>rq', ht.repl.quit, def_opts)
