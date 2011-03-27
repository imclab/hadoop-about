#!/usr/bin/env python

import sys
from multiprocessing import Process

sys.setrecursionlimit(50000)

def ack(m, n):
	if m == 0:
		return n+1
	elif m > 0 and n == 0:
		return ack(m-1,1)
	elif m > 0 and n > 0:
		return ack(m-1,ack(m,n-1))

def wynik(m,n):
	print "%s\t%s\t%s" % (m,n,ack(m,n))

if __name__ == "__main__":
	
	for line in sys.stdin:
		line = line.strip()
		words = line.split()
		m = int(words[0])
		n = int(words[1])
		wynik(m,n)
