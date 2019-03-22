function AirlineInit()
  let g:airline_section_x = airline#section#create(['%{SpinnerText()}', 'filetype'])
endfunction
autocmd VimEnter * call AirlineInit()
