#!/usr/bin/env bash

set -euo pipefail

emit() {
  local player status artist title icon text

  player=$(playerctl -l 2>/dev/null | head -n1 || true)
  [[ -z "$player" ]] && { echo ""; return; }

  status=$(playerctl -p "$player" status 2>/dev/null || true)
  title=$(playerctl -p "$player" metadata title 2>/dev/null || true)
  artist=$(playerctl -p "$player" metadata artist 2>/dev/null || true)

  [[ -z "$title" ]] && { echo ""; return; }

  if [[ "$status" == "Playing" ]]; then
    icon=" "
  else
    icon=" "
  fi

  if [[ -n "$artist" ]]; then
    text="$artist - $title"
  else
    text="$title"
  fi

  jq -cn \
    --arg text "$icon $text" \
    --arg class "custom-$player" \
    --arg alt "$player" \
    '{text:$text, class:$class, alt:$alt}'
}

emit

playerctl --follow metadata status 2>/dev/null | while read -r _; do
  emit
done
