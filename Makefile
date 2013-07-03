EXCLUDE=README.md
EXCLUDE+=Makefile
TARGETS=$(filter-out $(EXCLUDE), $(wildcard *))

all:$(TARGETS)

ctags:
	cp $@ ~/.$@

vim:
	cp $@rc ~/.$@rc
	cat $@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add | sort | uniq > /tmp/jspell
	cp /tmp/jspell $@/spell/en.utf-8.add
	mkdir -p ~/.$@/spell
	mv /tmp/jspell ~/.$@/spell/en.utf-8.add
	vim -X ~/.$@/spell/en.utf-8.add "+mkspell! %" "+q"
	mkdir -p ~/.$@/syntax
	cp $@/syntax/* ~/.$@/syntax
	mkdir -p ~/.$@/ftplugin
	cp $@/ftplugin/* ~/.$@/ftplugin
	mkdir -p ~/.$@/snippets
	cp $@/snippets/* ~/.$@/snippets
	mkdir -p ~/.$@/plugin
	cp $@/plugin/* ~/.$@/plugin
	mkdir -p ~/.$@/dic
	cp $@/dic/* ~/.$@/dic

info:
	@echo $(TARGETS)

.PHONY:all clean info $(TARGETS)
