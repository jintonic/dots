dots - ~/.*

If it is the first installation, run

  $ make bundle

before run

  $ make

## vifm

```sh
./configure --prefix=/absolute/path --disable-extended-keys --disable-desktop-files --disable-build-timestamp --with-gtk=no --with-libmagic=no --with-X11=no --with-dyn-X11=no
```
Disable X11 so that it can run quickly in a ssh session without X11. One can rely on `mimeopen` to open files, there is no need to use `gtk` or `libmagic`.

## w3m

It depends on [GC](http://www.hboehm.info/gc/). Compile it with the following configuration if GC is not installed in the standard location:

```sh
./configure --with-gc=/for/example/usr/local
```

The official package from http://w3m.sourceforge.net/ has to be patched to compile:

```sh
cd /path/to/w3m
patch < w3m-istream.diff
patch < w3m-fix-compile.patch
```

`w3m-istream.diff` can be downloaded from https://sourceforge.net/p/w3m/patches/58/
`w3m-fix-compile.patch` can be downloaded from https://lists.gnu.org/archive/html/bug-guix/2013-03/msg00018.html

An easier way is to compile the Debian version from https://github.com/tats/w3m
