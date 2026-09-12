# Configurar github actions self-hosted

mkdir actions-runner && cd actions-runner

# Download the runner archive from the GitHub-provided URL
tar xzf actions-runner-linux-x64-*.tar.gz

./config.sh \
  --url https://github.com/OWNER/REPO \
  --token REGISTRATION_TOKEN \
  --name eks-dev-runner \
  --labels eks,private \
  --work _work

./run.sh

# Persistent service

sudo ./svc.sh install ubuntu
sudo ./svc.sh start

# Use it in a workflow

jobs:
  deploy:
    runs-on: [self-hosted, eks, private]

# Install psql
https://dev.to/johndotowl/postgresql-17-installation-on-ubuntu-2404-5bfi