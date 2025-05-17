#/bin/bash

# This ensures full paths for symlinks
cd ..;

for homefile in .*; do
    if [ -f "$homefile" ]; then
        ln -s "$(pwd)/$homefile" "$HOME/$homefile";
    fi
done

for conffile in .config/*; do
    ln -s "$(pwd)/.config/$conffile" "$HOME/.config/$conffile";
done
