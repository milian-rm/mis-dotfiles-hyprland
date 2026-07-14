# Notas para instalar/adaptar estos dotfiles

Generado automáticamente por prepare-dotfiles.sh. Revisa esto antes o
después de correr install.sh en la laptop nueva.

## Ya resuelto automáticamente
- `~/wallpapers` completa copiada a `wallpapers/` en el repo.
- `~/.local/bin/set-wallpaper.sh` incluido en `home/.local/bin/`. Este
  script YA usa `$HOME/wallpapers/...` (no username hardcodeado) y
  reescribe la ruta de `hyprlock.conf` automáticamente en cada inicio
  de Hyprland (`exec-once`), así que el wallpaper de lockscreen se
  autorepara solo con tener la carpeta de wallpapers e imágenes ahí.
- rofi: ruta del theme convertida a relativa (mismo folder).
- wlogout: rutas de iconos convertidas a relativas (mismo folder).
- Líneas `monitor = HDMI-...` / `monitor = eDP-...` específicas quedaron
  COMENTADAS en las copias de hyprland*.conf. Se deja activa la línea
  `monitor = ,preferred,auto,1` que autodetecta cualquier pantalla.
- `waybar/` (config-hdmi, config-laptop, config-solo, style.css) y
  `hypr/scripts/lock-and-suspend.sh`: revisados, sin rutas absolutas,
  no requieren ningún cambio.
- kitty, dunst, rofi/theme.rasi: revisados, sin rutas absolutas.
- Fuentes manuales (`JetBrains Mono`, `JetBrainsMono Nerd Font`) desde
  `~/.local/share/fonts` copiadas a `fonts/` en el repo. `install.sh`
  las instala automáticamente.
- GTK: no hay nada custom vía gsettings (todo en default: Adwaita,
  cursor default). Solo `gtk-4.0/gtk.css` tiene estilos propios
  (Nautilus oscuro), y ya se copia con la carpeta `gtk-4.0`.
- Kvantum: los temas (Catppuccin, Qogir, Gruvbox, Daemon, etc.) son
  archivos instalados manualmente, NO vienen de un paquete AUR. Ya se
  copian completos con la carpeta `Kvantum/`.

## Requiere revisión manual
- **`~/.config/hypr/hyprland.conf` NO es un archivo real, es un symlink**
  creado dinámicamente por `scripts/monitor-setup.sh` (por eso no aparece
  en `find -type f`). En una instalación nueva ese symlink NO existe
  todavía, así que Hyprland no sabrá qué config cargar la primera vez.
  `install.sh` debe crear el symlink inicial (apuntando a
  `hyprland-solo.conf` por defecto, asumiendo laptop sin monitor externo)
  ANTES de arrancar Hyprland por primera vez.
- **`monitor-setup.sh`**: `EXTERNAL="HDMI-A-1"` es el nombre de salida de
  video de la laptop original. Si tu amigo conecta un monitor externo,
  ese nombre puede ser distinto en su hardware (verificar con
  `hyprctl monitors`).
- **`hyprland-dual.conf`**: asigna workspaces 1-6 a `HDMI-A-1` y 7-12 a
  `eDP-1`. Solo relevante si usa doble monitor; si es laptop sola, este
  archivo prácticamente no se usa (monitor-setup.sh cargará el -solo).
- **kb_layout = latam** en hyprland*.conf: es la distribución de teclado
  del autor original. Cámbiala si usas otro layout (ej. `us`, `es`).
- **swaylock**: su imagen de fondo NO se auto-repara como la de hyprlock
  (no hay script que la actualice). Quedó fijada a una imagen copiada
  a `wallpapers/`.
- **Kvantum**: el tema activo en el original es `Gruvbox`
  (`~/.config/Kvantum/kvantum.kvconfig`). Los archivos ya quedan en su
  lugar, pero verifica que Qt realmente lo esté usando: abre
  "Kvantum Manager" y confirma que el tema seleccionado sea el correcto
  (a veces requiere reiniciar sesión para que las apps Qt lo tomen).
- **Apps con cuenta** (Docker Desktop, MongoDB Compass, Firefox, gh,
  ngrok, Zoom, Code): solo quedan INSTALADAS, sin configuración ni
  sesión. Ábrelas y haz login con tu propia cuenta.
- Verifica los nombres exactos de paquetes AUR en `aurpkglist.txt`
  bajo la sección "Apps agregadas manualmente" (pueden no coincidir
  exacto con el nombre real del paquete).
