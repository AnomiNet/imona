all: container

.PHONY: container

container: vendor/cache
	docker build -t anomi-web .
	
vendor/cache:	Gemfile
	bundle package

clean:
	rm -rf vendor/bundle vendor/cache
