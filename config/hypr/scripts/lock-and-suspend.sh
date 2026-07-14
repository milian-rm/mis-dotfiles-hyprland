#!/bin/bash
hyprlock &
LOCK_PID=$!
sleep 300
if kill -0 $LOCK_PID 2>/dev/null; then
    systemctl suspend
fi
