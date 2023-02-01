#!/bin/bash

#Script that updates multiple packages

packages=$@

for package in $packages; do
  apt-get update $package
  echo "Package $package updated."
done