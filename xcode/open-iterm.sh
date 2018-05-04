#!/bin/bash
#
# description:
#   Xcode Custom Behaviors
#   Open `iTerm` app in the project directory
#
# note: Xcode Behaviors path
#   Project Name:  $XcodeProject
#   Project Dir:   $XcodeProjectPath
#   Workspace Dir: $XcodeWorkspacePath
#

open -a iTerm "$(dirname $XcodeProjectPath)"
