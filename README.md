Welcome to my test submission. In this repository, you'll find the files to the tasks.

## Tasks Overview

### Task 1: Dockerize Node.js Application and CI/CD 

#### Dockerfile
- The Dockerfile is located at the root of the repository.
- It creates the smallest possible Docker image.
- The Node.js app runs as the user "app"

**Note:** the files for Node.js are not added to avoid confusion and provide better understanding of the Dockerfile.
  
#### GitHub Actions Workflow
- The GitHub Actions workflow is defined in workflows/source.yml.
- The workflow builds the Docker image, pushes it to Docker Hub, and deploys it.
- Deployment is skipped if the branch name is "test"
- The git branch name is set as the environment variable "DEPLOYED_FROM" at build-time.

**Note:** 1: the path for workflow should be like : .github/workflows/source.yml.  But I changed it to avoid running the job.
          2: to deploy we have to add kubeconfig as secret in github for the deployment which I have mentioned in CI/CD. or the best approach is using ArgoCD for deployment, which has 
             different steps to follow. 
          3: Add password as secret in Github. (Go to the "Settings" tab --> click on "Secrets." --> Click on the "New repository secret" button, and add it)


### Task 2: Kubernetes Manifests

- Kubernetes manifests are located in the root of the repository.
- The manifests ensure the app is reachable from inside and outside the cluster, for which I have used loadbalancer service.
- Automatic restarts are configured when the app is not live using controller and also liveness and readiness probe
- The app is limited to using 500Mi of memory and 500 milli CPU.

**Note:** I have also used secret.yaml file to pass credentials securely. we shouldnt maintain the secret.yaml in version control system, so I have not included that.

### Task 3: Helm Chart

- The Helm chart is organized in  my-nodejs-app/templates/.
- The Helm chart includes a values file and It generates a ConfigMap from key:value pairs provided in values.yaml.

### Bonus Task: Server Detection Shell Script

- The server detection shell script is server_detection.sh.
- It determines whether the remote server is Windows or Linux.



