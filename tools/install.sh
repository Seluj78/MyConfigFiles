echo "Starting installation"

git clone https://github.com/seluj78/myconfigfiles.git /tmp/setupconfig


echo "Installing the gpush command"
touch ~/.gpush.sh
chmod 777 ~/.gpush.sh
cat /tmp/setupconfig/sources/gpush > ~/.gpush.sh

echo "Now configuring your vimrc and zshrc"
cat /tmp/setupconfig/sources/vimrc >> ~/.vimrc
cat /tmp/setupconfig/sources/zshrc >> ~/.zshrc

echo "Creating backupdir for vim so you don't get the .swp files"
mkdir ~/.vim

echo "Done installing, removing temp files"
rm -rf /tmp/setupconfig
