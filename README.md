# Dotfiles
My arch linux bspwm gruvbox rice.

## Screenshots

## Included configs
  - `bspwm`
  - `polybar`
  - `kitty`
  - `zsh`
  - `p10k`
  - `tmux`
  - `neovim`
  - `rofi`
  - `GTK-(2,3,4)`
  - `etc.`

# Misc

[`nix/`](https://github.com/LaPepega/dotfiles/blob/main/nix) - my former NixOS config, but I no longer use nor maintain it.

[`.config/wallpaper.png`](https://github.com/LaPepega/dotfiles/blob/main/.config/wallpaper.png) - wallpaper made by me ( yes it's a Murder Drones reference )

[`scripts/combio.sh`](https://github.com/LaPepega/dotfiles/blob/main/scripts/combio.sh) - a script I use to set up a `pulseaudio` output sink that combines my system sound and my mic's input. Useful for streaming on discord or element ( or any other program that doesn't support X11 sound streaming properly ).

# Installation

## Script
[`scripts/install.sh`](https://github.com/LaPepega/dotfiles/blob/main/scripts/install.sh) symlinks all hidden files from the root dir to `$HOME/` and all hidden files and dirs from [`.config/`](https://github.com/LaPepega/dotfiles/blob/main/.config) to `$HOME/.config/` with ***no excptions***, so be carefull.

Figuring out and installing required packages is on you for now, although later I may add a requirements list and/or a `pacman` script.

## Manual
Just copy all the configs to their according paths. Or do whatever with them, I'm not your mom.
