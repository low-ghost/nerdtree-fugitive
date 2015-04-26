#Nerdtree-fugitive

A plugin that adds git and vim-fugitive functionality to NERDtree

Very straight forward implementation that uses the NERDTree menu api to make calls to vum-fugitive.

Obviously requires both scrooloose/nerdtree at https://github.com/scrooloose/nerdtree and tpope/vim-fugitive, also on github.

Install it with Vundle by putting Bundle “low-ghost/nerdtree-fugitive” in your .vimrc.bundles or equivalent file, source your vimrc and run :BundleInstall in vim. Similar with Plug and NeoBundle.

Works well with Xuyuanp/nerdtree-git-plugin, which provides visual markers of file status.

This plugin adds a (g)it menu to the NERDtree menu, brought up by toggling NERDtree and hitting ‘m’ then ‘g’

###The Menu

    (a)dd - Git add without opening the file
    (w)rite - open file and Gwrite
    (l)og - open file and go to fugitive log window
    (d)iff - open diff or merge conflict tool
    (o)pen a version from another branch
    (r)emove - open buffer then Gremove it and destroy the buffer
    (b)lame - open file and go to Gblame quickfix windowGgr
    (g)rep - search this object with normal grep
    Ggr(e)p - search the full repo
    (s)tatus - jump to file in fugitive status window
