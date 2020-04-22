#/bin/bash

mv  $HOME/.spacemacs $HOME/.spacemacs.back
mv  $HOME/.tmux.conf $HOME/.tmux.conf.back
mv  $HOME/.vim/vimrc $HOME/.vim/vimrc.back

ln -s .spacemacs $HOME/.spacemacs
ln -s .tmux.conf $HOME/.tmux.conf
ln -s vimrc $HOME/.vim/vimrc

