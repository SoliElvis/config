cvt 1900 1080 | grep -oP "Modeline\K.*" | xargs xrandr --newmode;
xrandr --addmode VGA1 1904x1080_60.00;
xrandr --output VGA1 --mode 1904x1080_60.00 --primary --right-of-eDP1;





