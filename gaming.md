### steam
see this - [How to Properly Set Multiple Launch Options](https://wiki.cachyos.org/configuration/gaming/#how-to-properly-set-multiple-launch-options)

[Fix Stuttering](https://wiki.cachyos.org/configuration/gaming/#fix-stuttering-caused-by-the-steam-game-recorder-feature)

### gamescope
[Fix Stuttering for gamescope](https://wiki.archlinux.org/title/Gamescope#Launching_gamescope_from_Steam,_stuttering_after_~24_minutes_(Gamescope_Lag_Bomb))

my personal gamescope launch options:
```
gamescope -W 1920 -H 1080 -w 1920 -h 1080 -r 200 -o 60 -F fsr -S stretch -f --adaptive-sync --force-grab-cursor
```

same but for steam:
```
gamescope -W 1920 -H 1080 -w 1920 -h 1080 -r 200 -o 60 -F fsr -S stretch -f --adaptive-sync --force-grab-cursor -- env LD_PRELOAD="$LD_PRELOAD" %command%
```

same but for TF2:
```
gamescope -W 1920 -H 1080 -w 1920 -h 1080 -r 200 -o 60 -F fsr -S stretch -f --adaptive-sync --force-grab-cursor -- env LD_PRELOAD="$LD_PRELOAD" %command% -novid -nojoy -nosteamcontroller -nohltv -particles 1
```

### mangohud
configure mangohud via goverlay to your favor

add mangohud to game launch options in steam
```
mangohud %command%
```

to use mangohud with gamescope you need to do it like this
```
gamescope --mangoapp -- %command%
```
