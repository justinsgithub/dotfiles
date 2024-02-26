# wordlist.vim

This is a list of words, predominantly technological and scientific jargon and
proper nouns, that the spellchecker in Vim and Neovim will say are misspelled.

## Installation

First, compile the `.spl` binary from the word list:

```sh
./build
```

Then, install the wordlist in `${HOME}/.vim/spell/` and
`${HOME}/.config/nvim/spell/`, run:

```sh
./install
```

Alternatively, should you would rather append the list to one that already
exists in your Vim/Neovim directory, run:

```sh
./append
```

This script will append the list to your current one while removing any
duplicate terms.

Run `./uninstall` to remove `en.utf-8.add` and `en.utf-8.add.spl`.

## Editing

To add more to the wordlist, edit the `spell/en.utf-9.add` file. Then,
re-compile the `.spl` file with the `build` script. The new files should then be
re-installed with either the `install` or `append` scripts.
