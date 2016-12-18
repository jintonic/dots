$latex='latex --src %O %S';
$pdflatex='pdflatex -synctex=1 %O %S';
$mac=`/sbin/ifconfig | head -1 | awk '{printf("%s", \$5)}' | sed 's/://g'`;
$dvi_previewer="start xdvi -editor \"gvim -v --servername $mac --remote-silent +%l %f\" %O %S";
$pdf_previewer='start xpdf -remote %R %O %S'; # %R is the file name without suffix
$pdf_update_method=4; # run $pdf_update_command to do the update
$pdf_update_command='xpdf -remote %R -reload';
$clean_ext = "bbl spl nav out snm";
