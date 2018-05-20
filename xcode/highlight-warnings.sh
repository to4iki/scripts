#!/bin/bash
#
# description:
#   Xcode Run Script in Build Phase
#   Build project, all comments with `TODO:`,`FIXME:`,`WARNING:` as prefix are treated as warnings of the compiler,
#   and the `ERROR:` is regarded as an error
#
# see also: https://medium.com/ios-os-x-development/highlight-warnings-in-xcode-521125121a75
#

TAGS="TODO:|FIXME:|WARNING:"
ERRORTAG="ERROR:"
find "${SRCROOT}" \( -name "*.h" -or -name "*.m" -or -name "*.swift" \) -print0 \
    | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$|($ERRORTAG).*\$" \
    | perl -p -e "s/($TAGS)/ warning: \$1/" \
    | perl -p -e "s/($ERRORTAG)/ error: \$1/"
