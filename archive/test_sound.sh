#!/bin/zsh

say "test sound"
cp -R "$HOME/Downloads/Archive" "$HOME/Desktop"
exec > $HOME/testlog.txt 2>&1
