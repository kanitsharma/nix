set fish_greeting

# starship init fish | source
mcfly init fish | source

# Direnv
set -x DIRENV_LOG_FORMAT

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test "$KITTY_AUTOSTART" = "next"
        fish -c 'yarn dev; fish'
    end
    if test "$KITTY_AUTOSTART" = "golang"
        fish -c 'go run .; fish'
    end

end
# source ~/.iterm2_shell_integration.fish