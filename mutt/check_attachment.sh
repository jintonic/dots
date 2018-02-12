#!/bin/bash
# http://wiki.mutt.org/?[ConfigTricks/CheckAttach](ConfigTricks/CheckAttach)
# Edit muttrc to have this line:
# set sendmail = "/path/to/check_attachement.sh msmtp"

## Attachment keywords that the message body will be searched for:
KEYWORDS='attach|附件'

## Check that sendmail or other program is supplied as first argument.
if [ $# -lt 1 ]; then echo "Usage: $0 </path/to/mailprog> <args> ..."; exit 2; fi
prog=`which $1`
if [ ! -x "$prog" ]; then echo "$prog cannot be found"; exit 2; fi

## Save msg in file to re-use it for multiple tests.
TMPFILE=`mktemp -t mutt_checkattach.XXXXXX` || exit 2
cat > "$TMPFILE"

## Define test for multipart message.
function multipart {
  grep -q '^Content-Type: multipart' "$TMPFILE"
}

## Define test for keyword search.
function word-attach {
  grep -v '^>' "$TMPFILE" | grep -E -i -q "$KEYWORDS"
}

## Header override.
function header-override {
  grep -i -E "^X-attached: *none *$" "$TMPFILE"
}

## FINAL DECISION:
if multipart || ! word-attach || header-override; then
  "$@" < "$TMPFILE"
  EXIT_STATUS=$?
else
  echo "No file was attached but a search of the message text suggests there should be one."
  echo "Add a header \"X-attached: none\" to override this check if no attachment is intended."
  EXIT_STATUS=1
fi

## Delete the temporary file.
rm -f "$TMPFILE"

## That's all folks.
exit $EXIT_STATUS

