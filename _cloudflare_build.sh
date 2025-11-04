#!/bin/bash
set -e

echo "?? Installing Ruby dependencies..."
bundle install

echo "???  Building Jekyll site..."
bundle exec jekyll build

echo "? Build complete!"
