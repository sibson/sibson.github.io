#!/bin/bash -xe

cp "$1" _posts/$(date "+%Y-%m-%d-")$(basename "$1")
