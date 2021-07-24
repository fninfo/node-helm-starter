# node-template
Starter project for Helm (K8S) Node JS workflow. Provides useful dev environment.

## Local development

**Requirements:**
- Windows, WSL2 backend
- Docker Desktop, Kubernetes enabled
- Helm
- VSCode with "Kubernetes" and "Remote-containers" extensions
- Local docker registry. If not present, run the following command:
> docker run -d -p 5000:5000 --restart=always --name registry registry:2
- OPTIONAL: utility that can add npm packages without downloading them (otherwise downloaded content will be overwritten during the build stage). By the way, running `npm i *package*` inside container works without node/npm on local machine

### Setup guide
1. Copy files from this repo into your project, excluding .git (or use github template)
2. Do the global replace of "edit-me" with your chart name, "edit-description" with short description
3. Update mount path in ./chart/values.dev.yaml:volumes.hostPath.path starting with "drive". Note: drive letter must be specified in lowercase.

### package.json - no changes
Just save files; nodemon should perform the update automatically

### package.json modified (or it's the first run)
Execute the following commands to update current chart:

> docker build . --build-arg devmode="true" -t edit-me; docker tag edit-me localhost:5000/edit-me;  docker push localhost:5000/edit-me ; helm upgrade --install -f .\chart\values.dev.yaml edit-me ./chart; kubectl rollout restart deployment edit-me; docker image prune -f

Override secrets via `-f .\chart\secrets.yaml` if you created file with secrets

If you're creating something complex and want to test prod values, replace `.\chart\values.dev.yaml` with `.\chart\values.yaml`. This will also disable nodemon.

### How to uninstall your app
> helm uninstall edit-me