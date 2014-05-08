#!/bin/sh
dict="http://dict.cn/"
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $dict$query
W3m-control: DELETE_PREVBUF
_END_
