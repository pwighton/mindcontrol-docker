all: build

build:
	docker build -t pwighton/mindcontrol .

nc:
	docker build --no-cache -t pwighton/mindcontrol .

run:
	docker run -p 3000:3000 --rm pwighton/mindcontrol
