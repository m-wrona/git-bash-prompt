git-bash-prompt
===============

Bash prompt for giving detail information about status of current git repository. <br>
Script extends PS1 variable preserving user's settings.

Description
===============

Script distinguishes two states:

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


Samples
===============

 * michal@wrona:~/git-bash-prompt(master ✔)$
 * michal@wrona:~/git-bash-prompt(feature-branch,↓ 1, ✚ 3, ● 8, ✖ 2)$
 * michal@wrona:~/git-bash-prompt(other-branch, ⚑ 1)$


Installation
===============

1) git clone {repository} <br>
2) cd {repository} <br>
3) $source install.sh <br>
