#!/bin/sh

if [ "$1" = 'nodejs' ]; then
    echo "Running Nodejs Application"
    npm run start
else 
    exec "$@"   
fi