bin = ./node_modules/.bin

__blue = $$(tput setaf 4)
__normal = $$(tput sgr0)

title = $(shell pwd | xargs basename)
log = printf "$(__blue)$(title): $(__normal) %s\\n"

build: dist/index.html

size: dist/index.html
	@cat dist/index.html | wc -c | numfmt --to=iec-i --suffix=B --padding=7

dist/index.html: index.html
	@$(log) "Building..."
	@mkdir -p dist/
	@./node_modules/.bin/htmlmin --collapse-whitespace $< -o $@

open: dist/index.html
	@$(log) "Opening..."
	@open dist/index.html

.PHONY: format
format:
	@$(bin)/prettier . --check

.PHONY: format.fix
format.fix:
	@$(bin)/prettier . --write

.PHONY: check
check: format

.PHONY: fix
fix: format.fix
