EXCLUDE=README.md
EXCLUDE+=Makefile
TARGETS=$(filter-out $(EXCLUDE), $(wildcard *))

all:$(TARGETS)

latexmk:
	cp $@ ~/.$@
ctags:
	cp $@ ~/.$@

vim:
	cp $@rc ~/.$@rc
	cat $@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add | sort | uniq > /tmp/jspell
	mv /tmp/jspell $@/spell/en.utf-8.add
	mkdir -p ~/.$@/spell
	ln -sf $(PWD)/$@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add
	vim -X ~/.$@/spell/en.utf-8.add "+mkspell! %" "+q"
	mkdir -p ~/.$@/after/syntax
	ln -sf $(PWD)/$@/syntax/* ~/.$@/after/syntax
	mkdir -p ~/.$@/after/ftplugin
	ln -sf $(PWD)/$@/ftplugin/* ~/.$@/after/ftplugin
	mkdir -p ~/.$@/after/snippets
	ln -sf $(PWD)/$@/snippets/* ~/.$@/after/snippets
	mkdir -p ~/.$@/after/plugin
	ln -sf $(PWD)/$@/plugin/* ~/.$@/after/plugin
	mkdir -p ~/.$@/dic
	ln -sf $(PWD)/$@/dic/* ~/.$@/dic

bundle:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	cd ~/.vim/bundle; if [ -d tlib_vim ]; then cd tlib_vim; git pull; else git clone https://github.com/tomtom/tlib_vim.git; fi
	cd ~/.vim/bundle; if [ -d vim-addon-mw-utils ]; then cd vim-addon-mw-utils; git pull; else git clone https://github.com/MarcWeber/vim-addon-mw-utils.git; fi
	cd ~/.vim/bundle; if [ -d vim-snipmate ]; then cd vim-snipmate; git pull; else git clone https://github.com/garbas/vim-snipmate.git; fi
	cd ~/.vim/bundle; if [ -d vcscommand.vim ]; then cd vcscommand.vim; git pull; else git clone https://github.com/vim-scripts/vcscommand.vim.git; fi
	cd ~/.vim/bundle; if [ -d supertab ]; then cd supertab; git pull; else git clone https://github.com/ervandew/supertab.git; fi
	cd ~/.vim/bundle; if [ -d L9 ]; then cd L9; git pull; else git clone https://github.com/vim-scripts/L9.git; fi
	cd ~/.vim/bundle; if [ -d FuzzyFinder ]; then cd FuzzyFinder; git pull; else git clone https://github.com/vim-scripts/FuzzyFinder.git; fi
	cd ~/.vim/bundle; if [ -d taskwarrior.vim ]; then cd taskwarrior.vim; git pull; else git clone https://github.com/framallo/taskwarrior.vim.git; fi
	vim -X "+Helptags" "+q"

info:
	@echo $(TARGETS)

.PHONY:all clean info $(TARGETS)
