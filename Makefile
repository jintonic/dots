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

EXCLUDE=README.md Makefile fonts pygments rover.patch youtube-dl mutt
ifeq ($(ARC),Windows)
  EXCLUDE+=asoundrc xsession root rootrc
else
  EXCLUDE+=minttyrc startxwinrc
endif
TARGETS=$(filter-out $(EXCLUDE), $(wildcard *))
TARGETS+=bin terminfo nano ytdl fluxbox
NANOVERSION=$(shell nano --version | head -1 | awk -F. '{print $$2}')

all:$(TARGETS)

asoundrc:
	n=`lspci|grep audio|wc -l`; if [ $$n != "1" ]; then ln -sf $(PWD)/$@ ~/.$@; fi

a2psrc:
	mkdir -p ~/.a2ps
	ln -sf $(PWD)/$@ ~/.a2ps/$@

bashrc:
	ln -sf $(PWD)/$@ ~/.$@

bin:
	mkdir -p ~/$@
	for each in `ls -1 $@`; do ln -sf $(PWD)/$@/$$each ~/$@/; done

ctags:
	ln -sf $(PWD)/$@ ~/.$@

dircolors:
	ln -sf $(PWD)/$@ ~/.$@

fluxbox:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/apps ~/.$@/apps
	ln -sf $(PWD)/$@/keys ~/.$@/keys
	ln -sf $(PWD)/$@/overlay ~/.$@/overlay
fonts:
	mkdir -p ~/git/
	if [ -d ~/git/powerline-fonts ]; then \
	  cd ~/git/powerline-fonts && git pull && install.sh; \
	else \
	  cd ~/git; \
	  git clone https://github.com/powerline/fonts.git powerline-fonts; \
	fi

gitconfig:
	ln -sf $(PWD)/$@ ~/.$@

hvrc:
	ln -sf $(PWD)/$@ ~/.$@

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

mutt:
	mkdir -p ~/.$@
	mkdir -p ~/.$@/cache
	ln -sf $(PWD)/$@/color ~/.$@/color
	ln -sf $(PWD)/$@/sign ~/.$@/sign
	ln -sf $(PWD)/$@/mailcap ~/.$@/mailcap
	ln -sf $(PWD)/$@/muttrc ~/.$@/muttrc

nano:
	if [ $(NANOVERSION) -gt 6 ]; then \
	  ln -sf $(PWD)/$@7rc ~/.$@rc; \
	else \
	  ln -sf $(PWD)/$@rc ~/.$@rc; \
	fi
	if [ -d ~/git/$@rc ]; then \
	  cd ~/git/$@rc && git pull; \
	else \
	  cd ~/git; \
	  git clone https://github.com/jintonic/$@rc.git; \
	fi

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

# cd /path/to/rover && git diff > rover.patch
# cd /path/to/rover && git apply rover.patch
rover:
	mkdir -p ~/git/
	if [ -d ~/git/$@ ]; then \
	  cd ~/git/$@ && git checkout -- '*' && git pull; \
	else \
	  cd ~/git && git clone https://github.com/lecram/$@.git; \
	fi
	cd ~/git/$@ && git apply ../dots/$@.patch
	if [ "$(ARC)" = "OSX" ]; then \
	  cd ~/git/$@ && LDFLAGS=-L/usr/local/Cellar/ncurses/6.0_4/lib CFLAGS=-I/usr/local/Cellar/ncurses/6.0_4/include make install; \
	else \
	  cd ~/git/$@ && make install; \
	fi

screenrc:
	if [ "$(ARC)" = "OSX" ]; then \
	  rm -f ~/.$@ && sed 's/deflogin/#deflogin/' $@ > ~/.$@;\
	else\
	  ln -sf $(PWD)/$@ ~/.$@;\
	fi
	mkdir -p ~/.screen && chmod 700 ~/.screen
	if [ "$(ARC)" = "Windows" ]; then rm -f /var/run/utmp; fi

scrc:
	ln -sf $(PWD)/$@ ~/.$@

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

getw3m:
	if [ -d ~/git/w3m ]; then \
	  cd ~/git/w3m && git pull;\
	else\
	  cd ~/git && git clone https://github.com/tats/w3m.git;\
	fi

ytdl:
	mkdir -p ~/.config/youtube-dl
	ln -sf $(PWD)/youtube-dl.conf ~/.config/youtube-dl/config

# https://wiki.vifm.info/index.php?title=Obtaining_Vifm
vifm:
	mkdir -p ~/.$@
	ln -sf $(PWD)/$@/$@rc ~/.$@/$@rc
	mkdir -p ~/.$@/colors
	ln -sf $(PWD)/$@/colors/solarized.$@ ~/.$@/colors/

vim:
	ln -sf $(PWD)/$@rc ~/.$@rc
	mkdir -p ~/.$@
	mkdir -p ~/.$@/dein/repos/github.com/Shougo/dein.vim
	cd ~/.$@/dein/repos/github.com/Shougo/dein.vim; \
	  if [ ! -f README.md ]; then \
	  git clone https://github.com/Shougo/dein.vim.git .; \
	  vim -X +"call dein#install()" +q; \
	  else git pull;\
	  vim -X +"call dein#update()" +q; \
	  fi
	ln -sf $(PWD)/$@/after ~/.$@/
	mkdir -p ~/.$@/dic
	ln -sf $(PWD)/$@/dic/* ~/.$@/dic
	mkdir -p ~/.$@/spell
	ln -sf $(PWD)/$@/spell/en.utf-8.add ~/.$@/spell/en.utf-8.add
	vim -X ~/.$@/spell/en.utf-8.add +"mkspell! %" +q

xfig:
	if [ ! -d ~/.xfig ]; then \
	  wget https://gsalam.web.cern.ch/gsalam/repository/software/Feynman_Diagrams.tgz; \
	  tar xfvz Feynman_Diagrams.tgz; rm -f Feynman_Diagrams.tgz; \
	  mv Feynman_Diagrams ~/.xfig; fi

# https://bugs.archlinux.org/task/50297
# some fonts are not available in gsfonts anymore, download them manually
xpdfrc:
	ln -sf $(PWD)/$@ ~/.$@
	if [ ! -d ~/git/gsfonts ]; then \
	  mkdir -p ~/git/gsfonts;\
	  cd ~/git/gsfonts;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n021003l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n021004l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n021023l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n019003l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n019004l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n019023l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n022003l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n022004l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/n022023l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/s050000l.pfb;\
	  wget https://github.com/frappe/fonts/raw/master/usr_share_fonts/type1/gsfonts/d050000l.pfb;\
	fi

xsession:
	ln -sf $(PWD)/$@ ~/.$@

Xdefaults:
	ln -sf $(PWD)/$@ ~/.$@

info:
	@echo $(TARGETS)

.PHONY:all clean info $(TARGETS)
