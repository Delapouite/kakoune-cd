def change-directory-current-buffer -docstring 'cd to current buffer dir' %{ %sh{
  buffer_dirname=$(dirname "${kak_bufname}")
  echo "cd $buffer_dirname"
}}

# only works for git now, use `hg root` for mercurial
def change-directory-project-root -docstring 'cd to project root dir' %{ %sh{
  project_root=$(git rev-parse --show-toplevel)
  echo "cd $project_root"
}}

def print-working-directory -docstring 'print working directory' %{ %sh{
  echo "echo $PWD"
}}

decl -hidden str oldpwd

def edit-current-buffer-directory -docstring 'edit in current buffer dir' %{
  %sh{ echo "set global oldpwd '$PWD'" }
  change-directory-current-buffer
  exec :edit<space>
  hook -group oldpwd global BufCreate .* %{
    cd "%opt{oldpwd}"
    rmhooks global oldpwd
  }
  # on cancelled edit prompt
  hook -group oldpwd global RawKey <esc> %{
    cd "%opt{oldpwd}"
    rmhooks global oldpwd
  }
}

# Suggested mappings

#map global goto d '<esc>:change-directory-current-buffer<ret>' -docstring 'current buffer dir'
#map global goto r '<esc>:change-directory-project-root<ret>' -docstring 'project root dir'
#map global user e ':edit-current-buffer-directory<ret>' -docstring 'edit in current buffer dir'

# Suggested aliases

#alias global cdd change-directory-current-buffer
#alias global cdr change-directory-project-root
#alias global pwd print-working-directory
#alias global ecd edit-current-buffer-directory
