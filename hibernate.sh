#!/bin/bash
b=`dmesg | grep hibernation | grep exit | tail -n 1 | grep  -o -e '\[.*\]' | sed -e 's/\[//' -e 's/\]//'| cut -d'.' -f1`

sudo rmmod r8723bs
sudo modprobe r8723bs


#zenity  --info --text $(whoami)&

# cat << EOF | xmodmap -
# keycode  11 = 2 quotedbl 2 quotedbl
# keycode  15 = 6 ampersand 6 ampersand
# keycode  16 = 7 apostrophe 7 apostrophe
# keycode  17 = 8 parenleft 8 parenleft
# keycode  18 = 9 parenright 9 parenright
# keycode  19 = 0 0 0 0
# keycode  20 = minus equal minus equal
# keycode  21 = asciitilde asciicircum asciitilde asciicircum
# keycode  23 = Tab ISO_Left_Tab Tab ISO_Left_Tab
# keycode  34 = at grave at grave
# keycode  35 = bracketleft braceleft bracketleft braceleft
# keycode  47 = semicolon plus semicolon plus
# keycode  48 = colon asterisk colon asterisk
# keycode  51 =  bracketright braceright bracketright braceright

# EOF


while [ 0 ];do

#dmesg|grep hibernation

a=`dmesg | grep hibernation | grep exit | tail -n 1 | grep  -o -e '\[.*\]' | sed -e 's/\[//' -e 's/\]//'| cut -d'.' -f 1`

echo "check hibernate status"
if [ -z $a ] || [ -z $b ];then
        a=0
        b=0
fi

if [ $(bc <<< "$a - $b") -ne 0 ];then
        sudo rmmod r8723bs
        sudo modprobe r8723bs
        xterm -e 'for n in $(seq 4);do echo key config;xdotool key 0x2c00001+super;done'&
#       xterm -e 'for n in $(seq 4);do echo key config;xdotool key 0x2c000df+super;done'&
fi
b=$a
sleep 1
done
