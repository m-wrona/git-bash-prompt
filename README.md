git-bash-prompt
===============

Bash prompt for giving detail information about status of current git repository. <br>
Script extends PS1 variable preserving user's settings.

Description
===============

Script distinguish two states:

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

Script displays only information about found changes thus empy statuses are skipped ({nr}=0). 


Installation
===============

1) git clone {repository} <br>
2) cd {repository} <br>
3) $install.sh <br>
