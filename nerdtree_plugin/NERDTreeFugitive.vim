
"guard against sourcing the script twice
if exists("g:loaded_nerdtree_fugitive")
    finish
endif

let g:loaded_nerdtree_fugitive = 1
 "add a menu separator (a row of dashes) before our new menu item
call NERDTreeAddMenuSeparator({
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled'})
 
"add the main menu item
call NERDTreeAddMenuItem({
    \ 'text': '(g)it',
    \ 'shortcut': 'g',
    \ 'isActiveCallback': 'NERDTreeFugitiveEnabled',
    \ 'callback': 'NERDTreeFugitive' })
 
"we only want the menu item to be displayed if the current
"node is an image file
function! NERDTreeFugitiveEnabled()
    let p = g:NERDTreeFileNode.GetSelected().path
    return !p.isDirectory
endfunction
 
"open the file the cursor is on in eog
function! NERDTreeFugitive()
    let n = g:NERDTreeFileNode.GetSelected()
    let p = n.path.str({'escape': 1})
    execute "Gwrite " . p
endfunction
