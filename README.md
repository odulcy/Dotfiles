# Dotfiles

Here are my dotfiles for my 13-inch HP Spectre x360 (2017).

- Operating System : ``Arch Linux``
- Window Manager : ``i3``
- Bar : ``polybar``
- Web browser : ``Firefox``
- Terminal : ``xfce4-terminal``
- Others : ``picom``, ``bashtop``

# Screenshot

![Screenshot1](/Screenshot_1.png?raw=true "My workspace")
![Screenshot2](/Screenshot_2.png?raw=true "My workspace")

# Requirements

If you are on a fresh install on Arch, use :

```bash
sudo pacman -S xorg-xinit xorg-server xorg-xrandr i3-gaps ttf-dejavu git base-devel dmenu ttf-ubuntu-font-family ttf-font-awesome python-pip archlinux-keyring xfce4-terminal firefox feh imagemagick xorg-xprop
```

Then,

```bash
sudo pacman -S base-devel xorg-fonts-misc
git clone https://aur.archlinux.org/polybar
git clone https://aur.archlinux.org/siji-git
git clone https://aur.archlinux.org/ttf-unifont
git clone https://aur.archlinux.org/nerd-fonts-ubuntu-mono
```

and you need to ``makepkg -si`` in each folder.

# Installations

```bash
cd Dotfiles/
cp -r i3 polybar picom ~/.config/
```

# To-Do

- Add a ``.vimrc``
- Customize ``PS1``


# Credits

My dotfiles are highly inspired from [Derek Taylor's dotfiles](https://gitlab.com/dwt1/dotfiles).

I also used [this GitHub repository for Spotify](https://github.com/Jvanrhijn/polybar-spotify).

# Licence

The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
