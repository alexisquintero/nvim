local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(client, bufnr)
      local function bufnnoremap (lhs, rhs)
        nnoremap(lhs, rhs, { buffer=bufnr })
      end

      bufnnoremap("<Leader>ah", rt.hover_actions.hover_actions) -- Hover actions
      bufnnoremap("<Leader>ag", rt.code_action_group.code_action_group) -- Code action groups
      on_attach(client, bufnr)
    end,
  },
})
