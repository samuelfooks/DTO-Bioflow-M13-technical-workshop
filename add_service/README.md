# 🔧 Add Service to EDITO

This section contains everything you need to deploy containerized web applications and services to EDITO Datalab.

## 🎯 What You'll Learn

- Dockerize R Shiny applications
- Push images to container registries
- Create Helm charts for Kubernetes deployment
- Deploy services to EDITO playground and production

## 📖 Getting Started

1. **Read the main guide**: `add_edito_service_slidedeck.md`
2. **Explore the example**: `view_parquet_service/` - A complete Shiny application
3. **View presentations**: `docs/add_service/` - Generated HTML/PDF slides

## 🚀 Quick Start

```bash
# Navigate to this section
cd add_service/

# Read the step-by-step guide
cat add_edito_service_slidedeck.md

# Explore the example service
cd view_parquet_service/
```

## 📁 Contents

- **`add_edito_service_slidedeck.md`** - Complete step-by-step guide
- **`view_parquet_service/`** - Example Shiny application showing:
  - R Shiny app structure (`ui.R`, `server.R`, `global.R`)
  - Dockerfile for containerization
  - Startup scripts and configuration
- **`docs/add_service/`** - Generated presentations (HTML/PDF)

## 🛠️ Prerequisites

- **Docker** - Containerization
- **GitLab account** - EDITO infrastructure access
- **Container registry** (GitHub Packages, Docker Hub, etc.)
- Basic knowledge of Docker and Kubernetes
- Understanding of R Shiny applications

## ⏱️ Time Required

**45-60 minutes** to complete the full service deployment process.

## 🔗 Related Resources

- [EDITO Datalab](https://datalab.dive.edito.eu/)
- [Service Playground Repository](https://gitlab.mercator-ocean.fr/pub/edito-infra/service-playground)
- [Docker Documentation](https://docs.docker.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)

---

**Ready to deploy your first service?** Start with `add_edito_service_slidedeck.md`! 🔧
