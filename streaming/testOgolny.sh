#!/usr/bin/env bash
cat testData.txt | ./map.py | ./reduce.py
cat ackerData.txt | ./map_a.py
