return {
  'rareitems/printer.nvim',
  config = function()
    require('printer').setup({
      keymap = "<leader>p",
      formatters = {
        scala = function(inside, variable)
          return string.format('println(s"\\n%s: $%s \\n")', inside, variable)
        end,
        clojure = function(inside, variable)
          return string.format('(println (str "\\n{$}: " {$} "\\n"))', inside, variable)
        end
      }
    })
  end
}
