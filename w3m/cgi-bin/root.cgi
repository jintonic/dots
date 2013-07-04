#!/bin/sh
google_q="http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=site:root.cern.ch/root/html"
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $google_q+$query
W3m-control: DELETE_PREVBUF
_END_

