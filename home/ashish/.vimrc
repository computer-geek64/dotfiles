syntax on
set background=dark
set number
set laststatus=2
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=10
set history=200
set shell=/bin/bash
au CursorHoldI * stopinsert
command Latex w | !pdflatex '%'; rm *.aux *.log
command C w | !gcc '%'; ./a.out
command Cpp w | !g++ '%'; ./a.out
command Hex %!xxd
command Unhex %!xxd -r
map <F1> :Latex<Enter>

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
