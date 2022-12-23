images := comment post ui prometheus
USER_NAME ?= humster88
build-all := $(foreach image,$(images),build-$(image))
push-all := $(foreach image,$(images),push-$(image))

build-and-push: build push

build: $(build-all)

build-comment:
	docker build -f src/comment/Dockerfile -t ${USER_NAME}/comment src/comment

build-post:
	docker build -f src/post-py/Dockerfile -t ${USER_NAME}/post src/post-py

build-ui:
	docker build -f src/ui/Dockerfile -t ${USER_NAME}/ui src/ui

build-prometheus:
	docker build -f monitoring/prometheus/Dockerfile -t ${USER_NAME}/prometheus monitoring/prometheus

push: $(push-all)

push-comment:
	docker push $(USER_NAME)/comment

push-post:
	docker push $(USER_NAME)/post

push-ui:
	docker push $(USER_NAME)/ui

push-prometheus:
	docker push $(USER_NAME)/prometheus
