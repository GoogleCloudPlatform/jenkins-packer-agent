#!/bin/bash
# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and

# If there are no arguments or if args start with '-', run supervisor
# and export args making them available to Swarm client.
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
  export SWARMARGS="$@"
  exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi

# Assume arg is a process the user wants to run
exec "$@"
