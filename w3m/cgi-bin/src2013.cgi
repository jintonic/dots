#!/bin/sh
xlog="http://ipmulo02.km.ipmu.jp/Run2013/?mode=summary&reverse=1&npp=20&Source="
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $xlog$query
W3m-control: DELETE_PREVBUF
W3m-control: SEARCH $query
W3m-control: SEARCH $query
W3m-control: SEARCH $query
_END_
