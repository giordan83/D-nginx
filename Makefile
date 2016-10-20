# Build the image.
.PHONY: build
build:
	docker build -t giordan/d-nginx -f Dockerfile .

# Stop and remove all containers.
.PHONY: clean
clean:
	docker stop nginx-container
	docker rm nginx-container

# Remove the image.
.PHONY: clean-image
clean-image:
	docker rmi giordan/d-nginx

# List all containers.
.PHONY: ls
ls:
	docker ps -a

# List all images.
.PHONY: ls-images
ls-images:
	docker images

# Run the interactive container.
.PHONY: run
run:
	docker run -i -t --name nginx-container giordan/d-nginx
