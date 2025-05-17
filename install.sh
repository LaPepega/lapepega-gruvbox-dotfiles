#/bin/bash

for dfile in .*; do
    if [ -f "$dfile" ]; then
        ln -s "$(pwd)/$dfile" "$HOME/.config/$dfile";
    fi
done
