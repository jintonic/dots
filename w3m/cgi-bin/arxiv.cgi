#!/bin/sh
arXiv="http://arxiv.org/abs/"
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $arXiv$query
W3m-control: DELETE_PREVBUF
W3m-control: SEARCH PDF
_END_
