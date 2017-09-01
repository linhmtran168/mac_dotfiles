# name: scorphish

function _prompt_rubies -a sep_color -a ruby_color -d 'Display current Ruby (rvm/rbenv)'
  [ "$theme_display_ruby" = 'no' ]; and return
  set -l ruby_version
  if type rvm-prompt >/dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type rbenv >/dev/null 2>&1
    set ruby_version (rbenv version-name)
  end
  [ -z "$ruby_version" ]; and return

  echo -n -s $sep_color '|' $ruby_color 'rb:'(echo -n -s $ruby_version | cut -d- -f2-)
end

function _prompt_virtualfish -a sep_color -a venv_color -d "Display activated virtual environment (only for virtualfish, virtualenv's activate.fish changes prompt by itself)"
  [ "$theme_display_virtualenv" = 'no' ]; and return
  echo -n -s $sep_color '|' $venv_color 'py:'$PYTHON_VERSION
  [ -n "$CURRENT_CONDA_ENV" -o -n "$PYTHON_DIST" ]; and echo -n -s '@'(basename "$PYTHON_DIST:$CURRENT_CONDA_ENV")
end

function _prompt_rust -a sep_color -a rust_color -d "Display current activated Rust"
  [ "$theme_display_rust" != 'yes' ]; and return
  echo -n -s $sep_color '|' $rust_color 'rs:'(rustc --version | cut -d\  -f2)
end

function _prompt_nvm -a sep_color -a nvm_color -d "Display current activated Node"
  [ "$theme_display_nvm" != 'yes' -o -z "$NVM_VERSION" ]; and return
  echo -n -s $sep_color '|' $nvm_color 'js:'$NVM_VERSION
end

function _prompt_whoami -a sep_color -a whoami_color -d "Display user@host if on a SSH session"
  if set -q SSH_TTY
    echo -n -s $whoami_color (whoami)@(hostname) $sep_color '|'
  end
end

function fish_prompt
  set -l exit_code $status

  set -l gray (set_color 666)
  set -l blue (set_color blue)
  set -l red (set_color red)
  set -l normal (set_color normal)
  set -l yellow (set_color ffcc00)
  set -l orange (set_color ffb300)
  set -l green (set_color green)
  set -l ltgreen (set_color 689f38)

  set_color -o 666
  printf '['

  _prompt_whoami $gray $green

  set_color -o cyan
  printf '%s' (prompt_pwd)
  set_color -o bryellow
  printf ' λ '

  _prompt_rubies $gray $red

  if [ "$PYTHON_DIST" != "$LAST_PYTHON_DIST" -o "$CONDA_DEFAULT_ENV" != "$LAST_CONDA_ENV" -o -z "$PYTHON_VERSION" ]
    set -gx PYTHON_VERSION (python --version 2>&1 | cut -d\  -f2)
    set -gx LAST_PYTHON_DIST $PYTHON_DIST
    if [ -n "$PYTHON_DIST" -a -z "$CONDA_DEFAULT_ENV" ]
      set -gx CURRENT_CONDA_ENV 'root'
    else
      set -gx CURRENT_CONDA_ENV $CONDA_DEFAULT_ENV
    end
    set -gx LAST_CONDA_ENV $CONDA_DEFAULT_ENV
  end

  _prompt_virtualfish $gray $ltgreen

  _prompt_rust $gray $orange

  if [ "$NVM_BIN" != "$LAST_NVM_BIN" -o -z "$NVM_VERSION" ]
    set -gx NVM_VERSION (node --version)
    set -gx LAST_NVM_BIN $NVM_BIN
  end

  _prompt_nvm $gray $green

  set_color -o 666
  if set -q SCORPHISH_GIT_INFO_ON_FIRST_LINE
    printf ']'
  else
    printf ']\n'
  end

  # Git
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 
  
  __fish_git_prompt " (%s)"

  if test $exit_code -ne 0
    set arrow_colors 600 900 c00 f00
  else
    set arrow_colors e0f2f1 b2dfdb 80cbc4 4db6ac
  end

  if set -q SCORPHISH_GIT_INFO_ON_FIRST_LINE
    printf '\n'
  else
    printf ' '
  end

  for arrow_color in $arrow_colors
    set_color $arrow_color
    printf '❯'
  end

  printf ' '

  set_color normal
end
