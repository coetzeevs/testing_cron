#/bin/sh
set -e

find . -name __pycache__ -print0 | xargs -0 rm -rf
rm -rf .venv
