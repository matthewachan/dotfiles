# dotfiles

## Description
This repo provides an easy `setup.sh` script which will install all of my preferred Vim plugins and configure my environment.

## Dependencies
Before running the setup script, make sure that you have the following installed:
- Vim 8.0
- Python (either 2.7 or 3)
- Jedi (an autocomplete package for Python)

Note: If you don't have Jedi, simply run `pip install jedi`

## Installation

Clone the repository into whichever directory you like

```bash
$ git clone https://github.com/matthewachan/dotfiles.git
```

Run the setup script, which will symlink the included .vimrc file to your local directory and install all of my preferred Vim plugins through Vundle.

```bash
$ bash ./setup.sh
```

Note: There are some optional configuration steps in the setup script which I have disabled by default. These configs include some of my preferences for screen and bash.
