# CloudSQL Backup

Backup CloudSQL databases to Google Cloud Storage buckets.

## Usage

- Either create or reuse an existing service account to run the function, which has the following permission: 
  - `cloudsql.instances.export`
- Deploy this function to a Cloud Function with the following parameters:
  - Memory Allocated: 128 MiB
  - Trigger: HTTP or Topic
  - Runtime: Node.js 10
  - Function to execute: exportDatabase
  - Timeout: 60 seconds
  - Ingress settings: Allow all traffic
  - Environment variables:
    - PROJECT: your_project_id
    - INSTANCE: cloudsql_instance_storing_db
    - BUCKET: target_bucket_for_backup
    - DB: db_to_backup
- The export runs as the database instance default service account, *not* the service account of the function invoker - as such this requires the following permissions:
  - `roles/storage.objectCreator` - To create the backup object
  - `roles/storage.objectViewer` - To validate the backup object

