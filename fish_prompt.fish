# name: eclm
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l grey (set_color grey)
  set -l normal (set_color normal)

  set -l name (hostname -f | cut -d. -f1)
  set -l uid (id -u)
  set -l hostname

  if [ $uid = '0' ]
      set hostname "$red$name "
  else
      set hostname "$blue$name "
  end

  set -l time_is (date +%T)
  set time "$normal$grey$time_is "

  if test $last_status = 0
      set arrow "$green➜ "
  else
      set arrow "$red➜ "
  end
  set -l cwd $normal(basename (prompt_pwd))

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$blue ($red$git_branch$blue)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$blue ($git_branch)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $hostname $time $cwd $git_info $normal ' ' $arrow ' '
end

