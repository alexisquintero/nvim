" Stolen from https://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim

function SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("W","w")
call SetupCommandAlias("Wa","wa")
call SetupCommandAlias("WA","wa")
