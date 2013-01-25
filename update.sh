#!/bin/sh

# Update submodules to their latest versions
git submodule foreach git pull origin master
