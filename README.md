git-bash-prompt
===============

Bash prompt for giving detail information about status of current git repository.
Tool extends PS1 variable preserving user's settings.

Description
===============

Tool distinguish two states:

  * clean repository (no changes found): ({branch} ✔)
  * repository where changes are found:  ({branch},↑ {nr},↓ {nr},✚ {nr},● {nr},✖ {nr},? {nr},⚑ {nr})
  
where:

  * {branch}: name of the current branch
  * ↑: local branch is ahead of origin branch
  * ↓: local branch is behind origin branch
  * ✚: added files
  * ●: modified or renamed files
  * ✖: removed files
  * ?: untracked files
  * ⚑: number of stashed changes
  * {nr}: number of changes

Tool displays only information about found changes thus empy statuses are skipped ({nr}=0). 


Installation
===============

1) git clone {repository}

2) cd {repository}

3) $install.sh
