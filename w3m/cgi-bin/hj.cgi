#!/bin/sh
query=${QUERY_STRING#*:}

if [ "$query" = "br" ]; then
  echo Content-type: text/plain
  echo W3m-control: GOTO http://jp.hjenglish.com/new/zt/jiaocai
  echo W3m-control: DELETE_PREVBUF
  echo W3m-control: GOTO_LINE 128
fi
