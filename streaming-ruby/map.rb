#!/usr/bin/env ruby
        
ARGF.each do |line|
    line = line.chomp.strip
    line.split.each do |w|
        puts w + "\t" + 1.to_s
    end
end