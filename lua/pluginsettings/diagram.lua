-- nix shell local#{mermaid-cli,plantuml,d2} node playwright-test is needed for d2, tldr it doesn't work
return {
  "3rd/diagram.nvim",
  dependencies = {
     "3rd/image.nvim",
  },
  opts = {
    events = {
      render_buffer = { "InsertLeave", "BufWinEnter" },
    }
  },
  config = function()
    require("diagram").setup({
      integrations = {
        require("diagram.integrations.markdown"),
      },
      renderer_options = {
        mermaid = {
          theme = "default",
        },
        plantuml = {
          charset = "utf-8",
        },
        d2 = {
          theme_id = 0,
        },
        gnuplot = {
          theme = "dark",
          size = "800,600",
        },
      },
    })
  end
}
