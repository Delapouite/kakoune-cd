define-command change-directory-current-buffer -docstring 'cd to current buffer dir' %{ %sh{
  buffer_dirname=$(dirname "$kak_bufname")
  echo "cd $buffer_dirname"
  echo print-working-directory
}}

# only works for git now, use `hg root` for mercurial
define-command change-directory-project-root -docstring 'cd to project root dir' %{ %sh{
  project_root=$(git rev-parse --show-toplevel)
  echo "cd $project_root"
  echo print-working-directory
}}

define-command print-working-directory -docstring 'print working directory' %{ %sh{
  echo "echo $PWD"
}}

declare-option -hidden str oldpwd

define-command edit-current-buffer-directory -docstring 'edit in current buffer dir' %{
  %sh{ echo "set global oldpwd '$PWD'" }
  change-directory-current-buffer
  execute-keys :edit<space>
  hook -group oldpwd global BufCreate .* %{
    change-directory "%opt{oldpwd}"
    remove-hooks global oldpwd
  }
  # on cancelled edit prompt
  hook -group oldpwd global RawKey <esc> %{
    change-directory "%opt{oldpwd}"
    remove-hooks global oldpwd
  }
}

# Suggested mappings

#map global goto d '<esc>:change-directory-current-buffer<ret>' -docstring 'current buffer dir'
#map global goto r '<esc>:change-directory-project-root<ret>' -docstring 'project root dir'
#map global goto p '<esc>:cd ..;print-working-directory<ret>' -docstring 'parent dir'
#map global user e ':edit-current-buffer-directory<ret>' -docstring 'edit in current buffer dir'

# Suggested aliases

#alias global cdd change-directory-current-buffer
#alias global cdr change-directory-project-root
#alias global pwd print-working-directory
#alias global ecd edit-current-buffer-directory
