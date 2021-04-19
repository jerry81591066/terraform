#!/bin/bash

[[ ! -f index.html ]] && echo "Hostname: $(hostname)" >> index.html
sudo python3 -m http.server 80
