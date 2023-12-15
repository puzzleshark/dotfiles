#!/bin/bash
if [ -z "$NVIM" ]; then
    nvim "$@"
else
    nvr --remote-wait "$@"
fi
