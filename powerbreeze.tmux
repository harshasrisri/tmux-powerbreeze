#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-option -g status on                                 # enable status bar
tmux set -g status-interval 1                                # update status bar every sec
tmux set -g status-justify centre                            # center the window list
tmux set-option -g status-style bg=black                     # status bar colors
tmux set -g window-status-separator " "                      # single space window separator
tmux set -g status-left-length 48
tmux set -g status-right-length 48

_tmux_win_stat_fmt='#[fg=black,bg=black]#[fg=cyan,bg=black]#{?pane_synchronized, *,} #I  #W #{?pane_synchronized,* ,}#[fg=black,bg=black]'
_tmux_win_stat_curr_fmt='#[fg=cyan,bg=black]#[fg=black,bg=cyan] #{?pane_synchronized,* ,}#I  #W#{?pane_synchronized, *,} #[fg=cyan,bg=black]'
_tmux_status_left='#[fg=black,bg=yellow] #H #[fg=yellow,bg=black]#[fg=black,bg=orange] #S #[fg=orange,bg=black]#[fg=black,bg=red] #I:#P #[fg=red,bg=black]'
_tmux_status_right='#[fg=green,bg=black]#[fg=black,bg=green] %H:%M #[fg=black,bg=green]#[fg=yellow,bg=black]#[fg=black,bg=yellow] %a %d %b #[fg=black,bg=yellow]'

tmux set -g status-left "$_tmux_status_left"                                           # left status style and content
tmux set -g status-right "$_tmux_status_right"                                         # right status style and content : time and date
tmux set-window-option -g window-status-format "$_tmux_win_stat_fmt"                   # inactive window list style and content
tmux set-window-option -g window-status-current-format "$_tmux_win_stat_curr_fmt"      # active window list style and content
tmux set -g pane-active-border-style 'fg=red'                                          # active window border is set to a red line
