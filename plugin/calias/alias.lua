function SetupCommandAlias(input, output)
  vim.api.nvim_command(
    "cabbrev <expr> "
      .. input
      .. " "
      .. "v:lua.abbreviate_or_noop('"
      .. input
      .. "', '"
      .. output
      .. "')"
  )
end

SetupCommandAlias("W","w")
SetupCommandAlias("Wa","wa")
SetupCommandAlias("WA","wa")
