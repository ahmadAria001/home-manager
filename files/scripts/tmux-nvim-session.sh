#!/bin/bash

# Start a new tmux session named "my-session"
tmux new-session -d -s my-session

# Split the window vertically (60%-40%)
tmux split-window -h -p 40

# Run the command in the right pane
tmux send-keys -t my-session:0.1 'fzf --preview="bat {}"' C-m

# Select the left pane by default
tmux select-pane -t my-session:0.0

# Attach to the session
tmux attach-session -t my-session
