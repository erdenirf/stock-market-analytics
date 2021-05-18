#!/bin/bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))
PROJECT_DIR="/stockanalytics"

pg -u postgres psql -h localhost -U postgres -f /docker-entrypoint-initdb.d/create_db.sql
