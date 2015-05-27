function! airline#extensions#tabline#formatters#custom_format#format(bufnr, buffers)
	let fmod = get(g:, 'airline#extensions#tabline#fnamemod', ':~:.')
	let fnamecollapse = get(g:, 'airline#extensions#tabline#fnamecollapse', 1)
	let _ = ''

	let name = bufname(a:bufnr)

	if empty(name)
		let _ .= '[No Name]'
	else
		if fnamecollapse
			let _ .= substitute(fnamemodify(name, fmod), '\v\w\zs.{-}\ze(\\|/)', '', 'g')
		else
			let _ .= fnamemodify(name, fmod)
		endif
	endif

	return airline#extensions#tabline#formatters#custom_format#wrap_name(a:bufnr, _)
endfunction

function! airline#extensions#tabline#formatters#custom_format#wrap_name(bufnr, buffer_name)
	let buf_nr_format = get(g:, 'airline#extensions#tabline#buffer_nr_format', '%s: ')
	let buf_nr_show = get(g:, 'airline#extensions#tabline#buffer_nr_show', 0)
	let buf_modified_symbol = g:airline_symbols.modified

	let _ = buf_nr_show ? printf(buf_nr_format, a:bufnr) : ''
	let _ .= substitute(a:buffer_name, '\\', '/', 'g')

	if getbufvar(a:bufnr, '&modified') == 1
		let _ .= buf_modified_symbol
	endif

	if a:bufnr == bufnr('#')
		let _ .= "#"
	endif
	return _
endfunction


