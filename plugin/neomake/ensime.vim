"source https://github.com/neomake/neomake/commit/972cc885d39c6c36084220cf628692ac2053284e#diff-0e9135380aa33290cc5014283dae898aR313
let g:ensime_maker = {'name': 'Ensime'}
function! g:ensime_maker.get_list_entries(jobinfo) abort
  return b:ensime_notes
endfunction
"https://github.com/ensime/ensime-vim/blob/ee9519335feced0df213da0a929e96329cf08958/ensime_shared/editor.py#L358
"ensime only populates b:ensime_notes if it detects Syntastic
command! -nargs=1 SyntasticCheck execute "call neomake#Make(1, [g:ensime_maker])"
function! Ensime_retypecheck() abort
  let b:ensime_notes=[]
  exe "SyntasticCheck ensime"
  exe "EnTypeCheck"
endfunction
