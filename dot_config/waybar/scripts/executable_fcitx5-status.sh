#!/bin/bash
current_im=$(fcitx5-remote -n 2>/dev/null)
case "$current_im" in
"keyboard-us")
  echo '{"text": "EN", "tooltip": "English (US)", "class": "keyboard-us"}'
  ;;
"mozc")
  echo '{"text": "あ", "tooltip": "Japanese (mozc, ひらがな)", "class": "keyboard-jp"}'
  ;;
*)
  echo "{\"text\": \"${current_im:-OFF}\", \"tooltip\": \"Active IM: $current_im\", \"class\": \"active\"}"
  ;;
esac
