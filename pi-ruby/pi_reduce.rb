#!/usr/bin/env ruby
    
pi_hash = Hash.new(0)
ARGF.each do |line|
    line.chomp.split("").each do |n|
        pi_hash[n] = pi_hash[n].to_i + 1    
    end
end

pi_hash.sort{|a,b| b[1] <=> a[1]}.each do |elem|
  puts "#{elem[0]}\t#{elem[1]}"
end