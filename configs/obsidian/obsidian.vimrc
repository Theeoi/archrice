" Proper indentation and tabs
set tabstop=4

" Yank to system clipboard
set clipboard=unnamed

" Using <Space> as leader
unmap <Space>

" Navigate visual lines rather than logical ones
nnoremap j gj
nnoremap k gk

" Quickly remove search highlights
nnoremap // :nohl<CR>

" Toggle folds
exmap toggleFold obcommand editor:toggle-fold
nnoremap zo :toggleFold<CR>
nnoremap zc :toggleFold<CR>
nnoremap za :toggleFold<CR>

" Open quickswitcher
exmap switcher obcommand switcher:open
nnoremap <Space>o :switcher<CR>

" Focus on file explorer
exmap fileExplorer obcommand file-explorer:open
nnoremap <Space>e :fileExplorer<CR>

" Focus on global search
exmap searchExplorer obcommand global-search:open
nnoremap <Space>s :searchExplorer<CR>

" Focus on git view
exmap gitExplorer obcommand obsidian-git:open-git-view
nnoremap <Space>g :gitExplorer<CR>

" Go back and forth with Ctrl-I/O
exmap back obcommand app:go-back
nnoremap <C-o> :back<CR>
exmap forward obcommand app:go-forward
nnoremap <C-i> :forward<CR>

" Delete file
exmap deleteFile obcommand app:delete-file
nnoremap <Space>DD :deleteFile<CR>

" Closing and saving
exmap saveFile obcommand editor:save-file
nnoremap <Space>w :saveFile<CR>
exmap closeFile obcommand workspace:close
nnoremap <Space>W :saveFile<CR>:closeFile<CR>
nnoremap <Space>Q :closeFile<CR>

" Tabs
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nnoremap <Space>tl :nextTab<CR>
nnoremap <Space>th :prevTab<CR>
nnoremap <Space>tx :closeFile<CR>

" Splits
exmap vsplit obcommand workspace:split-vertical
nnoremap <Space>sl :vsplit<CR>
exmap split obcommand workspace:split-horizontal
nnoremap <Space>sj :split<CR>
exmap closeTabGroup obcommand workspace:close-tab-group
nnoremap <Space>sx :closeTabGroup<CR>

" Navigate splits
exmap focusLeft obcommand editor:focus-left
nnoremap <A-h> :focusLeft<CR>
exmap focusBottom obcommand editor:focus-bottom
nnoremap <A-j> :focusBottom<CR>
exmap focusTop obcommand editor:focus-top
nnoremap <A-k> :focusTop<CR>
exmap focusRight obcommand editor:focus-right
nnoremap <A-l> :focusRight<CR>
