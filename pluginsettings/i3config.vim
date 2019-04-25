augroup i3config_ft_detection
  autocmd!
  autocmd BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  autocmd BufNewFile,BufRead ~/.config/i3/i3status set filetype=i3config
augroup end
