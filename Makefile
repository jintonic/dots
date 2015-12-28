# determine architecture
ARC=Linux
ifeq ($(OS),Windows_NT)
  ARC=Windows
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    ARC=OSX
  endif
endif

EXCLUDE=README.md
EXCLUDE+=Makefile
TARGETS=$(filter-out $(EXCLUDE), $(wildcard *))
TARGETS+=bin ssh_config terminfo

all:$(TARGETS)

asoundrc:
	ln -sf $(PWD)/$@ ~/.$@

bashrc:
	ln -sf $(PWD)/$@ ~/.$@

bin:
	mkdir -p ~/$@
	for each in `ls -1 $@`; do ln -sf $(PWD)/$@/$$each ~/$@/; done

bundle:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	cd ~/.vim/autoload/; if [ ! -f pathogen.vim ]; then curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim; fi
	cd ~/.vim/bundle; if [ -d tlib_vim ]; then cd tlib_vim; git pull; else git clone https://github.com/tomtom/tlib_vim.git; fi
	cd ~/.vim/bundle; if [ -d vim-addon-mw-utils ]; then cd vim-addon-mw-utils; git pull; else git clone https://github.com/MarcWeber/vim-addon-mw-utils.git; fi
	cd ~/.vim/bundle; if [ -d vim-snipmate ]; then cd vim-snipmate; git pull; else git clone https://github.com/garbas/vim-snipmate.git; fi
	cd ~/.vim/bundle; if [ -d vcscommand.vim ]; then cd vcscommand.vim; git pull; else git clone https://github.com/vim-scripts/vcscommand.vim.git; fi
	cd ~/.vim/bundle; if [ -d vim-fugitive ]; then cd vim-fugitive; git pull; else git clone git://github.com/tpope/vim-fugitive.git; fi
	cd ~/.vim/bundle; if [ -d supertab ]; then cd supertab; git pull; else git clone https://github.com/ervandew/supertab.git; fi
	cd ~/.vim/bundle; if [ -d L9 ]; then cd L9; git pull; else git clone https://github.com/vim-scripts/L9.git; fi
	cd ~/.vim/bundle; if [ -d FuzzyFinder ]; then cd FuzzyFinder; git pull; else git clone https://github.com/vim-scripts/FuzzyFinder.git; fi
	cd ~/.vim/bundle; if [ -d vim-markdown ]; then cd vim-markdown; git pull; else git clone https://github.com/plasticboy/vim-markdown.git; fi
	cd ~/.vim/bundle; if [ -d vim-colors-solarized ]; then cd vim-colors-solarized; git pull; else git clone https://github.com/altercation/vim-colors-solarized.git; fi
	cd ~/.vim/bundle; if [ -d vim-airline ]; then cd vim-airline; git pull; else git clone https://github.com/bling/vim-airline.git; fi
	vim -X "+Helptags" "+q"
	cd ~/.vim/bundle; if [ -d vim-liquid ]; then cd vim-liquid; git pull; else git clone https://github.com/tpope/vim-liquid.git; fi
	cd ~/.vim/bundle; if [ -d vim-surround ]; then cd vim-surround; git pull; else git clone https://github.com/tpope/vim-surround.git; fi
	cd ~/.vim/bundle; if [ -d vim-repeat ]; then cd vim-repeat; git pull; else git clone https://github.com/tpope/vim-repeat.git; fi
	vim -X "+Helptags" "+q"

ctags:
	ln -sf $(PWD)/$@ ~/.$@

dircolors:
	ln -sf $(PWD)/$@ ~/.$@

gitconfig:
	ln -sf $(PWD)/$@ ~/.$@

hvrc:
	ln -sf $(PWD)/$@ ~/.$@
	ln -sf $(PWD)/bin/hv ~/bin/hv

latexmkrc:
	ln -sf $(PWD)/$@ ~/.$@

lynx:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/lynx.cfg ~/.$@/lynx.cfg
	ln -sf $(PWD)/$@/lynx.lss ~/.$@/lynx.lss
	ln -sf $(PWD)/$@/jump.html ~/.$@/jump.html

mime.types:
	ln -sf $(PWD)/$@ ~/.$@

minttyrc:
	ln -sf $(PWD)/$@ ~/.$@

msmtprc:
	ln -sf $(PWD)/$@ ~/.$@

mutt:
	mkdir -p ~/.$@
	mkdir -p ~/.$@/cache
	ln -sf $(PWD)/$@/color ~/.$@/color
	ln -sf $(PWD)/$@/sign ~/.$@/sign
	ln -sf $(PWD)/$@/mailcap ~/.$@/mailcap
	ln -sf $(PWD)/$@/muttrc ~/.$@/muttrc

offlineimaprc:
	ln -sf $(PWD)/$@ ~/.$@

profile:
	ln -sf $(PWD)/$@ ~/.$@

pygments:
	curl 'https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py' | python
	rm -f setuptools*
	easy_install Pygments
rootrc:
	ln -sf $(PWD)/$@ ~/.$@

root:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/logon.C ~/.$@/logon.C

screenrc:
	ln -sf $(PWD)/$@ ~/.$@

scrc:
	ln -sf $(PWD)/$@ ~/.$@

ssh_config:
	ln -sf $(PWD)/ssh/config ~/.ssh

startxwinrc:
	ln -sf $(PWD)/$@ ~/.$@

terminfo:
	infocmp | sed 's/kbs=^H/kbs=\\177/' > /tmp/ti.src
	tic /tmp/ti.src
	rm -f /tmp/ti.src

w3m:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/cgi-bin ~/.$@
	ln -sf $(PWD)/$@/urimethodmap ~/.$@/urimethodmap
	ln -sf $(PWD)/$@/bookmark.html ~/.$@/bookmark.html
	ln -sf $(PWD)/$@/config ~/.$@/config
	ln -sf $(PWD)/$@/mailcap ~/.$@/mailcap
	ln -sf $(PWD)/$@/keymap ~/.$@/keymap

vifm:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/vifmrc ~/.$@/vifmrc
	mkdir -p ~/.$@/colors
	ln -sf $(PWD)/$@/colors/Default ~/.$@/colors/Default

vim:
	ln -sf $(PWD)/$@rc ~/.$@rc
	mkdir -p ~/.$@/after/syntax
	ln -sf $(PWD)/$@/syntax/* ~/.$@/after/syntax
	mkdir -p ~/.$@/after/ftplugin
	ln -sf $(PWD)/$@/ftplugin/* ~/.$@/after/ftplugin
	mkdir -p ~/.$@/after/snippets
	ln -sf $(PWD)/$@/snippets/* ~/.$@/after/snippets
	mkdir -p ~/.$@/after/plugin
	ln -sf $(PWD)/$@/plugin/* ~/.$@/after/plugin
	mkdir -p ~/.$@/after/colors
	ln -sf $(PWD)/$@/colors/* ~/.$@/after/colors
	mkdir -p ~/.$@/dic
	ln -sf $(PWD)/$@/dic/* ~/.$@/dic
	cat $@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add | sort | uniq > /tmp/jspell
	mv /tmp/jspell $@/spell/en.utf-8.add
	mkdir -p ~/.$@/spell
	ln -sf $(PWD)/$@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add
	vim -X ~/.$@/spell/en.utf-8.add "+mkspell! %" "+q"

xsession:
	ln -sf $(PWD)/$@ ~/.$@

Xdefaults:
	ln -sf $(PWD)/$@ ~/.$@
	touch ~/.startxwinrc

info:
	@echo $(TARGETS)

.PHONY:all clean info $(TARGETS)
