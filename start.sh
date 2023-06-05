#!/bin/bash
set -e

# bin/investify eval "Investify.Release.migrate"
bin/investify start

exec "$@"
