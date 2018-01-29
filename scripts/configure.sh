#!/bin/sh
set -e

export PATH=.venv/bin:$PATH

python3 -m venv .venv # setup a venv leaner than pipenv
pip install -U pip
pip install -r requirements.txt
