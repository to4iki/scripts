#!/bin/bash
#
# description:
#   Open related pull-request page from a specific line with `hub` command
#
# parameter 1: commit hash
#
# dependencies: hub
#
# see also: http://techlife.cookpad.com/entry/2015/11/17/151426
#

merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..master) <(git rev-list --first-parent $1..master))
if git show $merge_commit | grep -q 'pull request'
    # not found pull-request
then
    pull_request_number=$(git log -1 --format=%B $merge_commit | sed -e 's/^.*#\([0-9]*\).*$/\1/' | head -1)
    url="$(hub browse -u)/pull/${pull_request_number}"
fi
open $url
