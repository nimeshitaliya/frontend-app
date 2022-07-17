DOCKERHUB_USERNAME=nitaliya
DOCKERHUB_REPO=frontend-server
LOCAL_TAG=latest
REPO_TAG=latest

install:
	npm install

build:
	npm run build -- --base-href ./

docker-frontend-server:
	docker build -t $(DOCKERHUB_REPO):$(LOCAL_TAG) . -f Dockerfile

docker-tag:
	docker tag $(DOCKERHUB_REPO):$(LOCAL_TAG) $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPO):$(REPO_TAG)

docker-push:
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPO):$(REPO_TAG)

all: docker-frontend-server docker-tag docker-push
