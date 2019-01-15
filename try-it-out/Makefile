# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = SDPLabs
SOURCEDIR     = .
BUILDDIR      = _build
DOCSDIR       = docs

.PHONY: help Makefile docs build live deploy 

# Put it first so that "make" without argument is like "make help".
help: ## Show target options
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean: ## removes compiled documentation and jpi 
	rm -rf $(DOCSDIR)/$(BUILDDIR) build bin 

image: ## builds container image for building the documentation
	docker build $(DOCSDIR) -t sdp-labs-docs

docs: ## builds documentation in _build/html 
      ## run make docs live for hot reloading of edits during development
	make clean
	make image 
	$(eval goal := $(filter-out $@,$(MAKECMDGOALS)))
	@if [ "$(goal)" = "live" ]; then\
		cd $(DOCSDIR);\
		docker run -p 8000:8000 -v $(shell pwd)/$(DOCSDIR):/app sdp-docs sphinx-autobuild -b html $(ALLSPHINXOPTS) . $(BUILDDIR)/html -H 0.0.0.0;\
		cd - ;\
	elif [ "$(goal)" = "deploy" ]; then\
		$(eval old_remote := $(shell git remote get-url origin)) \
		git remote set-url origin https://$(user):$(token)@github.com/boozallen/sdp-labs.git ;\
		docker run -v $(shell pwd):/app sdp-docs sphinx-versioning push --show-banner docs gh-pages . ;\
		echo git remote set-url origin $(old_remote) ;\
		git remote set-url origin $(old_remote) ;\
	else\
		docker run -v $(shell pwd)/$(DOCSDIR):/app sdp-labs-docs $(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O) ;\
	fi

deploy: ; 
live: ;

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	echo "Make command $@ not found" 