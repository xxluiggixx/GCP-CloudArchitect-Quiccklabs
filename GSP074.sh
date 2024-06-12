echo 'In this hands-on lab you will learn how to use Google Cloud command line to:

    * Create a storage bucket
    * Upload objects to the bucket
    * Create folders and subfolders in the bucket
    * Make objects in a storage bucket publicly accessible'
##########################################################    
read -p 'Ingress location: ' LOCATION
read -p 'Ingress REGION: ' REGION

gcloud config set compute/region "$REGION"

PROJECT_ID=$(gcloud config get-value project)

echo '###########################################'
echo '######### Task 1. Create a bucket ##########'
echo '###########################################'
gcloud storage buckets create gs://$PROJECT_ID --default-storage-class=standard --location=$LOCATION  --uniform-bucket-level-access --no-public-access-prevention

echo '###########################################'
echo '####### Download image #############'
echo '###########################################'

curl https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg --output ada.jpg

echo '###########################################'
echo '######### Task 2: Upload an object into your bucket ##########'
echo '###########################################'

gcloud storage cp ada.jpg gs://$PROJECT_ID
rm ada.jpg

echo '###########################################'
echo '####### Task 3: Download an object from your bucket #########'
echo '###########################################'

gcloud storage cp gs://$PROJECT_ID/ada.jpg .

echo '###########################################'
echo '####### Task 4: Copy an object to a folder in the bucket #########'
echo '###########################################'

gcloud storage cp gs://$PROJECT_ID/ada.jpg gs://$PROJECT_ID/image-folder/

echo '###########################################'
echo '####### Task 5: List contents of a bucket or folder #########'
echo '###########################################'

gcloud storage ls gs://$PROJECT_ID

echo '###########################################'
echo '####### Task 6: List details for an object #########'
echo '###########################################'

gcloud storage ls -l  gs://$PROJECT_ID/ada.jpg

echo '###########################################'
echo '####### Task 7. Make your object publicly accessible #########'
echo '###########################################'

gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/ada.jpg

echo '###########################################'
echo '####### Task 8. Remove public access #########'
echo '###########################################'

gsutil acl ch -d AllUsers gs://$PROJECT_ID/ada.jpg

echo '###########################################'
echo '####### Delete Objects #########'
echo '###########################################'

gcloud storage rm  gs://$PROJECT_ID/ada.jpg

echo 'DONE'