#!/bin/bash

pkgs=$(sudo emerge -puDN @world --quiet | awk '/^\[ebuild/ {print $4}')
pkg_count=$(printf "%s\n" "$pkgs" | sed '/^$/d' | wc -l)
pkg_list=$(printf "%s\n" "$pkgs" | sed 's/$/\\r/' | tr -d '\n')

echo "{\"text\":\"$pkg_count\", \"tooltip\":\"$pkg_list\"}"
