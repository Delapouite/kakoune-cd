# kakoune-cd

[kakoune](http://kakoune.org) commands to change or print the working directory.

## Install

Add `cd.kak` to your autoload dir: `~/.config/kak/autoload/`.

## Usage

This file provides 4 commands:

- `change-directory-current-buffer`: cd to current buffer dir
- `change-directory-project-root`: cd to root dir (location of`.git` dir in parent dirs)
- `edit-current-buffer-directory`: open an edit prompt in the current buffer directory
- `print-working-directory`: echo `$PWD`

```
# Suggested mappings

map global goto d '<esc>:change-directory-current-buffer<ret>' -docstring 'current buffer dir'
map global goto r '<esc>:change-directory-project-root<ret>' -docstring 'project root dir'
map global goto p '<esc>:cd ..;print-working-directory<ret>' -docstring 'parent dir'
map global user e ':edit-current-buffer-directory<ret>' -docstring 'edit in current buffer dir'

# Suggested aliases

alias global cdd change-directory-current-buffer
alias global cdr change-directory-project-root
alias global pwd print-working-directory
alias global ecd edit-current-buffer-directory
```

## See also

- [kakoune-buffers](https://github.com/Delapouite/kakoune-buffers)
- [kakoune-goto-file](https://github.com/Delapouite/kakoune-goto-file)
- [vcs.kak](https://github.com/lenormf/kakoune-extra/blob/master/vcs.kak)

## Licence

MIT
