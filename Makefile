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

info:
	@echo $(TARGETS)

.PHONY:all clean info $(TARGETS)
