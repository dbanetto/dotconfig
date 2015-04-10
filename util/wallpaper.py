#!/usr/bin/env python3
import os, shutil
import sched
import time
from os import path
from glob import glob

WALLPAPER_DIRECTORY = '/home/drb/Pictures/wallpapers/'
LIGHTDM_WALLPAPER = '/etc/lightdm/wallpaper/current'
COUNTER_FILE = '.wallpaper_counter'
TIME_OUT = 30*60

def main():
    timer = sched.scheduler(time.time, time.sleep)
    timer.enter(TIME_OUT, 1, loop, (timer,))
    loop(None)
    timer.run()

def loop(sc):
    apply_wallpaper(get_current_wallpaper())

    if sc is not None:
        sc.enter(TIME_OUT, 1, loop, (sc,))

def get_current_wallpaper():
    files = glob(WALLPAPER_DIRECTORY + '*')

    if not path.exists(COUNTER_FILE):
        with open(COUNTER_FILE, 'wt') as counter_file:
            counter_file.write('0')
            counter_file.flush()

    with open(COUNTER_FILE, 'r') as counter_file:
        count = int(counter_file.read()) % len(files)

    with open(COUNTER_FILE, 'wt') as counter_file:
        counter_file.write(str(count + 1))
        counter_file.flush()

    return files[count]

def apply_wallpaper(file_path):
    if not path.exists(file_path):
        raise ValueError('file_path={} does not exist'.format(file_path))

    if not path.isfile(file_path):
        raise ValueError('file_path={} is not a file'.format(file_path))

    desktop_session = os.environ['DESKTOP_SESSION']

    if desktop_session == 'gnome':
        os.system('gsettings set org.gnome.desktop.background picture-uri "file://{}"'
                  .format(file_path))
    elif desktop_session == 'cinnamon':
        os.system('gsettings set org.cinnamon.desktop.background picture-uri "file://{}"'
                  .format(file_path))
    elif desktop_session == 'xfce4':
        os.system('xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "{}"'
                  .format(file_path))
        os.system('xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/image-path -s "{}"'
                  .format(file_path))
    elif desktop_session == 'i3':
        os.system('feh --bg-fill "/etc/lightdm/wallpaper/current"')

    shutil.copyfile(file_path, LIGHTDM_WALLPAPER)


if __name__ == '__main__':
    main()
