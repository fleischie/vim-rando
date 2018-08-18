# vim-rando

Vim plugin for generating pseudo-random numbers.

## Table of Contents

- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

## Installation

See the documentation for the specific vim package manager for details on how
to install packages for vim.

### Install via [Vundle][vundle-vim]

Add to vimrc:

    Plugin 'fleischie/vim-rando'

Install via:

    :so ~/.vimrc
    :PluginInstall

### Install via [vim-plug][vim-plug]

Add to vimrc:

    Plug 'fleischie/vim-rando', { 'branch': 'main' }

Install via:

    :so ~/.vimrc
    :PlugInstall

### Install via [pathogen][vim-pathogen]

Run:

    git clone https://github.com/fleischie/vim-rando ~/.vim/bundle/vim-rando

## Contributing

Contributions are very welcome. 🙇

Browse existing issues or create a new one [here][vim-rando-issues].

Submit pull requests [here][vim-rando-pull-requests]. This project uses the
[git flow model][git-flow-model] for development. Please base your feature
branch on the develop branch and follow the code style convention used in the
already existing files.

## License

Copyright (c) 2018 Karl Fleischmann.
Distributed under the same terms as Vim itself. See `:help license`.


[git-flow-model]: http://nvie.com/posts/a-successful-git-branching-model/
[vim-pathogen]: https://github.com/tpope/vim-pathogen
[vim-plug]: https://github.com/junegunn/vim-plug
[vim-rando-issues]: https://github.com/fleischie/vim-rando/issues
[vim-rando-pull-requests]: https://github.com/fleischie/vim-rando/pulls
[vundle-vim]: https://github.com/VundleVim/Vundle.Vim
