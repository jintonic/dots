#!/bin/sh
google_q="https://www.google.com/search?btnI=I'm+Feeling+Lucky&q=site:root.cern.ch/doc/master"
query=${QUERY_STRING#*:}

cat <<_END_
Content-type: text/plain
W3m-control: GOTO $google_q+$query
W3m-control: DELETE_PREVBUF
W3m-control: NEXT_LINK
_END_

