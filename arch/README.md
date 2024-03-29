# Arch

Here are my dotfiles for my 13-inch HP Spectre x360 (2017).

- Operating System : ``Arch Linux``
- Window Manager : ``i3``
- Bar : ``polybar``
- Web browser : ``Firefox``
- Terminal : ``alacritty``
- Others : ``picom``, ``bashtop``

# Screenshot

![Screenshot1](Screenshot_1.png?raw=true "My workspace")
![Screenshot2](Screenshot_2.png?raw=true "My workspace")

# Requirements

If you are on a fresh install on Arch, use :

```bash
sudo pacman -S xorg-xinit xorg-server xorg-xrandr i3-gaps ttf-dejavu git base-devel dmenu ttf-ubuntu-font-family ttf-font-awesome python-pip archlinux-keyring alacritty firefox feh imagemagick xorg-xprop
```

Then,

```bash
sudo pacman -S base-devel xorg-fonts-misc
git clone https://aur.archlinux.org/polybar
git clone https://aur.archlinux.org/siji-git
git clone https://aur.archlinux.org/ttf-unifont
git clone https://aur.archlinux.org/nerd-fonts-ubuntu-mono
git clone https://aur.archlinux.org/pod2man
git clone https://aur.archlinux.org/lemonbar-xft-git "Optional, if you want to use lemonbar instead of polybar
```

and you need to ``makepkg -si`` in each folder.

# Installations

```bash
cd Dotfiles/
cp -r i3 polybar picom alacritty ~/.config/
```

You also need to compile ``succade`` and copy the binary in ``.config/succade/``
Please visit [succade repository](https://github.com/domsson/succade).

# Others
## Firefox

To have a precise scrolling on Firefox like on Chromium,
you can add this environment variable :

```bash
# ~/.bash_profile
export MOZ_USE_XINPUT2=1
```

To have firefox in full screen inside an i3 container,
go to Firefox options (visit ``about:config``) then
modify this option :
```
full-screen-api.ignore-widgets : True
```

## Touchpad

```bash
sudo pacman -S xf86-input-synaptics
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
```

Edit ``/etc/X11/xorg.conf.d/70-synaptic.conf``

```bash
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "synaptics"
        MatchIsTouchpad "on"

	# For natural scrolling
	Option "VertScrollDelta"  "-111"
	Option "HorizScrollDelta" "-111"

	# Tap to click
	Option "TapButton1" "1"

	# Two finger tap to Right click
	Option "TapButton2" "3"
EndSection
```

## Arch in a VM

This configuration also works in a Virtual Machine with Arch as guest OS on Proxmox.
You can use it through SPICE by installing few more things :

```bash
sudo pacman -S qemu-guest-agent spice-vdagent
sudo systemctl enable qemu-guest-agent
```

At the time of writing, there is no spice-vdagent service working with systemd.
spice-vdagent is started by i3. Also, GNOME is the only Desktop Environment
with  autoresize for Remote Viewer. A bindsym has been added to the i3
config file to trigger an autoresize.
To enable both features, please uncomment those lines at the end of the config file :

```bash
#### spice-vdagent
#exec_always --no-startup-id spice-vdagent
#bindsym $mod+Shift+t exec xrandr --output Virtual-1 --auto
```

# Credits

My dotfiles are highly inspired from [Derek Taylor's dotfiles](https://gitlab.com/dwt1/dotfiles).

I also used [this GitHub repository for Spotify](https://github.com/Jvanrhijn/polybar-spotify).

# Licence

The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
