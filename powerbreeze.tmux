#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-option -g status on                                 # enable status bar
tmux set -g status-interval 1                                # update status bar every sec
tmux set -g status-justify centre                            # center the window list
tmux set-option -g status-style bg=colour237,fg=black        # status bar colors
tmux set -g window-status-separator " "                      # single space window separator
tmux set -g status-left-length 48
tmux set -g status-right-length 48

_tmux_win_stat_fmt='#[fg=colour237,bg=black]#[fg=green,bg=black]#{?pane_synchronized, *,} #I  #W #{?pane_synchronized,* ,}#[fg=colour237,bg=black]'
_tmux_win_stat_curr_fmt='#[fg=green,bg=colour237]#[fg=black,bg=green] #{?pane_synchronized,* ,}#I  #W#{?pane_synchronized, *,} #[fg=green,bg=colour237]'
_tmux_status_left='#[fg=colour237,bg=red] #H #[fg=red,bg=colour237] #[fg=colour237,bg=red] #S #[fg=red,bg=colour237] #[fg=colour237,bg=red] #I:#P #[fg=red,bg=colour237]'
_tmux_status_right='#[fg=blue,bg=colour237]#[fg=colour237,bg=blue] %H:%M #[fg=colour237,bg=blue]#[fg=blue,bg=colour237] #[fg=colour237,bg=blue] %a %d %b #[fg=colour237,bg=blue]'

tmux set -g status-left "$_tmux_status_left"                                           # left status style and content
tmux set -g status-right "$_tmux_status_right"                                         # right status style and content : time and date
tmux set-window-option -g window-status-format "$_tmux_win_stat_fmt"                   # inactive window list style and content
tmux set-window-option -g window-status-current-format "$_tmux_win_stat_curr_fmt"      # active window list style and content
tmux set -g pane-active-border-style 'fg=red'                                          # active window border is set to a red line
