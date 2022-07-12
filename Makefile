TAG?=0.1
IMAGE?=imagename:$(TAG)
BUILDKIT_HOST?=tcp://address:port

default: buildctl

.PHONY: buildctl

buildctl:
	buildctl build --frontend dockerfile.v0 --local context=. \
	  --local dockerfile=. --opt filename=Dockerfile \
	  --output type=image,"name=$(IMAGE)",push=true,registry.insecure=true

docker:
	docker build -t $(IMAGE) .
	docker push $(IMAGE)
