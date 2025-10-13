# 🚀 Arch Linux Hyprland Dotfiles

> **BTW, I use Arch.** And you're about to, too. 😎

This is my minimal yet powerful Arch Linux + Hyprland rice, optimized for the ASUS ROG Zephyrus G14 2021. Less bloat, more aesthetics. Because why settle for a boring desktop when you can spend 47 hours configuring it to look cool?

## 📋 What's Inside

The essentials for a chad Arch setup:

- **Window Manager**: Hyprland (because Wayland is the future, deal with it)
- **Status Bar**: Waybar (stolen config, but make it ✨ yours ✨)
- **Terminal**: Ghostty with transparency (so everyone knows you're a hacker)
- **Shell**: Zsh + Zinit + Oh-My-Posh (the holy trinity)
- **Launcher**: Wofi (simple and works™)
- **Editor**: Neovim (vim but neovim, obviously)
- **Multiplexer**: Tmux (for when you need more terminal)
- **Theme**: Catppuccin Mocha (the only correct colorscheme)

## 🛠 Core Components

### Hyprland Ecosystem
- **Lock Screen**: Hyprlock (pretty lock screen go brr)
- **Idle Management**: Hypridle (saves battery while you browse Reddit)
- **Wallpaper**: Hyprpaper (because dynamic wallpapers are overrated)
- **Logout Menu**: Wlogout (for when you actually want to shut down)

### Development Setup
- **Terminal**: Ghostty (GPU-accelerated, blazingly fast™)
- **Shell**: Zsh with Zinit (plugins that actually work)
- **Prompt**: Oh-My-Posh zen theme (minimal but informative)
- **Editor**: Neovim with LSP (because I'm not a masochist, just pretending)
- **Multiplexer**: Tmux (inspired by Dreams of Code)
- **Version Control**: Git with sexy aliases
- **Node.js**: NVM (switching versions like a pro)
- **Navigation**: Zoxide + FZF (cd but smarter)

### G14 2021 Specific
- **ASUS Tools**: asusctl + supergfxctl + ROG Control Center
- **GPU Switching**: NVIDIA/AMD hybrid graphics (actually works!)
- **Power Profiles**: Performance/Balanced/Quiet modes via ROG key
- **Audio**: PipeWire (because PulseAudio is so 2019)

## 📦 Installation Guide

> **Disclaimer**: This assumes you've already survived the Arch installation process. If you haven't, see you in 6 hours after reading the wiki.

### 1. Install AUR Helper (yay)

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

### 2. Install All The Things™

```bash
# Hyprland + friends
sudo pacman -S hyprland waybar wofi ghostty neovim tmux

# Shell goodness
sudo pacman -S zsh fzf zoxide

# Development
sudo pacman -S git nodejs npm python python-pip go

# Utilities
sudo pacman -S firefox dolphin pavucontrol brightnessctl playerctl

# AUR packages (the real Arch experience)
yay -S oh-my-posh-bin hyprshot wlogout
```

### 3. G14 Laptop Superpowers

```bash
# ASUS ROG tools (makes your laptop not suck on Linux)
yay -S asusctl supergfxctl rog-control-center

# Enable the magic
sudo systemctl enable --now supergfxd
sudo systemctl enable --now power-profiles-daemon
```

### 4. Clone These Dotfiles

```bash
# Clone this repo
cd ~
git clone https://github.com/yourusername/arch-dotfiles-btw.git
cd arch-dotfiles-btw

# YOLO copy everything
cp -r .config/* ~/.config/
cp .zshrc ~/

# Waybar is a separate repo inside this repo (yes, really)
cd ~/.config/waybar
git pull  # or just accept the chaos
```

### 5. Shell Setup

```bash
# Switch to zsh (the superior shell)
chsh -s $(which zsh)

# Log out and back in, or just:
zsh

# First run will auto-install Zinit and all plugins (magic!)
# Install a nerd font for icons
oh-my-posh font install JetBrainsMono
```

### 6. Node.js Version Manager

```bash
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install latest Node
nvm install node
```

### 7. Neovim

```bash
# Just open it, lazy.nvim will handle the rest
nvim

# Wait for plugins to install (grab a coffee)
```

## ⚙️ Configuration Highlights

### Hyprland
- **Animations**: Buttery smooth bezier curves (because we're fancy)
- **Workspaces**: 10 workspaces, SUPER key your way through them
- **Window Nav**: Vim bindings (hjkl) because mouse is for normies
- **Screenshots**: Hyprshot with clipboard support (SUPER+SHIFT+S)
- **Lock Screen**: Hyprlock with Catppuccin vibes

### G14 2021 Optimizations

#### Hardware Support
- **Display**: 144Hz QHD display optimization
- **Graphics**: Hybrid NVIDIA/AMD graphics switching
- **Audio**: Dolby Atmos speaker configuration
- **Keyboard**: RGB backlight control via ASUS tools
- **Power**: Performance profile switching with ASUS ROG key

#### Key Bindings (G14 Specific)
- **ROG Key**: `XF86Launch1` - Cycle performance profiles
- **Fn + F1/F2**: Audio volume control
- **Fn + F3**: Microphone mute toggle
- **Fn + F7/F8**: Display brightness control
- **Fn + F9/F10**: Keyboard backlight control

### Waybar
Modular Waybar config stolen from the internet and customized:
- **Modules**: Clock, workspaces, window title, media player, system stats
- **Theme**: Custom CSS with Catppuccin colors
- **Separate Git Repo**: Because it's actually a nested submodule (organization? what's that?)

### Ghostty Terminal
```toml
font-family = "JetBrainsMono Nerd Font"
theme = "catppuccin-mocha"
window-padding-x = 10
window-padding-y = 10
background-opacity = 0.95
```
- GPU-accelerated (your terminal renders at 144fps, deal with it)
- Transparent background + Hyprland blur = aesthetic
- Smooth scrolling and ligature support
- Fast startup because Rust things

### Zsh Configuration
- **Plugin Manager**: Zinit (auto-installs on first run)
- **Plugins**:
  - zsh-syntax-highlighting (pretty colors)
  - zsh-autosuggestions (mind reading)
  - zsh-completions (tab go brr)
  - fzf-tab (fuzzy everything)
- **Aliases**: Git shortcuts for the lazy (me)
- **History**: 5000 commands because I never remember anything

## 🎨 Theming

**Catppuccin Mocha everywhere.** Yes, everywhere. Terminal, editor, status bar, lock screen, even your mom's laptop.

```
Base:   #1e1e2e  (dark but not too dark)
Accent: #33ccff / #00ff99  (cyan/green gradient because yes)
Text:   #cdd6f4  (easy on the eyes at 3am)
```

**Visual Flex:**
- Animated gradient borders (watch them shimmer)
- Transparent windows with blur (fake depth perception)
- Consistent color scheme (OCD approved)
- Smooth animations that make Windows 11 jealous

## 🔧 Customization

### File Structure
```
~/.config/
├── hypr/
│   ├── hyprland.conf          # Main config
│   ├── hyprland/              # Split configs (binds, rules, etc)
│   ├── hyprlock.conf          # Lock screen
│   ├── hypridle.conf          # Idle management
│   ├── hyprpaper.conf         # Wallpaper
│   └── mocha.conf             # Color scheme
├── waybar/                     # Status bar (separate git repo)
├── ghostty/                    # Terminal config
├── nvim/                       # Neovim config
├── tmux/                       # Tmux config
├── wofi/                       # App launcher
├── wlogout/                    # Logout menu
└── ohmyposh/                   # Shell prompt theme

~/.zshrc                        # Shell configuration
```

### Quick Tweaks
- **Keybindings**: `~/.config/hypr/hyprland/binds.conf`
- **Colors**: `~/.config/hypr/mocha.conf`
- **Waybar modules**: `~/.config/waybar/config.jsonc`
- **Terminal**: `~/.config/ghostty/config`
- **Shell aliases**: `~/.zshrc`

## 🔍 Troubleshooting

### "It doesn't work"

**NVIDIA being NVIDIA:**
```bash
lsmod | grep nvidia  # Are the drivers even loaded?
nvidia-smi           # Is the GPU alive?
```

**No sound:**
```bash
systemctl --user restart pipewire wireplumber
# Have you tried turning it off and on again?
```

**G14 function keys don't work:**
```bash
sudo systemctl enable --now asusd
asusctl -h  # Read the docs (I know, crazy)
```

**Laptop is on fire:**
```bash
asusctl profile -p Quiet  # Set to Quiet mode
sudo tlp-stat -b          # Check battery stats
# Maybe close Chrome?
```

**Zinit won't install:**
```bash
rm -rf ~/.local/share/zinit
zsh  # It'll reinstall automatically
# Magic!
```

## 🎯 Key Features

### What Makes This Setup Special?

1. **Actually Works on G14 2021**
   - Hybrid graphics that doesn't crash
   - Function keys that do things
   - Battery life that doesn't suck
   - ROG key that cycles performance modes

2. **Modern Tools**
   - Wayland (X11 is so 2015)
   - Ghostty terminal (Rust go brr)
   - Zinit (faster than oh-my-zsh)
   - FZF + Zoxide (never `cd` normally again)

3. **Quality of Life**
   - Transparent terminals with blur
   - Smooth 144Hz animations
   - Auto-installing everything
   - Git aliases for the lazy

4. **Aesthetic AF**
   - Catppuccin Mocha everywhere
   - Gradient animated borders
   - Clean minimal Waybar
   - Oh-My-Posh zen theme

## 📚 Resources

### Learning
- [Hyprland Wiki](https://wiki.hyprland.org/) - RTFM
- [Arch Wiki](https://wiki.archlinux.org/) - Your new Bible
- [r/unixporn](https://reddit.com/r/unixporn) - For inspiration/jealousy

### Credits
- **Hyprland Community** - The compositor gods
- **Catppuccin** - The only theme you'll ever need
- **Dreams of Code** - Tmux config inspo
- **ASUS Linux Community** - Making G14 usable on Linux
- **Stack Overflow** - For when things break (they will)

---

## 🚨 Important Notes

### Known Issues
- **Waybar is a git submodule** - Yes, it's a repo inside a repo. Don't ask why.
- **waystt folder** - It exists. Contains env example. Probably useless. Too afraid to delete it.
- **First boot will be slow** - Zinit, NVM, and Neovim plugins all auto-install. Be patient.
- **NVIDIA drivers** - Will probably break after a kernel update. Welcome to Arch.

### TODO (maybe someday)
- [ ] Clean up waybar submodule situation
- [ ] Figure out what waystt is for
- [ ] Write proper installation script
- [ ] Take a screenshot for this README
- [ ] Actually document the Neovim config

---

## 💀 Final Words

If you made it this far, congratulations. You're either:
1. Actually setting this up
2. Procrastinating
3. Lost

Either way, enjoy your new rice. Remember: the setup is never truly done. There's always one more tweak, one more plugin, one more color to adjust.

**Happy ricing!** 🎨✨

*P.S. BTW, I use Arch.*

---

<div align="center">

**Made with ☕ and poor life choices**

*This setup represents countless hours of tweaking, breaking, fixing, and definitely not working on actual projects.*

</div>

