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

These scripts can are used in waybar and hyprland to control certian programs or parts of the system. Some information about them is included in each script

To use them, sym-link them into your path, like /etc/local/bin or copy the folder to /opt and sym-link from there. The file owner and permissions cannot be root.
If you don't want to use these scripts, look in hyprland.conf to see alternative commands underneath. For waybar use it's built in modules instead.
