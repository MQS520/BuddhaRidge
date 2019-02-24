#!/usr/bin/env bash
nohup python3 run.py > python.log &
tail -f python.log