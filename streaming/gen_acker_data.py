#!/usr/bin/env python

import random

n = 500

file = open('ackerData.txt','w')

for i in range(n):
	file.write(str(i)+' '+str(random.randint(0,n))+'\n')

file.close()

