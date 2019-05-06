VENV=virtualenv
DOCKER=docker
DOCKER_TAG=splatnet2statink

setup:
	$(VENV) --python=python2 .

install:
	. bin/activate && pip install -r requirements.txt

run: opt = 
run:
	. bin/activate && python splatnet2statink.py $(opt)

run/salmon:
	$(MAKE) run opt='--salmon -r'

run/docker: opt=
run/docker: build/docker
	$(DOCKER) run $(DOCKER_TAG) $(opt)

run/docker/salmon:
	$(MAKE) run/docker opt='--salmon -r'

build/docker:
	$(DOCKER) build -t $(DOCKER_TAG) .

config/%:
	cp -f config.txt.$* config.txt
