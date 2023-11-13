#!/bin/sh

# Session-specific variables
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export WLR_DRM_NO_MODIFIERS=1
export WLR_RENDERER=vulkan

. /usr/local/bin/defaults.sh
. /usr/local/bin/wayland_enablement.sh

systemd-cat --identifier=sway sway "$@"
