build: dist/index.html

size: dist/index.html
	@cat dist/index.html | wc -c | numfmt --to=iec-i --suffix=B --padding=7

dist/index.html: index.html
	mkdir -p dist/
	./node_modules/.bin/htmlmin --collapse-whitespace $< -o $@

open: dist/index.html
	open dist/index.html
