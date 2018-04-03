if exists("g:loaded_jex")
  finish
endif
let g:loaded_jex = 1


function s:JexHello()
  :echom "Hi.  I am learning to write a plugin for Vim."
endfunction


command! JexHello call s:JexHello()
