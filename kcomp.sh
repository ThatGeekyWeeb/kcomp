#!/bin/sh
grep "OpenGLIsUnsafe=true" "$HOME/.config/kwinrc" || exit 1
IFS=""
var1=$(sed '1,/Windows/d' "$HOME/.config/kwinrc")
var2=$(sed '/Comp/Q' "$HOME/.config/kwinrc")
# var2 = `update_info=kwin.upd:replace-scalein-with-scale,kwin.upd:port-minimizeanimation-effect-to-js,kwin.upd:port-scale-effect-to-js,kwin.upd:port-dimscreen-effect-to-js,kwin.upd:auto-bordersize,kwin.upd:animation-speed`
printf "$var2"'%b\n'"$var1" > "$HOME/.config/kwinrc"
printf '%b\n[Compositing]%b\nGLCore=true%b\nOpenGLIsUnsafe=false%b\nWindowsBlockCompositing=false' >> "$HOME/.config/kwinrc"
nohup kwin_x11 --replace &
exit 0
