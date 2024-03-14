[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
export PATH="/home/francisco/Software/scripts:$PATH"
exec i3
