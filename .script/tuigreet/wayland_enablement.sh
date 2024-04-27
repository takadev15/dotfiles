#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export MOZ_DBUS_REMOTE=1
export CLUTTER_BACKEND=wayland
export SAL_USE_VCLPLUGIN=gtk3
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export _JAVA_AWT_WM_NONPARENTING=1
export SDL_VIDEODRIVER=wayland
export ELM_ENGINE=wayland_egl
export ECORE_EVAS_ENGINE=wayland-egl
export NO_AT_BRIDGE=1