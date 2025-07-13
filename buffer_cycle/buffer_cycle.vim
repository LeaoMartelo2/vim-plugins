function! NextUniqueBuffer()
    let l:curbuf = bufnr('%')
    let l:bcount = bufnr('$')
    let l:i = l:curbuf + 1

    while l:i <= l:bcount
	if bufexists(l:i) && getbufvar(l:i, '&buftype', '') ==# '' && buflisted(l:i)
	    if bufwinnr(l:i) == -1
		execute 'buffer' l:i
		return
	    endif
	endif
	let l:i += 1
    endwhile

    let l:i = 1
    while l:i < l:curbuf
	if bufexists(l:i) && getbufvar(l:i, '&buftype', '') ==# '' && buflisted(l:i)
	    if bufwinnr(l:i) == -1
		execute 'buffer' l:i
		return
	    endif
	endif
	let l:i += 1
    endwhile
endfunction

function! PrevUniqueBuffer()
  let l:curbuf = bufnr('%')
  let l:i = l:curbuf - 1

  while l:i >= 1
    if bufexists(l:i) && getbufvar(l:i, '&buftype', '') ==# '' && buflisted(l:i)
      if bufwinnr(l:i) == -1
        execute 'buffer' l:i
        return
      endif
    endif
    let l:i -= 1
  endwhile

  let l:last = bufnr('$')
  let l:i = l:last
  while l:i > l:curbuf
    if bufexists(l:i) && getbufvar(l:i, '&buftype', '') ==# '' && buflisted(l:i)
      if bufwinnr(l:i) == -1
        execute 'buffer' l:i
        return
      endif
    endif
    let l:i -= 1
  endwhile
endfunction


nnoremap <silent> <Tab>   :call NextUniqueBuffer()<CR>
nnoremap <silent> <S-Tab> :call PrevUniqueBuffer()<CR>
