	  syntax on
 " endif

  " Javascript syntax hightlight
  syntax enable
 
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd Syntax javascript set syntax=jquery
  " Color scheme
  colorscheme molokai
  "highlight NonText guibg=#000000
  "highlight Folded  guibg=#0A0A0A guifg=#9090D0
 
set autoindent
set cindent
set smartindent
" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

" Display extra whitespace
"set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1

" Numbers
set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch
 
" Highlight current line
  "au WinLeave * set nocursorline "nocursorcolumn
  "au WinEnter * set cursorline "cursorcolumn
  "set cursorline "cursorcolumn
hi CursorLine   cterm=NONE ctermbg=black
set cursorline


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
"let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 " Open a NERDTree
nmap <c-n> :NERDTreeToggle<cr>


" Tagbar
 "let g:tagbar_ctags_bin='ctags'
 let g:tagbar_width=35
 let g:tagbar_autofocus=1
 let g:tarbar_map='<c-b>'
 let g:tarbar_cmd='Tagbar'
 nmap <c-t> :TagbarToggle<cr>

" ctrap
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif "
" MacOSX/Linux
 let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif


set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness


 "powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'unicode'

let g:mapleader = ","

" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*


" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope

  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l



" gtags-cscope setting {{{
    " I use GNU global instead cscope because global is faster.
    " need install global
    " 1. install global
    " 2. copy /usr/local/share/gtags/gtags-cscope.vim gtags.vim  to
    " ~/.vim/bundle/gtags.vim/plugin/
    " no needed now with the follow function replace the gtags-cscope.vim plugin
    function! s:GtagsCscope_GtagsRoot()
      let s:global_command = "global"
        let cmd = s:global_command . " -pq"
        let cmd_output = system(cmd)
        return strpart(cmd_output, 0, strlen(cmd_output) - 1)
    endfunction


    function! s:GtagsCscope()
        "
        " Get gtagsroot directory.
        "
        let gtagsroot = s:GtagsCscope_GtagsRoot()
      if (!empty(gtagsroot))
        "

        " Load gtags-cscope.

       set cscopetag
        set csprg=gtags-cscope
    "    let s:command = "cs add " . gtagsroot . "/GTAGS"
        let s:option = ''
    "    if g:GtagsCscope_Ignore_Case == 1
            let s:option = s:option . 'C'
    "    endif
    "    if g:GtagsCscope_Absolute_Path == 1
            let s:option = s:option . 'a'
    "    endif
    "    if g:GtagsCscope_Keep_Alive == 1
            let s:option = s:option . 'i'
    "    endif
        if s:option != ''
    "        let s:command = s:command . ' . -' . s:option
        endif
        set nocscopeverbose
        "let s:command = "cs add " . gtagsroot . "/GTAGS" . ' . -' . 'i' . 'a' . 'C'
        let s:command = "cs add " . gtagsroot . "/GTAGS" . ' . -' . 'i' . 'a'
        exe s:command
        set cscopeverbose
        "
        " Key mapping
        "
      " if g:GtagsCscope_Auto_Map == 1
            " The following key mappings are derived from 'cscope_maps.vim'.
            " (The 'd' command is not implemented in gtags-cscope.)
            "
            " normal command
            :nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
            :nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
            :nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
            :nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
            :nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
            :nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
            :nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
            ":nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
            " Using 'CTRL-spacebar', the result is displayed in new horizontal window.
      " endif
      endif
    endfunction


    function! UpdateGtags(f)
      let dir = fnamemodify(a:f, ':p:h')
      exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
    endfunction


    "==
    " windowdir
    "  Gets the directory for the file in the current window
    "  Or the current working dir if there isn't one for the window.
    "  Use tr to allow that other OS paths, too
    function! s:windowdir()
      if winbufnr(0) == -1
        let unislash = getcwd()
      else
        let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
      endif
        return tr(unislash, '\', '/')
    endfunc
    "
    "==
    " Find_in_parent
    " find the file argument and returns the path to it.
    " Starting with the current working dir, it walks up the parent folders
    " until it finds the file, or it hits the stop dir.
    " If it doesn't find it, it returns "Nothing"
    function! s:Find_in_parent(fln,flsrt,flstp)
      let here = a:flsrt
      while ( strlen( here) > 0 )
        if filereadable( here . "/" . a:fln )
          return here
        endif
        let fr = match(here, "/[^/]*$")
        if fr == -1
          break
        endif
        let here = strpart(here, 0, fr)
        if here == a:flstp
          break
        endif
      endwhile
      return "Nothing"
    endfunc


    " 下面的函数替代autoload_cscope.vim
    "==
    " Unload_csdb
    "  drop cscope connections.
    function! s:Unload_csdb()
      if exists("b:csdbpath")
        if cscope_connection(3, "out", b:csdbpath)
          let save_csvb = &csverb
          set nocsverb
          exe "cs kill " . b:csdbpath
          set csverb
          let &csverb = save_csvb
        endif
      endif
    endfunc
    "
    "==
    " Cycle_csdb
    "  cycle the loaded cscope db.
    function! s:Cycle_csdb()
        if exists("b:csdbpath")
          if cscope_connection(3, "out", b:csdbpath)
            return
            "it is already loaded. don't try to reload it.
          endif
        endif
        let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),$HOME)
    "    echo "Found cscope.out at: " . newcsdbpath
    "    echo "Windowdir: " . s:windowdir()
        if newcsdbpath != "Nothing"
          let b:csdbpath = newcsdbpath
          if !cscope_connection(3, "out", b:csdbpath)
            let save_csvb = &csverb
            "set nocsverb
            set csverb
            exe "cs add " . b:csdbpath . "/cscope.out " . b:csdbpath
            let &csverb = save_csvb
          endif
          "
        else " No cscope database, undo things. (someone rm-ed it or somesuch)
          call s:Unload_csdb()
        endif
    endfunc


    "如果GTAGS存在, 则使用gtags-cscope
    "如果GTAGS不存在，则使用cscope
    function! SelectCscopeDb()
      set nocscopeverbose   "suppress 'duplicate connection' error
        let gtagsroot = s:GtagsCscope_GtagsRoot()
      if (!empty(gtagsroot))
        set cscopeprg=gtags-cscope
        set cscopetag
        let s:command = "cs add " . gtagsroot . "/GTAGS" . ' . -' . 'i' . 'a'
        exe s:command


        "保存文件时自动更新gtags
        "au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))
        "au BufWritePost *.[ch]pp call UpdateGtags(expand('<afile>'))
        "au BufWritePost *.[ch]xx call UpdateGtags(expand('<afile>'))
        "au BufWritePost *.java call UpdateGtags(expand('<afile>'))
        "au BufWritePost *.cc call UpdateGtags(expand('<afile>'))
      else
        set csprg=/usr/bin/cscope
        " Use both cscope and ctag
        set cscopetag
        " Use cscope for definition search first
        set cscopetagorder=0
        let g:autocscope_menus=0
          set cscopetagorder=0
        " auto toggle the menu
        augroup autoload_cscope
        au!
        au BufEnter *.[chly]  call <SID>Cycle_csdb()
        au BufEnter *.cc      call <SID>Cycle_csdb()
        au BufEnter *.cpp     call <SID>Cycle_csdb()
        au BufEnter *.java    call <SID>Cycle_csdb()
        au BufUnload *.[chly] call <SID>Unload_csdb()
        au BufUnload *.cc     call <SID>Unload_csdb()
        au BufUnload *.cpp     call <SID>Unload_csdb()
        au BufUnload *.java    call <SID>Unload_csdb()
        augroup END
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
        endif
      "set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
      "" 解决cscope与tag共存时ctrl+]有时不正常的bug
      "nmap <C-]> :tj <C-R>=expand("<cword>")<CR><CR>
      nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
      set cscopeverbose
    endfunc


    autocmd FileType c,cpp,java,python call SelectCscopeDb()
    command! -nargs=0 GtagsCscope call s:GtagsCscope()
    command! -nargs=0 Cscope call s:Cycle_csdb()
    "}}} 
"--------------------------------------------------------------------------
"vim-airline
"--------------------------------------------------------------------------
"plugin 'airline.vim'    
"let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1


 let Gtags_OpenQuickfixWindow = 1


 " 关闭状态显示空白符号计数
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'
 " 设置consolas字体"前面已经设置过
 "set guifont=Consolas\ for\ Powerline\ FixedD:h11
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_alt_sep = '❯'
  let g:airline_left_sep = '▶'
  let g:airline_right_alt_sep = '❮'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_powerline_fonts = 2

    command! BcloseOthers call <SID>BufCloseOthers()  
    function! <SID>BufCloseOthers()  
       let l:currentBufNum   = bufnr("%")  
       let l:alternateBufNum = bufnr("#")  
       for i in range(1,bufnr("$"))  
         if buflisted(i)  
           if i!=l:currentBufNum  
             execute("bdelete ".i)  
           endif  
         endif  
       endfor  
    endfunction  

  	au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))


	function! UpdateGtags(f)
	     let dir = fnamemodify(a:f, ':p:h')
	     exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
	endfunction 


    
    "map <leader>bdo :BcloseOthers<cr>  
    
    hi Search term=standout ctermfg=0 ctermbg=11

    set hlsearch 
    set incsearch
    set clipboard+=unnamed

