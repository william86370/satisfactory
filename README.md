# satisfactory
[![Anchore Container Scan](https://github.com/william86370/satisfactory/actions/workflows/anchore-analysis.yml/badge.svg?branch=main)](https://github.com/william86370/satisfactory/actions/workflows/anchore-analysis.yml)
[![Docker](https://github.com/william86370/satisfactory/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/william86370/satisfactory/actions/workflows/docker-publish.yml)

Just a simple satisfactory server in a container for ez hosting.

No matter which service or installation method the server needs a minimum of 4 GB RAM and 10 GB of storage space. 
It is recommended to run a server with 6+ GB RAM and more storage space to support 4+ players and or large/complex factories.
Ram usage on servers appears to be exactly the same as when loading the same save on client, your mileage may vary.

updated on: 2020-01-01
```bash
# Deploy Using Docker-Compose
git clone https://github.com/william86370/satisfactory
cd satisfactory
docker compose up -d
```