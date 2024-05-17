# Dot files directory

### Dependencies

- git: pacman -S git
- GNU stow: pacman -S stow
- neovim: pacman -S neovim


### Usage

Clone directory in home folder

``` git clone https://github.com/MIchael-Kik/dotfiles.git ```

then move to and use GNU stow to create sym-links

```mv ./dotfiles```
```stow .``` 

### Wayland-scripts

These scripts can are used in waybar and hyprland to control certian programs or parts of the system. Dependencies are listed in each file

Place the folder or files into your path to use them. otherwise modify the rest of the dotfiles to not use them.
