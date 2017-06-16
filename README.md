# kakoune-cd

[kakoune](http://kakoune.org) commands to change or print the working directory.

## Install

Add `cd.kak` to your autoload dir: `~/.config/kak/autoload/`.

## Usage

This file provides 3 small commands:

- `change-directory-current-buffer`: cd to current buffer dir
- `change-directory-project-root`: cd to root dir (location of`.git` dir in parent dirs)
- `print-working-directory`: echo `$PWD`

```
# Suggested mappings

map global goto d '<esc>:change-directory-current-buffer<ret>' -docstring 'current buffer dir'
map global goto r '<esc>:change-directory-project-root<ret>' -docstring 'project root dir'

# Suggested aliases

alias global cdd change-directory-current-buffer
alias global cdr change-directory-project-root
alias global pwd print-working-directory
```

## See also

- [kakoune-buffers](https://github.com/Delapouite/kakoune-buffers)

## Licence

MIT
