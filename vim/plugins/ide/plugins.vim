" Auto install vim-plug
if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
elseif empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

  set rtp+=~/.dotfiles/vim/plugins/

  runtime completion.vim
  runtime integrations.vim
  runtime language.vim
  runtime other.vim

  runtime ide/coc.vim
  runtime ide/commands.vim
  runtime ide/display.vim
  runtime ide/interface.vim

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

