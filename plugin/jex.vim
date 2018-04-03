if exists("g:loaded_jex")
  finish
endif
let g:loaded_jex = 1

function Send(json)
  let l:url = "http://localhost:3030/tasks"
  let l:command = "curl -X POST " . l:url
  let l:command .= " -H 'Cache-Control: no-cache'"
  let l:command .= " -H 'Content-Type: application/json'"
  let l:command .= " -d '" . a:json . "'"
  exec "!" . l:command
endfunction

function GetJson(description, type)
  let l:json = '{"description": "' . a:description . '", "type": "' . a:type . '"}'
  return l:json
endfunction

function JexMemo(description)
  let l:json = GetJson(a:description, "MEMO")
  call Send(l:json)
endfunction

function JexTodo(description)
  let l:json = GetJson(a:description, "TODO")
  call Send(l:json)
endfunction

function JexIdea(description)
  let l:json = GetJson(a:description, "IDEA")
  call Send(l:json)
endfunction

command! -nargs=1 JexMemo exec JexMemo(<q-args>)
command! -nargs=1 JexTodo exec JexTodo(<q-args>)
command! -nargs=1 JexIdea exec JexIdea(<q-args>)
