## What to do

Make sure zsh is installed, OS X users can use [Homebrew](http://mxcl.github.com/homebrew)
by running `brew install zsh`.

Then clone this repository to your home directory:

    git clone --recursive git://github.com/nirix/dotfiles.git ~/.dotfiles

Now just `cd .dotfiles` then `zsh install.zsh` and you're done.

## Using zsh instead of bash all the time

Append `/usr/local/bin/zsh` to `/etc/shells` and run `chsh -s /brew/bin/zsh`

## The 'osx' file

The `osx` file makes changes to the OS X system, open the file to see specifics.

To enable all changes, simply run `zsh osx`.
