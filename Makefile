PROJECT=crystalbooks

all: build 

build:
	@crystal build src/main.cr -o bin/crystalbooks
