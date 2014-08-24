#!/usr/bin/ruby

WPPATH=File.expand_path "~/Pictures/wallpapers/"

WPS = Dir.entries(WPPATH)
TIME_OUT = 60*60

# Remove '.' and '..'
WPS.shift(2)

index = ((Time.now.to_i)/TIME_OUT) % WPS.size
puts File.join(WPPATH , WPS[index])
