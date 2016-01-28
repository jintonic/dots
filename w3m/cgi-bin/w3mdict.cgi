#!/bin/sh
run_keyword_command()
{
  echo Content-type: text/plain
  if [ $QUERY_STRING = "r" ]; then
    echo W3m-control: GOTO http://root.cern.ch
    echo W3m-control: DELETE_PREVBUF
  else
    echo W3m-control: BACK
  fi
}

if [ ${#QUERY_STRING} -lt 3 ]; then
  run_keyword_command
  exit
fi

google_q='http://google.com/search?btnG=Google&q'

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $google_q=$QUERY_STRING
W3m-control: DELETE_PREVBUF
W3m-control: SEARCH results
W3m-control: MOVE_DOWN
W3m-control: MOVE_DOWN
_END_
