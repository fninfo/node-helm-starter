# node-template
Starter project for Helm (K8S) Node JS workflow. Provides useful dev environment.

## Local development

**Requirements:**
- Windows, WSL2 backend
- Docker Desktop + Kubernetes
- VSCode with "Kubernetes" and "Remote-containers" extensions
- Local docker registry. If not present, run the following command:
> docker run -d -p 5000:5000 --restart=always --name registry registry:2

### Setup guide
1. Copy files from this repo into your project, excluding git (or use github template)
2. Do the global replace of "edit-me" with your chart name, "edit-description" with short description
3. Update mount path in ./chart/values.dev.yaml:volumes.hostPath.path

### package.json - no changes
Just save files; nodemon should perform the update automatically

### package.json modified (or first run)
Execute the following commands to update chart:

> docker build . -t edit-me; docker tag edit-me localhost:5000/edit-me;  docker push localhost:5000/edit-me ; helm upgrade --install -f .\chart\values.dev.yaml edit-me ./chart; kubectl rollout restart deployment edit-me; docker image prune -f

Override secrets via `-f .\chart\secrets.yaml` if you created it