#!/bin/sh

# update repo
git pull

# Update submodules to their latest versions
git submodule foreach "git submodule init && git pull origin master"
