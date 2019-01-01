"""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""
" 定义前缀键
let mapleader=";"

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 定义git grep 快捷键
cnoreabbrev grep !git grep

" vim文本选择
" v : 按照字符选择
" V : 按行选择
" Ctrl+v : 按列选择

" 剪切到剪切板
nmap <Leader>d "+d
" 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 水平窗口:sp
nmap wsp :sp<cr>
" 垂直窗口:vsp
nmap wvsp :vsp<cr>
" 遍历子窗口
nnoremap wn <C-W><C-W>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nmap <C-F11> :!cscope -bRq<cr>
nmap <C-F12> :!ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull --extra=+ .<cr>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" eggcache vim
:command! W w
:command! WQ wq
:command! Wq wq
:command! Q q
:command! Qa qa
:command! QA qa
