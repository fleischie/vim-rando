" Vim plugin for generating pseudo-random numbers
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-rando

if exists("g:loaded_rando") || &cp
  finish
endif

let g:loaded_rando = 1
let g:rando_max = 65535

" setup default seed value
if !exists('g:rando_seed')
  let g:rando_seed = localtime()
endif

" retrieve name of current OS
let s:uname = system('uname')
if v:shell_error
  let s:os = 'Win'
else
  let s:os = substitute(s:uname, '\n', '', '')
endif

" depending on OS setup standard C library file
if !exists('g:rando_lib')
  if s:os == 'Darwin' || s:os == 'Mac'
    let g:rando_lib = 'libSystem.dylib'
  elseif s:os == 'Win'
    let g:rando_lib = 'msvcrt'
  else
    let g:rando_lib = 'libc.so.6'
  endif
endif

" setup default seed function name
if !exists('g:rando_seed_func')
  let g:rando_seed_func = 'srand'
endif

" setup default random number function name
if !exists('g:rando_func')
  let g:rando_func = 'rand'
endif

" s:Seed - Local function to seed the randomizer.
"
" This function seeds the randomizer at most one time. The user can bypass
" seeding by explicitly setting the `g:rando_is_seeded` variable.
function! s:Seed()
  if !exists('g:rando_is_seeded') || g:rando_is_seeded == 0
    call libcallnr(g:rando_lib, g:rando_seed_func, g:rando_seed)
    let g:rando_is_seeded = 1
  endif
endfunction

" GetRandomNumber - Return a pseudo-random number between 0.0 and 1.0.
"
" This function first seeds the randomizer if necessary and returns a random
" number between 0.0 and 1.0. As this number is depending on the `rand`
" library call from the standard C library, it's maximum value is determined
" by the system it is run on.
"
" By setting `g:rando_max` the user can control the granularity of the
" returned random number. By default it is set to 65535.
function! GetRandomNumber()
  :call <SID>Seed()

  return libcallnr(g:rando_lib, g:rando_func, 0) % g:rando_max
        \ * 1.0 / g:rando_max
endfunction

" Choice - Return a random element from the given list.
"
" This function internally retrieves a random number, applies this to the
" length of the given list and returns the element with the appropriate index.
function! Choice(list)
  let l:rando_nr = GetRandomNumber()
  let l:rando_index = float2nr(floor(len(a:list) * l:rando_nr))

  return a:list[l:rando_index]
endfunction
