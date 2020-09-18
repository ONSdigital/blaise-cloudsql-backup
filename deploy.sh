#!/bin/bash

PROJECT=ons-blaise-dev-pds-27

gcloud functions deploy CloudSQL-Backup --entry-point=exportDatabase --runtime nodejs10 --trigger-topic backup-sql \
  --set-env-vars PROJECT=$PROJECT,DB="$PROJECT:europe-west2:blaise-dev-068d804a",BUCKET="$PROJECT-sql-backup",DB="blaise"
