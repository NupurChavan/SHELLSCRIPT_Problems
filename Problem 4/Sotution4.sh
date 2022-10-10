#!/bin/bash

output=$(fdupes -f player)
echo "$output"

mv -f $output /football
