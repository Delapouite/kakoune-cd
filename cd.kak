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

# Suggested mappings

#map global goto d '<esc>:change-directory-current-buffer<ret>' -docstring 'current buffer dir'
#map global goto r '<esc>:change-directory-project-root<ret>' -docstring 'project root dir'

# Suggested aliases

#alias global cdd change-directory-current-buffer
#alias global cdr change-directory-project-root
#alias global pwd print-working-directory
