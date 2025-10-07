#!/usr/bin/env bash

function fzf-aliases-functions() {
  CMD=$(
    (
      (alias)
      (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_")
    ) | fzf | cut -d '=' -f1
  )
  eval "$CMD"
}
