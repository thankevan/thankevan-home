#!/bin/bash

if [ "$1" == "" ]; then
  echo "Proper use: $0 <container name>"
  exit 1
fi

# tail logs, parsing them with jq if it's available
if [ -n "$(command -v jq)" ]; then
  docker logs -f $1 2>&1 | jq -R "fromjson? | . "
else
  docker logs -f $1
fi

