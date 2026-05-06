resource "kubernetes_deployment" "flask_app" {
  metadata {
    name      = "educational-app"
    namespace = kubernetes_namespace.terraform_lab.metadata.0.name
    labels = {
      app = "educational-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "educational-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "educational-app"
        }
      }
      spec {
        container {
          # Используем ТОЧНОЕ имя и ТОЧНЫЙ хеш из вывода ctr
          image = "stmaan/educationalcicd@sha256:14e8fe8b662a04ab57d64412998c29893f24e6476cb32e3bc9ee55167a4108a8"
          name  = "flask-container"
          
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_service" {
  metadata {
    name      = "flask-service"
    namespace = kubernetes_namespace.terraform_lab.metadata.0.name
  }
  spec {
    selector = {
      app = "educational-app"
    }
    port {
      port        = 80
      target_port = 5000
      node_port   = 30085
    }
    type = "NodePort"
  }
}
