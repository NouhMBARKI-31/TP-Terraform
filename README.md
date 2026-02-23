# TP Noté — Déployer 2 VMs avec Load Balancer sur Azure via Terraform

**Étudiant :** Nouh MBARKI  
**Établissement :** Institut Limayrac  
**Date :** 23/02/2026

---

## 📋 Description du projet

Déploiement d'une infrastructure Azure complète avec Terraform comprenant 2 machines virtuelles Linux exécutant chacune un serveur web Nginx, accessibles derrière un Load Balancer public.

---

## 🏗️ Infrastructure déployée (16 ressources)

| Ressource | Nom | Description |
|-----------|-----|-------------|
| Resource Group | `tp-azure-rg` | Conteneur de toutes les ressources |
| Virtual Network | `tp-azure-vnet` | Réseau virtuel (10.0.0.0/16) |
| Subnet | `tp-azure-subnet` | Sous-réseau (10.0.1.0/24) |
| Network Security Group | `tp-azure-nsg` | Règles firewall (SSH, HTTP, deny-all) |
| NSG Association | — | Association NSG ↔ Subnet |
| NIC 1 | `tp-azure-nic-1` | Interface réseau VM1 |
| NIC 2 | `tp-azure-nic-2` | Interface réseau VM2 |
| VM Linux 1 | `tp-azure-vm-1` | Ubuntu 22.04 LTS + Nginx |
| VM Linux 2 | `tp-azure-vm-2` | Ubuntu 22.04 LTS + Nginx |
| Public IP | `tp-azure-lb-pip` | IP publique du Load Balancer |
| Load Balancer | `tp-azure-lb` | Load Balancer SKU Standard |
| Backend Pool | `tp-azure-backend-pool` | Pool des 2 VMs |
| NIC1 ↔ Backend | — | Association NIC1 au backend pool |
| NIC2 ↔ Backend | — | Association NIC2 au backend pool |
| Health Probe | `tp-azure-http-probe` | Sonde HTTP port 80 |
| LB Rule | `tp-azure-http-rule` | Règle port 80 → 80 |

---

## 📁 Structure du projet

```
TP-Terraform/
├── .gitignore       # Fichiers ignorés par Git
├── README.md        # Ce fichier
├── versions.tf      # Versions Terraform et provider
├── provider.tf      # Configuration du provider Azure
├── variables.tf     # Déclaration des variables
├── main.tf          # Toutes les ressources Azure
└── outputs.tf       # Outputs (IP LB, RG, Subnet, VNET)
```

---

## 🚀 Commandes utilisées

```bash
terraform init    # Initialisation du projet
terraform plan    # Vérification du plan
terraform apply   # Déploiement de l'infrastructure
terraform destroy # Suppression de l'infrastructure
```

---

## 📸 Captures d'écran

### Capture 1 — terraform plan

Résultat de la commande `terraform plan` montrant les 16 ressources Azure qui seront créées : Resource Group, VNET, Subnet, NSG avec ses règles firewall, 2 NICs, 2 VMs Linux Ubuntu, Load Balancer, Backend Pool, Health Probe et Load Balancing Rule. Aucune erreur détectée.

![terraform plan](captures/captures_plan.png)

---

### Capture 2 — terraform apply

Résultat de la commande `terraform apply` confirmant la création réussie des 16 ressources Azure en région Switzerland North. L'output affiche l'IP publique du Load Balancer : `20.203.209.247`.

![terraform apply](captures/captures_apply.png)

---

### Capture 3 — Accès web via le Load Balancer

Test d'accès HTTP via la commande `curl http://20.203.209.247` répétée plusieurs fois. On voit le Load Balancer distribuer le trafic alternativement entre VM-1 et VM-2, ce qui prouve que Nginx est bien installé sur les deux machines et que le Load Balancer fonctionne correctement.

![acces web load balancer](captures/captures_curl.png)

---

### Capture 4 — terraform destroy

Résultat de la commande `terraform destroy` confirmant la suppression complète des 16 ressources Azure, évitant ainsi toute consommation inutile du crédit étudiant Azure.

![terraform destroy](captures/captures_destroy.png)

---

## 🔗 Lien GitHub

[https://github.com/NouhMBARKI-31/TP-Terraform](https://github.com/NouhMBARKI-31/TP-Terraform)
