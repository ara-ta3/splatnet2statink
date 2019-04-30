VENV=virtualenv

setup:
	$(VENV) --python=python2 .

install:
	. bin/activate && pip install -r requirements.txt

run: opt = 
run:
	. bin/activate && python splatnet2statink.py $(opt)

run/salmon:
	$(MAKE) run opt='--salmon -r'
