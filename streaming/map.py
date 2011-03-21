#!/usr/bin/env python
#coding=utf-8

import sys

# dane przychodz± z standardowego wej¶cia
for line in sys.stdin:
    
    # usuniecie z poczatku i konca bialych znaków
    line = line.strip()
    
    # podzielenie linii na s³owa
    words = line.split()
    
    # emity
    for word in words:
        # i wypuszczamy przez stdout
        print '%s\t%s' % (word, 1)
