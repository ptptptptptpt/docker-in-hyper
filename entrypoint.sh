#!/bin/bash

/usr/bin/cgroups-mount

exec "$@"
