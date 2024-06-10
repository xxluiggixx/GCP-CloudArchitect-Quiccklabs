
read -p 'Ingress location' LOCATION
read -p 'Ingress region: ' REGION

PROJECT_ID=$(gcloud config get-value project)

gcloud storage buckets create gs://$PROJECT_ID --default-storage-class=standard --location=$LOCATION --placement=$REGION --uniform-bucket-level-access --no-public-access-prevention