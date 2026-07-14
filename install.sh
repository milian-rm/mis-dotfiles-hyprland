#!/usr/bin/env bash
set -euo pipefail

# ============================================
#  Instalador de dotfiles - Arch + Hyprland
#  Instala apps y aplica SOLO configs sin
#  datos personales (nada de cuentas/logins).
# ============================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC="$DOTFILES_DIR/config"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

echo "==> Instalador de dotfiles Hyprland"

if ! command -v pacman &> /dev/null; then
    echo "Este script está pensado para Arch Linux (o derivadas)."
    exit 1
fi

# ---------- 1. Instalar yay si no existe ----------
if ! command -v yay &> /dev/null; then
    echo "==> Instalando yay (AUR helper)..."
    sudo pacman -S --needed --noconfirm git base-devel
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    (cd "$tmpdir/yay" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
fi

# ---------- 2. Instalar paquetes oficiales ----------
if [[ -f "$DOTFILES_DIR/pkglist.txt" ]]; then
    echo "==> Instalando paquetes oficiales..."
    sudo pacman -S --needed --noconfirm - < "$DOTFILES_DIR/pkglist.txt"
fi

# ---------- 3. Instalar paquetes AUR (incluye apps install-only) ----------
if [[ -f "$DOTFILES_DIR/aurpkglist.txt" ]]; then
    echo "==> Instalando paquetes de AUR..."
    # Se ignoran líneas vacías o de comentario (#)
    grep -vE '^\s*(#|$)' "$DOTFILES_DIR/aurpkglist.txt" | yay -S --needed --noconfirm -
fi

# ---------- 4. Backup de configs existentes ----------
mkdir -p "$BACKUP_DIR"
echo "==> Haciendo backup de configs existentes en $BACKUP_DIR"
for dir in "$CONFIG_SRC"/*; do
    name="$(basename "$dir")"
    if [[ -e "$HOME/.config/$name" ]]; then
        mv "$HOME/.config/$name" "$BACKUP_DIR/"
    fi
done

# ---------- 5. Copiar SOLO configs sin datos personales ----------
mkdir -p "$HOME/.config"
echo "==> Copiando configuraciones (sin cuentas/credenciales)..."
cp -r "$CONFIG_SRC/." "$HOME/.config/"

# ---------- 6. Wallpapers ----------
if [[ -d "$DOTFILES_DIR/wallpapers" ]]; then
    echo "==> Copiando wallpapers a ~/wallpapers"
    mkdir -p "$HOME/wallpapers"
    cp -r "$DOTFILES_DIR/wallpapers/." "$HOME/wallpapers/"
fi

# ---------- 6b. Fuentes manuales (JetBrainsMono Nerd Font, etc.) ----------
if [[ -d "$DOTFILES_DIR/fonts" ]]; then
    echo "==> Instalando fuentes en ~/.local/share/fonts"
    mkdir -p "$HOME/.local/share/fonts"
    cp -r "$DOTFILES_DIR/fonts/." "$HOME/.local/share/fonts/"
    fc-cache -f "$HOME/.local/share/fonts" > /dev/null
fi

# ---------- 7. Scripts personales (~/.local/bin) ----------
if [[ -d "$DOTFILES_DIR/home/.local/bin" ]]; then
    echo "==> Copiando scripts a ~/.local/bin"
    mkdir -p "$HOME/.local/bin"
    cp -r "$DOTFILES_DIR/home/.local/bin/." "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/"*
fi

# ---------- 8. Crear symlink inicial de hyprland.conf ----------
# hyprland.conf normalmente es un symlink que crea monitor-setup.sh en
# tiempo de ejecución, pero en una instalación nueva aún no existe.
# Sin esto, Hyprland no sabría qué config cargar la primera vez.
if [[ -f "$HOME/.config/hypr/hyprland-solo.conf" && ! -e "$HOME/.config/hypr/hyprland.conf" ]]; then
    echo "==> Creando symlink inicial hyprland.conf -> hyprland-solo.conf"
    ln -sf "$HOME/.config/hypr/hyprland-solo.conf" "$HOME/.config/hypr/hyprland.conf"
fi

echo ""
echo "==> ¡Listo! Apps instaladas, configs visuales aplicadas."
echo "==> Backup de tus configs anteriores en: $BACKUP_DIR"
echo ""
echo "Apps como Docker Desktop, MongoDB Compass, Firefox, gh, ngrok, Zoom"
echo "quedaron instaladas pero SIN configurar: abrelas y haz login con tu propia cuenta."
echo ""
echo "==> Reinicia sesión o inicia Hyprland para ver los cambios."
