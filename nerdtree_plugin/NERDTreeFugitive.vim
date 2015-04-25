"git dir is b:git_dir

if exists("g:loaded_nerdtree_fugitive")
    finish
endif

let g:loaded_nerdtree_fugitive = 1

call NERDTreeAddMenuSeparator({
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled'})

let gitSubMenu = NERDTreeAddSubmenu({
    \ 'text': '(g)it',
    \ 'shortcut': 'g', })

call NERDTreeAddMenuItem({
    \ 'text': '(w)rite - open file and Gwrite',
    \ 'shortcut': 'w',
    \ 'parent': gitSubMenu,
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled',
    \ 'callback': 'NERDTreeFugitiveWrite' })

call NERDTreeAddMenuItem({
    \ 'text': '(s)tatus - jump to file in fugitive status window',
    \ 'shortcut': 's',
    \ 'parent': gitSubMenu,
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled',
    \ 'callback': 'NERDTreeFugitiveStatus' })


call NERDTreeAddMenuItem({
    \ 'text': '(l)og - open file and go to fugitive log window',
    \ 'shortcut': 'l',
    \ 'parent': gitSubMenu,
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled',
    \ 'callback': 'NERDTreeFugitiveLog' })

function! NERDTreeFugitiveEnabled()
    let p = g:NERDTreeFileNode.GetSelected().path
    return !p.isDirectory
endfunction

function! s:getPath()
    let n = g:NERDTreeFileNode.GetSelected()
    let g:ntfLastNode = n.path.str()
    return g:ntfLastNode
endfunction

function! NERDTreeFugitiveWrite()
    let p = s:getPath()
    call nerdtree#closeTreeIfOpen()
    exe "e!" . p | Gwrite
endfunction

function! NERDTreeFugitiveStatus()
    let p = fnamemodify(s:getPath(), ":t")
    call nerdtree#closeTreeIfOpen()
    exe "Gstatus" | exe "/" . p
endfunction

function! NERDTreeFugitiveLog()
    let p = s:getPath()
    call nerdtree#closeTreeIfOpen()
    exe "e!" . p | silent Glog | copen
endfunction
