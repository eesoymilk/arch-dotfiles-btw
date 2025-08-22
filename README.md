# 🚀 Arch Linux Hyprland Setup Guide - G14 2021 Edition

> This is a complete guide to recreate my Arch Linux Hyprland desktop environment optimized for the ASUS ROG Zephyrus G14 2021 laptop.

## 📋 Overview

This setup provides a modern, beautiful, and efficient desktop environment featuring:

- **Window Manager**: Hyprland (Wayland compositor)
- **Status Bar**: Waybar with custom configuration
- **Terminal**: Ghostty with transparent background and modern features
- **Shell**: Zsh with Oh-My-Posh and modern plugins
- **Application Launcher**: Wofi
- **Editor**: Neovim with extensive plugin configuration
- **Theme**: Catppuccin Mocha throughout

## 🛠 Core Components

### System Management
- **Display Manager**: Hyprland native
- **Lock Screen**: Hyprlock
- **Idle Management**: Hypridle
- **Screenshots**: Hyprshot
- **Audio**: PipeWire + PulseAudio compatibility
- **Power Management**: TLP + powertop
- **GPU**: NVIDIA + AMD hybrid graphics support

### Development Environment
- **Editor**: Neovim with LSP support
- **Terminal**: Ghostty with advanced features and GPU acceleration
- **Shell**: Zsh with Zinit plugin manager
- **Prompt**: Oh-My-Posh with zen theme
- **Version Control**: Git with custom aliases
- **Node.js**: NVM for version management

## 📦 Installation Guide

### 1. Base Arch Installation

```bash
# After base Arch installation, install essential packages
sudo pacman -S git base-devel
```

### 2. Install AUR Helper

```bash
# Install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

### 3. Install Core Packages

```bash
# Hyprland ecosystem
sudo pacman -S hyprland waybar wofi ghostty neovim

# Development tools
sudo pacman -S git nodejs npm python python-pip go

# Media and utilities
sudo pacman -S firefox dolphin pavucontrol brightnessctl playerctl

# AUR packages
yay -S oh-my-posh-bin hyprshot wlogout
```

### 4. G14 Specific Packages

```bash
# ASUS G14 specific tools
yay -S asusctl supergfxctl rog-control-center

# Enable services
sudo systemctl enable supergfxd
sudo systemctl enable power-profiles-daemon
```

### 5. Clone and Setup Dotfiles

```bash
# Clone this repository
git clone <your-repo-url> ~/arch-dotfiles-btw
cd ~/arch-dotfiles-btw

# Copy configurations
cp -r .config/* ~/.config/
cp .zshrc ~/
```

### 6. Shell Setup

```bash
# Change default shell to zsh
chsh -s $(which zsh)

# Install Zinit (will auto-install on first zsh run)
# Zinit will automatically install zsh plugins on first run

# Install Oh-My-Posh themes
oh-my-posh font install JetBrainsMono
```

### 7. Neovim Setup

```bash
# Neovim will auto-install plugins using lazy.nvim on first run
nvim
```

## ⚙️ Configuration Details

### Hyprland Features
- **Animations**: Custom bezier curves for smooth transitions
- **Workspace Management**: 10 workspaces with SUPER key bindings
- **Window Management**: Vim-like navigation (hjkl)
- **Screenshots**: Region and window capture with clipboard support
- **Lock Screen**: Hyprlock with custom styling

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

### Waybar Configuration
- **Left**: Workspaces, media player info
- **Center**: Clock with date
- **Right**: Power profiles, audio, network, battery, system tray

### Ghostty Terminal Configuration
- **Font**: JetBrains Mono Nerd Font
- **Theme**: Catppuccin Mocha
- **Transparency**: 95% opacity with Hyprland blur
- **Padding**: Optimized for readability
- **GPU Acceleration**: Hardware-accelerated rendering
- **Modern Features**: Ligature support, smooth scrolling
- **Keybindings**: Custom shift+enter for newlines
- **Performance**: Fast startup and low resource usage

## 🎨 Theming

### Catppuccin Mocha Palette
The entire setup uses the Catppuccin Mocha color scheme:
- **Base**: `#1e1e2e`
- **Accent**: `#33ccff` / `#00ff99`
- **Text**: `#cdd6f4`

### Custom Styling
- **Borders**: Animated gradient borders
- **Shadows**: Subtle drop shadows
- **Opacity**: Selective transparency for depth
- **Blur**: Background blur for modern aesthetics

## 🔧 Customization Tips

### Modifying Keybindings
Edit `~/.config/hypr/hyprland/binds.conf` for custom shortcuts.

### Changing Colors
Modify `~/.config/hypr/mocha.conf` for color scheme adjustments.

### Adding Applications
Update `~/.config/waybar/config.jsonc` for status bar modules.

### Performance Tuning
Adjust animation settings in `~/.config/hypr/hyprland.conf`:
```conf
animations {
    enabled = true
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
}
```

## 🔍 Troubleshooting

### Common Issues

#### NVIDIA Graphics
```bash
# Check if nvidia modules are loaded
lsmod | grep nvidia

# Verify environment variables
echo $LIBVA_DRIVER_NAME
```

#### Audio Issues
```bash
# Restart PipeWire
systemctl --user restart pipewire
systemctl --user restart wireplumber
```

#### G14 Function Keys Not Working
```bash
# Install and enable asusctl
sudo systemctl enable asusd
sudo systemctl start asusd
```

### Performance Issues
```bash
# Check system resource usage
htop
# Monitor GPU usage
nvidia-smi
# Check power profile
asusctl profile -p
```

## 📱 Additional Tools

### Recommended Applications
- **File Manager**: Dolphin (KDE)
- **Image Viewer**: Gwenview
- **PDF Viewer**: Okular
- **Music Player**: Spotify (AUR)
- **Video Player**: VLC
- **Code Editor**: Visual Studio Code (AUR)

### Development Tools
- **Docker**: For containerization
- **Postman**: API testing
- **DBeaver**: Database management
- **GIMP**: Image editing

## 🚀 Performance Notes

### G14 2021 Specific Optimizations
- **TDP Management**: Optimized power limits for battery life
- **GPU Switching**: Automatic switching between integrated and discrete GPU
- **Display Scaling**: Proper 125% scaling for QHD display
- **Thermal Management**: Custom fan curves via ASUS tools

### Battery Optimization
```bash
# Install and configure TLP
sudo pacman -S tlp
sudo systemctl enable tlp

# Monitor power consumption
sudo tlp-stat -b
```

## 📚 Learning Resources

### Hyprland
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Documentation](https://github.com/Alexays/Waybar/wiki)

### Neovim
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)

### Ghostty
- [Ghostty Documentation](https://ghostty.org/docs)
- [Ghostty Configuration](https://ghostty.org/docs/config)

## 🤝 Credits

- **Hyprland Community**: For the amazing compositor
- **Catppuccin**: For the beautiful color scheme
- **Dreams of Code**: Tmux configuration inspiration
- **ASUS Linux Community**: G14 optimization guides

---

**Happy Ricing! 🎨**

*This setup represents hours of fine-tuning for the perfect balance of aesthetics, performance, and productivity on the ASUS G14 2021.*

