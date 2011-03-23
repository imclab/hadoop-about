#!/usr/bin/env ruby
    
words_hash = Hash.new(0)
ARGF.each do |line|
    line = line.chomp
    (key, value) = line.split(/\t/)
    words_hash[key] = words_hash[key].to_i + value.to_i
end

words_hash.sort{|a,b| a[0] <=> b[0]}.each do |elem|
  puts "#{elem[0]}\t#{elem[1]}"
end