set number
set tabstop=4
filetype off              "Required!


filetype plugin indent off
if has('vim_starting')
    set runtimepath+=/root/.vim/bundle/neobundle.vim
	call neobundle#begin(expand('/root/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'junegunn/fzf.vim'
	call neobundle#end()
endif

"Installationcheck.
if neobundle#exists_not_installed_bundles()
    echomsg 'Notinstalledbundles:'.
        \string(neobundle#get_not_installed_bundle_names())
    echomsg 'Pleaseexecute":NeoBundleInstall"command.'
    "finish
endif


" NERDTree
nnoremap <silent> <Leader>e :<C-u>NERDTreeToggle<CR>
" 表示幅
let g:NERDTreeWinSize=50

" ブックマークを表示
let g:NERDTreeShowBookmarks=1

" 親ディレクトリへ移動
let g:NERDTreeMapUpdir='<C-u>'

" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'

" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1

" 隠しファイルを表示
let g:NERDTreeShowHidden=1

" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']

augroup vimrc_nerdtree
  autocmd!
  " 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

  " Tree内では5ずつ移動する
  autocmd FileType nerdtree nnoremap 5j
  autocmd FileType nerdtree nnoremap 5k
augroup END

set rtp+=/root/.fzf
  let g:fzf_buffers_jump = 1
  nnoremap <silent> <Leader>ff :<C-u>Ag<CR>
  nnoremap <silent> <Leader>fh :<C-u>History<CR>
  nnoremap <silent> <Leader>ft :<C-u>call fzf#vim#tags(expand('<cword>'))<CR>
  nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>
  nnoremap <silent> <Leader>fgs :<C-u>GFiles?<CR>
  nnoremap <silent> <Leader>fgf :<C-u>GFiles<CR>
  nnoremap <silent> <Leader>fm :<C-u>Marks<CR>
  let g:fzf_layout = { 'down': '30%' }
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-j': 'split',
    \ 'ctrl-l': 'vsplit' }

augroup vimrc_fzf
    autocmd!
    autocmd FileType fzf tnoremap <buffer> <leader>z <Esc>
augroup END
