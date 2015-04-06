#!/bin/bash

# if `docker run` first argument start with `-` the user is passing jenkins swarm launcher arguments
# export them to env and let command in supervisor access them
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
  export SWARMARGS="$@"
  exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi
# As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
exec "$@"
