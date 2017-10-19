" Name: Star search
" Author: Name5566 <name5566@gmail.com>
" Version: 0.1.1

if exists('loaded_starsearch')
	finish
endif
let loaded_starsearch = 1

let s:savedCpo = &cpo
set cpo&vim

function! s:VStarsearch_searchCWord()
	let wordStr = expand("<cword>")
	if strlen(wordStr) == 0
		echohl ErrorMsg
		echo 'E348: No string under cursor'
		echohl NONE
		return
	endif
	
	if wordStr[0] =~ '\<'
		let @/ = '\<' . wordStr . '\>'
	else
		let @/ = wordStr
	endif

    " reset cursor to start of word so backward search works immediately
	let savedUnnamed = @"
	normal! yiw
	if wordStr != @"
		normal! w
	endif
	let @" = savedUnnamed
endfunction

nnoremap <silent> * :call <SID>VStarsearch_searchCWord()<CR>:set hls<CR>

let &cpo = s:savedCpo
