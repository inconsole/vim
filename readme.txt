1:
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/

2:
BundleInstall






//
a:  
ycm_client_support.[so|pyd|dll] and ycm_core.[so|pyd|dll] not detected; you need to compile YCM before using it. Read the docs!

To:
cd ~/.vim/bundle/YouCompleteMe 
./install.sh --clang-completer


a:
Exuberant ctags not found

To:
apt-get install ctags
