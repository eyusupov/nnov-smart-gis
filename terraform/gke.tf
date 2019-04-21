provider "google" {
	credentials = "${file("gce_key.json")}"
  region  = "us-central1"
  zone    = "us-central1-b"
	project = "smart-nnov"
}

# TODO: where are the extra services coming from?
resource "google_project_services" "nnov-services" {
  services = ["cloudresourcemanager.googleapis.com", "compute.googleapis.com", "container.googleapis.com", "serviceusage.googleapis.com", "oslogin.googleapis.com", "iam.googleapis.com", "containerregistry.googleapis.com", "iamcredentials.googleapis.com", "storage-api.googleapis.com", "bigquery-json.googleapis.com", "pubsub.googleapis.com"]
	project = "smart-nnov"
}

resource "google_compute_network" "nnov-dev-network" {
  name = "nnov-dev-network"
	project = "smart-nnov"
	depends_on = ["google_project_services.nnov-services"]
}

resource "google_container_cluster" "nnov-dev-cluster" {
  name = "nnov-development"
	network = "nnov-dev-network"
  initial_node_count = 2
	project = "smart-nnov"
	depends_on = ["google_project_services.nnov-services", "google_compute_network.nnov-dev-network"]
}

resource "google_compute_address" "postgis-ip-address" {
  name = "postgis-ip-address"
}

resource "google_compute_address" "martin-ip-address" {
  name = "martin-ip-address"
}

resource "kubernetes_service_account" "tiller" {
  metadata {
    name = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = "cluster-admin"
  }
  subject {
    kind = "ServiceAccount"
    namespace = "kube-system"
    name = "tiller"
  }
}
