#!/bin/bash

# If there are no arguments or if args start with '-', run supervisor
# and export args making them available to Swarm client.
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
  export SWARMARGS="$@"
  exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi

# Assume arg is a process the user wants to run
exec "$@"
