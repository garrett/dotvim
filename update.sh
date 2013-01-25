#!/bin/sh

# Check out submodules; useful for a first-time repo
git submodule init && git submodule update

# Update submodules to their latest versions
git submodule foreach git pull origin master
