USER=dgisolfi
IMAGE=war-docs

MAKE:
	@make clean
	@make build
	@make run

intro:
	@echo "WAR Docs v1.0\n"

clean:
	-docker kill $(CONTAINER)
	-docker rm $(CONTAINER)
	-docker rmi $(IMAGE)

build: intro
	@docker build -t $(IMAGE) .

# Push Docker image to Docker Hub
publish: build
	@docker tag $(IMAGE) $(USER)/$(IMAGE)
	@docker push $(USER)/$(IMAGE)

.PHONY: intro clean build run