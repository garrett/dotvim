#!/bin/sh

# update repo
git pull

# Update submodules to their latest versions
git submodule foreach git pull origin master
