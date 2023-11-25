DARWIN_TARGET_ENV=GOOS=darwin GOARCH=arm64
LINUX_TARGET_ENV=GOOS=linux GOARCH=amd64

BUILD=go build

DOCKER_BUILD=sudo docker build
DOCKER_BUILD_OPTS=--no-cache

DOCKER_RMI=sudo docker rmi -f

DESTDIR=.
TAG=isupipe:latest

.PHONY: build
build:
	CGO_ENABLED=0 $(LINUX_TARGET_ENV)  $(BUILD) -o $(DESTDIR)/isupipe -ldflags "-s -w"

.PHONY: darwin
darwin:
	CGO_ENABLED=0 $(DARWIN_TARGET_ENV) $(BUILD) -o $(DESTDIR)/isupipe_darwin -ldflags "-s -w"

.PHONY: docker_image
docker_image: clean build
	$(DOCKER_BUILD) -t $(TAG) . $(DOCKER_BUILD_OPTS)

.PHONY: clean
clean:
	$(DOCKER_RMI) -f $(TAG)
	
.PHONY: logrotate
logrotate: kataribe.log mysqldumpslow.log

kataribe.log: /var/log/nginx/access.log
	kataribe < $< > $@
	slackcat -c kataribe -n $@ --comment "hostname=$(shell hostname) $(shell git log -1)" < $@
	cp -f $< $<.bak
	> $<

mysqldumpslow.log: /var/log/mysql/mysql-slow.log
	mysqldumpslow -s t $< > $@
	slackcat -c slowlog -n $@ --comment "hostname=$(shell hostname) $(shell git log -1)" < $@
	cp -f $< $<.bak
	> $<
