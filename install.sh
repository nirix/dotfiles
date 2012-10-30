mv ~/.gemrc ~/.gemrc.back
cp gemrc ~/.gemrc
mv ~/.zshrc ~/zshrc.back
cp zshrc ~/.zshrc

cd ~
mkdir .code
cd .code
git clone git://github.com/rupa/z.git
git clone git://github.com/dronir/SpotifyControl.git
