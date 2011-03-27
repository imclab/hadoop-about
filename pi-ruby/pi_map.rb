#!/usr/bin/env ruby

N = 1000.to_i

i = k = ns = 0
k1 = 1
n,a,d,t,u = [1,0,1,0,0]

pi = []

loop do
  k += 1
  t = n<<1
  n *= k
  a += t
  k1 += 2
  a *= k1
  d *= k1
  if a >= n
    t,u = (n*3 +a).divmod(d)
    u += n
    if d > u
      ns = ns*10 + t
      i += 1
      pi << ns if ns.to_s.size > 1 
      break if i >= N
   
      a -= d*t
      a *= 10
      n *= 10
    end
  end
end


ARGF.each do |line|
    pi.each do |p|
        if line.match(p.to_s)
            puts "#{p}"
        else
            break
        end
    end
end