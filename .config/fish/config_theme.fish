# TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 364A82
    set -l comment 565f89
    set -l tkn_red f7768e
    set -l tkn_orange ff9e64
    set -l tkn_yellow e0af68
    set -l tkn_green 9ece6a
    set -l tkn_purple 9d7cd8
    set -l tkn_cyan 7dcfff
    set -l tkn_pink bb9af7

# Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $tkn_cyan
    set -g fish_color_keyword $tkn_pink
    set -g fish_color_quote $tkn_yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $tkn_orange
    set -g fish_color_error $tkn_red
    set -g fish_color_param $tkn_purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $tkn_green
    set -g fish_color_escape $tkn_pink
    set -g fish_color_autosuggestion $comment

# Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $tkn_cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
      
