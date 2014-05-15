#!/bin/bash

for i in bundle/*; do git commit $i -m "Updated `basename $i` submodule"; done;
