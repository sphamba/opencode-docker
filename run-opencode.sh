#!/bin/bash

# Docker run script for opencode with sound and notifications support (Hyprland/PipeWire)

docker run \
  -it \
  --rm \
  --name opencode-$(basename "$PWD") \
  --security-opt=no-new-privileges \
  --device=/dev/snd \
  --group-add $(getent group audio | cut -d: -f3) \
  -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
  -e XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR} \
  -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
  -e DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus \
  -v ~/.config/opencode:/home/user/.config/opencode:ro \
  -v ~/.local/share/opencode:/home/user/.local/share/opencode \
  -v ~/.serena/contexts/opencode.yml:/home/user/.serena/contexts/opencode.yml:ro \
  -v ~/.config/dunst:/home/user/.config/dunst:ro \
  -v $(pwd):/home/user/$(basename "$PWD") \
  -v ${XDG_RUNTIME_DIR}/pulse:${XDG_RUNTIME_DIR}/pulse \
  -v ${XDG_RUNTIME_DIR}/wayland-0:${XDG_RUNTIME_DIR}/wayland-0 \
  -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
  opencode-local \
  /home/user/$(basename "$PWD")
