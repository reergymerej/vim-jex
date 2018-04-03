if exists("g:loaded_jex")
  finish
endif
let g:loaded_jex = 1


" Take a memo.
function JexMemo(description)
  let l:url = "http://localhost:3030/tasks"
  let l:json = "{\"description\": \"" . a:description . "\"}"
  let l:command = "curl -X POST " . l:url
  let l:command .= " -H 'Cache-Control: no-cache'"
  let l:command .= " -H 'Content-Type: application/json'"
  let l:command .= " -d '" . l:json . "'"
  exec "!" . l:command
endfunction

command! -nargs=1 JexMemo exec JexMemo(<q-args>)
