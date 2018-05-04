#!/bin/bash
#
# description:
#   Xcode Custom Behaviors
#   Remove Xcode derived data & snapshot
#
# see also: http://niwatako.hatenablog.jp/entry/2018/03/29/144115
#

rm -rf ~/Library/Developer/Xcode/DerivedData/* && rm -rf ~/Library/Developer/Xcode/Snapshots/*
osascript -e 'tell app "Xcode" to display dialog "DerivedData deleted." buttons {"OK"} '
