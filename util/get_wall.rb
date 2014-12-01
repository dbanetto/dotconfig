#!/usr/bin/ruby

WPPATH=File.expand_path "~/Pictures/wallpapers/"

WPS = Dir.entries(WPPATH)
TIME_OUT = 30*60

# Remove '.' and '..' and '.sync'
WPS.shift(3)

index = ((Time.now.to_i)/TIME_OUT) % WPS.size
puts File.join(WPPATH , WPS[index])
