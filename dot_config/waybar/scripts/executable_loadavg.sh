#!/usr/bin/env bash

read -r load1 load5 load15 _ </proc/loadavg

if (($(echo "$load1 > 5" | bc -l))); then
  class="critical"
elif (($(echo "$load1 > 2" | bc -l))); then
  class="warning"
else
  class="normal"
fi

printf '{"text":"%s %s %s","class":"%s","tooltip":"Load average: %s %s %s"}\n' \
  "$load1" "$load5" "$load15" \
  "$class" \
  "$load1" "$load5" "$load15"
