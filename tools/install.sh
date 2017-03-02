#!/bin/sh

echo "\033[34m\033[1mStarting installation..."
echo "\033[34m\033[1mGetting the files needed :"
echo "\033[35m"

git clone https://github.com/seluj78/myconfigfiles.git /tmp/setupconfig
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "\033[0m"
echo "\033[34m\033[1mCoping the files to a temporary location (Usually /tmp)\033[32m"

count=0
total=12
pstr="[=======================================================================]"
while [ $count -lt $total ]; do
	sleep 0.2 # this is fake ! OMG MOM GET THE KAMERA
	count=$(( $count + 1 ))
	pd=$(( $count * 73 / $total ))
	printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

echo "\n\033[34m\033[1mNow installing the gpush command\033[0m"
echo "\033[35m"

touch ~/.gpush.sh
chmod 777 ~/.gpush.sh
cat /tmp/setupconfig/sources/gpush > ~/.gpush.sh

echo "\033[0m\033[32m"

count=0
total=13
pstr="[=======================================================================]"
while [ $count -lt $total ]; do
	sleep 0.2 # this is fake ! OMG MOM GET THE KAMERA
	count=$(( $count + 1 ))
	pd=$(( $count * 73 / $total ))
	printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

echo "\n\033[34m \033[1mNow configuring your .vimrc and .zshrc files\033[0m"

cat /tmp/setupconfig/sources/vimrc >> ~/.vimrc
cat /tmp/setupconfig/sources/zshrc >> ~/.zshrc

echo "\033[0m\033[32m"

count=0
total=7
pstr="[=======================================================================]"
while [ $count -lt $total ]; do
	sleep 0.2 # this is fake ! OMG MOM GET THE KAMERA
	count=$(( $count + 1 ))
	pd=$(( $count * 73 / $total ))
	printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

echo "\n\033[34m\033[1mCreating backupdir for vim so you don't get the .swp files\033[0m"

mkdir ~/.vim

echo "\033[34m\033[1mRemoving temporary files...\033[032m"

count=0
total=6
pstr="[=======================================================================]"
while [ $count -lt $total ]; do
	sleep 0.2 # this is fake ! OMG MOM GET THE KAMERA
	count=$(( $count + 1 ))
	pd=$(( $count * 73 / $total ))
	printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done

rm -rf /tmp/setupconfig

echo "\n\033[34m\033[1mDone installing.\033[0m"

echo "Open vim +PluginInstall to finish the wakatime installation"

echo "\n"
