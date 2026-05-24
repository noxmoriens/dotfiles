if status is-interactive
end

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

function setup_user_path
    set -gx ANDROID_HOME $HOME/Android/Sdk
    set -gx ANDROID_SDK_ROOT $ANDROID_HOME
    set -gx PATH $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $PATH

    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.bun/bin
    fish_add_path ~/.flutter/bin
    # this for personal packages
    fish_add_path /opt/pkgs/bin
end

function setup_aliases

    if command -q nvim
        alias v="nvim"
    end

    if command -q distrobox
        alias dc="distrobox create"
        alias de="distrobox enter"
        alias ds="podman kill"
    end
    
    if command -q fnm
        fnm env --use-on-cd --shell fish | source
    end

    if command -q tmux
        alias tm="tmux"
        alias tma="tmux attach"
    end

    if command -q bat
        alias cat="bat --paging=never --style=plain --color=auto"
    end

    if command -q eza
        # alias ll="eza --git --git-repos --icons --long --header --smart-group"
        # alias ls="eza --git --git-repos --icons --smart-group"
        alias ll="eza --icons --long --header --smart-group"
        alias ls="eza --icons --long --smart-group"
    end

    if command -q exa
        alias ll="exa --git --git-repos --icons --long --header --smart-group"
        alias ls="exa --git --git-repos --icons --smart-group"
    end
end

function starship_transient_prompt_func
    starship module character
end

function fish_greeting
    setup_user_path
    setup_aliases
    if command -q starship
        starship init fish | source
        enable_transience
    end
    if command -q zoxide
        zoxide init fish | source
    end
    if command -q fzf 
        fzf --fish | source
    end
    if command -q fastfetch
        fastfetch
    end
end

fish_add_path /home/bluespada/.spicetify


# Added by Antigravity CLI installer
set -gx PATH "/home/bluespada/.local/bin" $PATH
