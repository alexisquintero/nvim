local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, { buffer=bufnr })
      end

      lsp_mappings(bufnr)
      bufnnoremap("<C-space>", rt.hover_actions.hover_actions) -- Hover actions
      bufnnoremap("<Leader>cag", rt.code_action_group.code_action_group) -- Code action groups
      lsp_diagnostics()
    end,
  },
})
