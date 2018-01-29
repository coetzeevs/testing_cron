all: package

PACKAGE_NAME = oblivion-currency-exchange
PACKAGE_VERSION = 0.1~git.$(COMMIT_DATE).$(COMMIT_HASH)
PACKAGE_FILE = $(PACKAGE_NAME)_$(PACKAGE_VERSION)_amd64.deb
COMMIT_DATE = $(shell git show $(COMMIT_HASH) -s --format='%cd' --date='format:%Y%m%dT%H%MZ')
COMMIT_HASH = $(shell git rev-parse --short HEAD)

package: $(PACKAGE_FILE)

$(PACKAGE_FILE): dist
	fpm -s dir -t deb -f --log error \
	  -n $(PACKAGE_NAME) \
	  -v $(PACKAGE_VERSION) \
	  --deb-user movercado \
	  --deb-group movercado \
	  --after-install scripts/postinst.sh.erb \
	  --before-remove scripts/prerm.sh.erb \
	  --template-scripts \
	  -d 'python3-venv' \
	  -d 'libpq-dev' \
	  systemd/=/lib/systemd/system/ \
	  dist/=/opt/$(PACKAGE_NAME)/

FILES = $(shell git ls-files | sed 's: :\\ :g')

dist: $(FILES)
	@rm -rf dist && mkdir dist
	git archive HEAD | tar -xC dist

TO = oblivion.movercado.org

deploy: $(PACKAGE_FILE)
	rsync -P $(PACKAGE_FILE) data@$(TO):
	ssh data@$(TO) 'sudo dpkg -i $(PACKAGE_FILE); sudo apt-get -f install; rm $(PACKAGE_FILE)'

deployed:
	@ssh data@$(TO) 'dpkg-query -W $(PACKAGE_NAME)'

clobber:
	rm -rf dist
	rm -f $(PACKAGE_NAME)_*.deb
