# dotfiles

Run `./bootstrap` (requires Ruby) to symlink everything to `~`.


## Git subtrees

### oh-my-zsh/

    git remote add -f oh-my-zsh https://github.com/robbyrussell/oh-my-zsh.git
    git subtree pull --prefix oh-my-zsh oh-my-zsh master


## Vim

Vim bundles are handled by [Vundle](http://github.com/gmarik/vundle).
The Vundle repository itself should be cloned into `vim/bundle/vundle`
automatically by `bootstrap`. Then start Vim and run `:BundleInstall` to
install the actual bundles.
