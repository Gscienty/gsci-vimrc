
function INSTALL_PLUG()
{
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

funcion INSTALL_EPEL()
{
    yum install -y epel-release
}

functon INSTALL_DEPS()
{
    yum install -y gcc ncurses-devel python python-devel
}
