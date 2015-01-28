#!/usr/bin/ruby

WPPATH=File.expand_path "~/Pictures/wallpapers/"

Dir.chdir(WPPATH)
WPS = Dir.glob("*{png,jpg,jpeg}")
TIME_OUT = 30*60

index = ((Time.now.to_i)/TIME_OUT) % WPS.size
puts File.join(WPPATH , WPS[index])
