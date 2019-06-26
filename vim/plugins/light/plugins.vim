" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

  set rtp+=~/.dotfiles/vim/plugins/

  runtime completion.vim
  runtime display.vim
  runtime integrations.vim
  runtime interface.vim
  runtime language.vim
  runtime other.vim

  if has("nvim")
    runtime commands.vim
  else
    runtime coc.vim
  endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

