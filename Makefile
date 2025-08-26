# Nome da imagem
IMAGE_NAME=flask-app
CONTAINER_NAME=flask-container

# Porta do app Flask
PORT=5000

# Build da imagem
build:
	DOCKER_BUILDKIT=0 docker build -t $(IMAGE_NAME) .

# Rodar container (interativo)
run:
	docker run --name $(CONTAINER_NAME) -p $(PORT):5000 $(IMAGE_NAME)

# Rodar em background
up:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):5000 $(IMAGE_NAME)

# Parar e remover container
down:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Rebuild (remove container antigo e builda de novo)
rebuild: down build up

# Abrir shell dentro do container
shell:
	docker exec -it $(CONTAINER_NAME) bash

# Logs do container
logs:
	docker logs -f $(CONTAINER_NAME)
