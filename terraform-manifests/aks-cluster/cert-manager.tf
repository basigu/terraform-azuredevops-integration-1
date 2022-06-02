# resource "helm_release" "cert-manager" {
#     name        = "cert-manager"
#     chart       = "cert-manager"
#     repository  = "https://charts.jetstack.io"
#     namespace   = kubernetes_namespace.ingress_namespace.metadata.0.name
#     version     = var.cert-manager-version
#      set {
#       name  = "installCRDs"
#       value = true
#     }
#     set {
#       name = "ingressShim.defaultIssuerName"
#       value = "letsencrypt-prod"
#     }
#     set {
#       name = "ingressShim.defaultIssuerKind"
#       value = "ClusterIssuer"
#     }
   
#     depends_on = [helm_release.ingress-nginx]
# }
# resource "kubectl_manifest" "cluster-issuer" {
#     yaml_body = file("./kube-manifests/cluster-issuer.yaml")

#     depends_on = [
#       helm_release.cert-manager
#     ]
# }

#ttps://github.com/terraform-iaac/terraform-kubernetes-cert-manager

module "cert_manager" {
  source        = "terraform-iaac/cert-manager/kubernetes"

  cluster_issuer_email                   = "basi_gu@hotmail.com"
  cluster_issuer_name                    = "cert-manager-global"
  cluster_issuer_private_key_secret_name = "cert-manager-private-key"
}