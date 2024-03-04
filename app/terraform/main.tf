resource "kubernetes_namespace" "uni-devops" {
    metadata {
        name = "uni-devops"
    }
}

resource "kubernetes_deployment" "webserver" {
    metadata {
        name = "webserver-click"
        namespace = kubernetes_namespace.uni-devops.metadata[0].name
    }

    spec {
        replicas = 3

        selector {
            match_labels = {
                app = "webserver-click"
            }
        }

        template {
            metadata {
                labels = {
                    app = "webserver-click"
                }
            }

            spec {
                container {
                    name  = "webserver-click"
                    image = "justingebert/devops-testapp:latest"

                    port {
                        container_port = 3000
                    }

                    env {
                        name  = "MONGO_URI"
                        value = "mongodb://mongodb-0.mongodb.default.svc.cluster.local/testapp"
                    }
                }
            }
        }
    }
}

resource "kubernetes_service" "webserver" {
    metadata {
        name      = "webserver-service"
        namespace = kubernetes_namespace.uni-devops.metadata[0].name
    }

    spec {
        selector = {
            app = "webserver-click"
        }

        port {
            port        = 3000
            target_port = 3000
            node_port   = 32000
        }

        type = "NodePort"
    }
}

resource "kubernetes_stateful_set" "mongodb" {
    metadata {
        name      = "mongodb"
        namespace = kubernetes_namespace.uni-devops.metadata[0].name
    }

    spec {
        replicas = 1
        selector {
            match_labels = {
                app = "mongodb"
            }
        }

        service_name = "mongodb"
        template {
            metadata {
                labels = {
                    app = "mongodb"
                }
            }

            spec {
                container {
                    name  = "mongodb"
                    image = "mongo:latest"

                    port {
                        container_port = 27017
                    }

                    volume_mount {
                        name       = "mongodb-data"
                        mount_path = "/data/db"
                    }
                }
            }
        }

        volume_claim_template {
            metadata {
                name = "mongodb-data"
            }

            spec {
                access_modes = ["ReadWriteOnce"]
                resources {
                    requests = {
                        storage = "1Gi"
                    }
                }
            }
        }
    }
}

resource "kubernetes_service" "mongodb" {
    metadata {
        name      = "mongodb"
        namespace = kubernetes_namespace.uni-devops.metadata[0].name
    }

    spec {
        cluster_ip = "None"
        selector = {
            app = "mongodb"
        }

        port {
            port        = 27017
            target_port = 27017
        }
    }
}
