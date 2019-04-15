gcloud auth login
gcloud projects create smart-nnov --name "Nizhniy Novgorod Smart GIS"
gcloud config set project smart-nnov

gcloud iam service-accounts create --project=smart-nnov
gcloud projects add-iam-policy-binding smart-nnov --member serviceAccount:terraform@smart-nnov.iam.gserviceaccount.com --role roles/owner
gcloud iam service-accounts keys create ~/projects/nnov/terraform/gce_key.json --iam-account=terraform@smart-nnov.iam.gserviceaccount.com

gcloud alpha bliing accounts list

gcloud alpha billing projects link --account-id <Your account> smart-nnov
gcloud services enable --project smart-nnov serviceusage.googleapis.com

terraform apply

gcloud container clusters get-credentials nnov-development
kkubectl config set-context gke_smart-nnov_us-central1-b_nnov-development
