#!/bin/sh
people="https://www.usd.edu/search/people/index.cfm?searchAttribute=cn&searchType=contains&searchAffiliation=student&searchAffiliation=staff&searchAffiliation=faculty&searchAffiliation=affiliate&fbDepartment=all&searchQuery"
query=${QUERY_STRING#*:}
cat <<_END_
Content-type: text/plain
W3m-control: GOTO $people=$query
W3m-control: DELETE_PREVBUF
_END_
