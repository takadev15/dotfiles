export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &
xrdb -merge ~/.Xresources
xrandr --output eDP --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
systemctl --user import-environment DISPLAY
exec i3

