#NERDtree-Fugitive

######A plugin that adds git and vim-fugitive functionality to NERDtree

Very straight forward implementation that uses the NERDTree menu api to make calls to vim-fugitive. This plugin requires both [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) and [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive). Though you could also open the file and perform vim-fugitive calls from the commandline or via shortcuts, I find it useful to view the directory structure and be able to perform git functions directly from a GUI menu, especially with the xuyuanp/nerdtree-git-plugin for visual markers.

I only worked on this for a few hours, so let me know if there are any bugs or features that could be improved/added. I'm also planning something similair for Cntrp

###Installation
Install it with Vundle by putting
`Bundle “low-ghost/nerdtree-fugitive”
in your .vimrc.bundles or equivalent file, source your vimrc and run :BundleInstall in vim. Similar with Plug and NeoBundle.

###Additional
Works well with Xuyuanp/nerdtree-git-plugin, which provides visual markers of file status.

###What it does:
Adds a (g)it menu to the NERDtree menu, entered by toggling NERDtree and hitting ‘m’ then ‘g’

###The Menu

    (a)dd - Git add without opening the file
    (w)rite - open file and Gwrite
    (l)og - open file and go to fugitive log window
    (d)iff - open diff or merge conflict tool
    (o)pen a version from another branch
    (r)emove - open buffer then Gremove it and destroy the buffer
    (b)lame - open file and go to Gblame quickfix window
    (g)rep - search this file with normal grep
    Ggr(e)p - search the full repo with git grep
    (s)tatus - jump to file in fugitive status window

## Credits

*  [scrooloose](https://github.com/scrooloose): NERDtree and its API
*  [tpope](https://github.com/tpope/vim-fugitive): vim-fugitive and Git wrapper
*  [Xuyuanp](https://github.com/Xuyuanp/nerdtree-git-plugin): optional visual elements
