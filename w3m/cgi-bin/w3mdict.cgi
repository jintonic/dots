#!/bin/sh
google_q='http://google.com/search?btnG=Google&q'

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $google_q=$QUERY_STRING
W3m-control: DELETE_PREVBUF
W3m-control: SEARCH 1\.
W3m-control: NEXT_WORD
_END_
