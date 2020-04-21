#!/bin/bash

sudo apt-get -y install git vim php5-cli php5-curl build-essential mysql-server tree htop curl

cat <<EOF > $HOME/.bash_colors
#!/bin/bash
# Reset
Color_Off='\\e[0m'       # Text Reset
# Regular Colors
Black='\\e[0;30m'        # Black
Red='\\e[0;31m'          # Red
Green='\\e[0;32m'        # Green
Yellow='\\e[0;33m'       # Yellow
Blue='\\e[0;34m'         # Blue
Purple='\\e[0;35m'       # Purple
Cyan='\\e[0;36m'         # Cyan
White='\\e[0;37m'        # White
# Bold
BBlack='\\e[1;30m'       # Black
BRed='\\e[1;31m'         # Red
BGreen='\\e[1;32m'       # Green
BYellow='\\e[1;33m'      # Yellow
BBlue='\\e[1;34m'        # Blue
BPurple='\\e[1;35m'      # Purple
BCyan='\\e[1;36m'        # Cyan
BWhite='\\e[1;37m'       # White
# Underline
UBlack='\\e[4;30m'       # Black
URed='\\e[4;31m'         # Red
UGreen='\\e[4;32m'       # Green
UYellow='\\e[4;33m'      # Yellow
UBlue='\\e[4;34m'        # Blue
UPurple='\\e[4;35m'      # Purple
UCyan='\\e[4;36m'        # Cyan
UWhite='\\e[4;37m'       # White
# Background
On_Black='\\e[40m'       # Black
On_Red='\\e[41m'         # Red
On_Green='\\e[42m'       # Green
On_Yellow='\\e[43m'      # Yellow
On_Blue='\\e[44m'        # Blue
On_Purple='\\e[45m'      # Purple
On_Cyan='\\e[46m'        # Cyan
On_White='\\e[47m'       # White
# High Intensity
IBlack='\\e[0;90m'       # Black
IRed='\\e[0;91m'         # Red
IGreen='\\e[0;92m'       # Green
IYellow='\\e[0;93m'      # Yellow
IBlue='\\e[0;94m'        # Blue
IPurple='\\e[0;95m'      # Purple
ICyan='\\e[0;96m'        # Cyan
IWhite='\\e[0;97m'       # White
# Bold High Intensity
BIBlack='\\e[1;90m'      # Black
BIRed='\\e[1;91m'        # Red
BIGreen='\\e[1;92m'      # Green
BIYellow='\\e[1;93m'     # Yellow
BIBlue='\\e[1;94m'       # Blue
BIPurple='\\e[1;95m'     # Purple
BICyan='\\e[1;96m'       # Cyan
BIWhite='\\e[1;97m'      # White
# High Intensity backgrounds
On_IBlack='\\e[0;100m'   # Black
On_IRed='\\e[0;101m'     # Red
On_IGreen='\\e[0;102m'   # Green
On_IYellow='\\e[0;103m'  # Yellow
On_IBlue='\\e[0;104m'    # Blue
On_IPurple='\\e[0;105m'  # Purple
On_ICyan='\\e[0;106m'    # Cyan
On_IWhite='\\e[0;107m'   # White
EOF

cat << EOF > $HOME/.vimrc
" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.
" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=4
        set noexpandtab
    el
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Wrap text after a certain number of characters
" Python: 79
" C: 79
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.
" Set the default file encoding to UTF-8: ``set encoding=utf-8``
" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``
" For full syntax highlighting:
let python_highlight_all=1
syntax on
" Automatically indent based on file type: ``filetype indent on``
" Keep indentation level from previous line: ``set autoindent``
filetype indent on
set autoindent
" Folding based on indentation: ``set foldmethod=indent``
" Turn on "dark background" mode
set bg=dark
set tabstop=4
set softtabstop=4
set cursorline
set number
" Formats the statusline
set statusline=%f                           " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%y      "filetype
"set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
"set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=Line:%l/%L                  " line X of Y
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
" create F5, F6 mappings to replace current position with ✓ or ✗ respectively
map <F5> r<C-v>U2713<ESC>
map <F6> r<C-v>U2717<ESC>
EOF

# bash aliases
cat << EOF > $HOME/.bash_aliases
alias jerbs='jobs'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias sl='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias objdbin_x86='objdump -D -b binary -mi386'
alias what_are_those_damn_conditional_expressions="man bash | sed -n '/^CONDITIONAL EXPRESSIONS/,/^SIMPLE COMMAND/p'"
alias what_are_those_damn_builtin_commands="man bash | sed -n '/^SHELL BUILTIN COMMANDS/,/^RESTRICTED SHELL/p'"
alias cleanpyc='rm -f \$(find . -name "*.pyc")'
function gitbranch() {
  git status 2>/dev/null 1>&2
  if [ \$? == 0 ]
  then
    statuslinecount=\$(git status | wc -l)
	if [ \$statuslinecount -gt 2 ]
	then
	  colorcode=\$Red
	else
	  colorcode=\$Green
	fi
    branchname=\$(git branch | grep "^\*" | cut -f2 -d" ")
	GIT_BRANCH_COLOR=\$colorcode
	GIT_BRANCH=":\$branchname"
  else
    GIT_BRANCH_COLOR=\$Color_Off
    GIT_BRANCH=""
  fi
}
EOF


# setup python tab-completion
cat << EOF > $HOME/.pythonrc
#!/usr/bin/python
import os
import sys
try:
    import readline
except ImportError:
    print "Module readline not available."
else:
    import rlcompleter
	readline.parse_and_bind("tab: complete")
EOF

# source .bash_colors at beginning of .bashrc
cp $HOME/.bashrc $HOME/.bashrc.orig
echo ". \$HOME/.bash_colors" > $HOME/.bashrc
cat $HOME/.bashrc.orig >> $HOME/.bashrc
rm -f $HOME/.bashrc.orig

cat << EOF >> $HOME/.bashrc
export PYTHONSTARTUP=~/.pythonrc
export PATH=\$PATH:\$HOME/bin:\$HOME/git/github/arcanist/bin
PROMPT_COMMAND='gitbranch'
PS1='\$([ \$? == 0 ] && echo -en "\\e[0;32m=)\\e[0m" || echo -en "\\e[0;31m=(\\e[0m") \[\\e[m\\e[1;30m\][\j:\!\[\\e[1;30m\]]\[\\e[0;36m\] \t \d \[\\e[1;30m\][\[\\e[1;34m\]\u@\H\[\\e[1;30m\]:\[\\e[0;37m\] \[\\e[0;32m\]+\${SHLVL}\[\\e[1;30m\]] \[\\e[1;37m\]\w\[\\e[38;5;2m\]\$([ "\$GIT_BRANCH" == ":master" ] && echo -e "\\e[1;31m\$GIT_BRANCH\\e[0m" || echo -e "\\e[38;5;2m\$GIT_BRANCH\\e[0m")\[\\e[0m\]\n\\\$ '
EOF

# git configuration; I hate forgetting these things
git config --global user.name 'Don Grote'
git config --global user.email 'don.grote@gmail.com'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor $(which vim)

# install virtualenv for python dev
sudo apt-get install python-pip
sudo pip install virtualenv
sudo pip install coverage


mkdir $HOME/bin
# create git cloning directories
mkdir -p $HOME/git/github
cd $HOME/git/github
# install phabricator tools
git clone https://github.com/phacility/libphutil.git
git clone https://github.com/phacility/arcanist.git
cd $HOME/git/github/arcanist ; git checkout stable ; cd -
cd $HOME/git/github/libphutil ; git checkout stable ; cd -

# install nodejs
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g mocha
