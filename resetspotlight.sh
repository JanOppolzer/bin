#!/usr/bin/env bash

# reset Spotlight position
defaults delete com.apple.Spotlight userHasMovedWindow

# reset Spotlight size
defaults delete com.apple.Spotlight windowHeight

# restart Spotlight
killall Spotlight

