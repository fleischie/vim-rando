if exists("g:loaded_rando") || &cp
  finish
endif

let g:loaded_rando = 1
let g:rando_max = 65535

let s:uname = system('uname')
if v:shell_error
  let s:os = 'Win'
else
  let s:os = substitute(system('uname'), '\n', '', '')
endif

if !exists('g:rando_seed')
  let g:rando_seed = localtime()
endif

if !exists('g:rando_lib')
  if s:os == 'Darwin' || s:os == 'Mac'
    let g:rando_lib = 'libSystem.dylib'
  elseif s:os == 'Win'
    let g:rando_lib = 'msvcrt'
  else
    let g:rando_lib = 'libc.so.6'
  endif
endif

if !exists('g:rando_seed_func')
  let g:rando_seed_func = 'srand'
endif

if !exists('g:rando_func')
  let g:rando_func = 'rand'
endif

function! s:Seed()
  if !exists('g:rando_is_seeded') || g:rando_is_seeded == 0
    call libcallnr(g:rando_lib, g:rando_seed_func, g:rando_seed)
    let g:rando_is_seeded = 1
  endif
endfunction

function! GetRandomNumber()
  :call <SID>Seed()

  return libcallnr(g:rando_lib, g:rando_func, 0) % g:rando_max
        \ * 1.0 / g:rando_max
endfunction

function! Choice(list)
  let l:rando_nr = GetRandomNumber()
  let l:rando_index = float2nr(floor(len(a:list) * l:rando_nr))

  return a:list[l:rando_index]
endfunction
