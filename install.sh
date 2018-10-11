#!/bin/sh

# Update package manager
sudo apt-get update

# Install prerequisites
sudo apt-get install -y python3-dev python3-pip fortune cowsay ansiweather
pip install psutil

# Install thefuck
sudo pip3 install thefuck


# Install z
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z.sh
chmod 777 ~/z.sh

# Install zsh-256color
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )
# Install alias-tips
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/djui/alias-tips.git )
# Install Apache2 plugin
# NOT WORKING?
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/voronkovich/apache2.plugin.zsh )
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Install plugin autoupdates
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
# Install bd
mkdir -p $HOME/.zsh/plugins/bd
curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > $HOME/.zsh/plugins/bd/bd.zsh
print -- "\n# zsh-bd\n. \$HOME/.zsh/plugins/bd/bd.zsh" >> $HOME/.zshrc
# Install calc
gcl https://github.com/arzzen/calc.plugin.zsh ~/.oh-my-zsh/plugins/calc
# Install careful_rm
( cd /home/seluj78/.oh-my-zsh/custom/plugins && git clone https://github.com/MikeDacre/careful_rm.git )
# Install quoter-zsh
( cd /home/seluj78/.oh-my-zsh/custom/plugins && git clone https://github.com/pxgamer/quoter-zsh )
# Install randeme
( cd /home/seluj78/.oh-my-zsh/custom/plugins && git clone https://github.com/ex-surreal/randeme )
# Install send
# NOT WORKING?
( cd /home/seluj78/.oh-my-zsh/custom/plugins && git clone https://github.com/robertzk/send.zsh.git )
# Install startup-timer
# NOT WORKING?
( cd /home/seluj78/.oh-my-zsh/custom/plugins && git clone https://github.com/paulmelnikow/zsh-startup-timer )
# Install oh-my-matrix
git clone https://github.com/amstrad/oh-my-matrix /home/seluj78/.oh-my-zsh/custom/plugins/oh-my-matrix
# Install notify
# NOT WORKING?
git clone git@github.com:marzocchi/zsh-notify.git ~/.oh-my-zsh/custom/plugins/notify

git clone https://github.com/seluj78/myconfigfiles.git /tmp/setupconfig
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

touch ~/.gpush.sh
chmod 777 ~/.gpush.sh
cat /tmp/setupconfig/sources/gpush > ~/.gpush.sh

cat /tmp/setupconfig/sources/vimrc >> ~/.vimrc
cat /tmp/setupconfig/sources/zshrc >> ~/.zshrc

mkdir ~/.vim

rm -rf /tmp/setupconfig

echo "\n\033[34m\033[1mDone installing.\033[0m"
echo "Open vim +PluginInstall to finish the wakatime installation"
echo "\n"
