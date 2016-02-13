#!/bin/bash -e

WHEEL_DIR=/usr/src/target

pip wheel --wheel-dir=$WHEEL_DIR $@
