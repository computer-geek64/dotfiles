syntax on
set background=dark
set number relativenumber
set laststatus=2
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=10
set history=200
set shell=/bin/bash
"au CursorHoldI * stopinsert
set ignorecase
set smartcase

command Latex exec "w" | exec "!docker run -it --volume \"$(pwd)\":/code/mountpoint --name latex --rm latex '%'; rm -f %:r.aux %:r.log"
command C w | !gcc '%'; ./a.out
command Cpp w | !g++ '%'; ./a.out
command Hex %!xxd
command Unhex %!xxd -r
map <F1> :Latex<Enter>
map <Up> :echo "Use k!"<Enter>
map <Down> :echo "Use j!"<Enter>
map <Left> :echo "Use h!"<Enter>
map <Right> :echo "Use l!"<Enter>
map <PageUp> :echo "Use Ctrl+b!"<Enter>
map <PageDown> :echo "Use Ctrl+f!"<Enter>
map <C-Up> :echo "Use k!"<Enter>
map <C-Down> :echo "Use j!"<Enter>
map <C-Left> :echo "Use b!"<Enter>
map <C-Right> :echo "Use w!"<Enter>

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
