"git dir is b:git_dir

if exists("g:loaded_nerdtree_fugitive")
    finish
endif

let g:loaded_nerdtree_fugitive = 1

call NERDTreeAddMenuSeparator({
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled'})

let gitSubMenu = NERDTreeAddSubmenu({
    \ 'text': '(g)it',
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled',
    \ 'shortcut': 'g',
    \ 'scope': 'FileNode'})

call NERDTreeAddMenuItem({
    \ 'text': '(a)dd - Git add without opening the file',
    \ 'shortcut': 'a',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveAdd' })

call NERDTreeAddMenuItem({
    \ 'text': '(w)rite - open file and Gwrite',
    \ 'shortcut': 'w',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveWrite' })

call NERDTreeAddMenuItem({
    \ 'text': '(l)og - open file and go to fugitive log window',
    \ 'shortcut': 'l',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveLog' })

call NERDTreeAddMenuItem({
    \ 'text': '(o)pen a version from another branch',
    \ 'shortcut': 'o',
    \ 'parent': gitSubMenu,
    \ 'callback': 'NERDTreeFugitiveOpen' })

call NERDTreeAddMenuItem({
    \ 'text': '(r)emove - open buffer then Gremove it and destroy the buffer',
    \ 'shortcut': 'r',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveRemove' })

call NERDTreeAddMenuItem({
    \ 'text': '(b)lame - open file and go to Gblame quickfix window',
    \ 'shortcut': 'b',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveBlame' })

call NERDTreeAddMenuItem({
    \ 'text': '(g)rep - search this object with normal grep',
    \ 'shortcut': 'g',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveGrep' })

call NERDTreeAddMenuItem({
    \ 'text': 'Ggr(e)p - search the full repo',
    \ 'shortcut': 'e',
    \ 'parent': gitSubMenu,
    \ 'scope': 'FileNode',
    \ 'callback': 'NERDTreeFugitiveGgrep' })

call NERDTreeAddMenuItem({
    \ 'text': '(s)tatus - jump to file in fugitive status window',
    \ 'shortcut': 's',
    \ 'parent': gitSubMenu,
    \ 'callback': 'NERDTreeFugitiveStatus' })

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
    exe "e! " . p | Gwrite | exe "e " . p
endfunction

function! NERDTreeFugitiveAdd()
    let p = s:getPath()
    exe "silent Git add " . p
endfunction

function! NERDTreeFugitiveRemove()
    let p = s:getPath()
    call nerdtree#closeTreeIfOpen()
    exe "e!" . p | Gremove
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

function! NERDTreeFugitiveBlame()
    let p = s:getPath()
    call nerdtree#closeTreeIfOpen()
    exe "e!" . p | silent Gblame
endfunction

function! NERDTreeFugitiveGgrep()
    echo "=======================================\n"
    echo "complete git grep command with arguments and search terms:\n"
    let cmd = input(':Ggrep ')
    call nerdtree#closeTreeIfOpen()
    if cmd != ''
        exe ':silent Ggrep ' . cmd | copen
    else
        echo "Aborted"
    endif
endfunction

function! NERDTreeFugitiveGrep()
    let p = s:getPath()
    echo "=======================================\n"
    echo "complete grep command with options and arguments (filename appended):\n"
    let cmd = input(':grep ')
    call nerdtree#closeTreeIfOpen())
    if cmd != ''
        exe ":silent grep " . cmd . " " . p | copen
    else
        echo "Aborted"
    endif
endfunction

function! NERDTreeFugitiveOpen()
    let p = s:getPath()
    echo "=======================================\n"
    let cmd = input('Branch name: ')
    call nerdtree#closeTreeIfOpen()
    if cmd != ''
        exe ':silent Gedit ' . cmd . ":" . p
    else
        echo "Aborted"
    endif
endfunction
