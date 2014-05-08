#!/bin/sh
iciba="http://www.iciba.com/"
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $iciba$query
W3m-control: DELETE_PREVBUF
_END_
