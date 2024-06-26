
read -p 'Ingress location' LOCATION

PROJECT_ID=$(gcloud config get-value project)

gcloud storage buckets create gs://$PROJECT_ID --default-storage-class=standard --location=$LOCATION  --uniform-bucket-level-access --no-public-access-prevention