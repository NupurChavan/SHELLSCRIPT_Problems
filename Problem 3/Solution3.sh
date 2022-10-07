#!/bin/bash


echo "Enter the address:"
read add
du -a $add | sort -n -r | head -n 10
