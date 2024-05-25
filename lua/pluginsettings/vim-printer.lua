return {
  'meain/vim-printer',
  lazy = false,
  config = function()
    vim.g.vim_printer_items = {
      clojure = '(println (str "\\n{$}: " {$} "\\n"))',
      scala   = 'println(s"\\n{$}: ${$} \\n")',
    }
  end
}
