inoremap jj <ESC><ESC>
set number
inoremap <C-a> <Esc>ggVG
nnoremap <C-a> <Esc>ggVG
vnoremap y y`>

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" ==============================================================================
" 关闭误操作时的屏幕闪烁和蜂鸣警告音
" ==============================================================================
set noerrorbells    " 关闭错误警报声音
set novisualbell   " 关闭视觉响铃（即停止屏幕闪烁）
set t_vb=          " 清空视觉响铃的终端序列（双重保险，彻底禁闪）


