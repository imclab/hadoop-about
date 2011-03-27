#!/usr/bin/env ruby

LINES = 50000
DIGITS_PER_LINE = 750
FILES = 1

r = Random.new()

1.upto(FILES) do |f|
    data = File.open("data#{f}.txt", "w")
    1.upto(LINES) do |i|
        s = ""
        1.upto(DIGITS_PER_LINE) do |j|
            s += r.rand(0..9).to_s
        end
        data.puts(s)
    end
end