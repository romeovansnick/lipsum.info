build: dist/index.html

dist/index.html: index.html
	mkdir -p dist/
	./node_modules/.bin/htmlmin --collapse-whitespace $< -o $@

open: dist/index.html
	open dist/index.html
