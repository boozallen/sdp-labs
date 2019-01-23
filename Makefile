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

## Put it first so that "make" without argument is like "make help".
help: ## Show target options
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


clean: ## removes compiled documentation 
	rm -rf $(BUILDDIR)

image: ## builds the container image for documentation 
	docker build . -t sdp-labs-docs

docs: ## builds documentation in _build/html 
      ## run make docs live for hot reloading of edits during development
	make clean 
	make image

	@if [ "$(filter-out $@,$(MAKECMDGOALS))" = "live" ]; then\
		docker run -p 8000:8000 -v $(shell pwd):/app sdp-labs-docs sphinx-autobuild -b html $(ALLSPHINXOPTS) . $(BUILDDIR)/html -H 0.0.0.0;\
	else\
		docker run -v $(shell pwd):/app sdp-labs-docs $(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O);\
	fi

#push: 
#	make image 
#	make get-remote-docs
	# need to add sphinx-versioning command here when docs are ready to go public

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	echo "Make command $@ not found" 