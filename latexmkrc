# vim: ft=perl:
@default_files = ('main.tex'); # only process main.tex
$clean_ext = "spl nav out snm";
$bibtex_use=1; # only use bibtex or biber if the bib files exist; never delete .bbl files in a cleanup

# dvi
$latex='latex --src %O %S';
$CPU=`awk 'NR==8{printf("%s", \$4)}' /proc/cpuinfo`;
$dvi_previewer="start xdvi -editor \"gvim -v --servername $CPU --remote-silent +%l %f\" %O %S";

# pdf, turn it on by set $pdf_mode=1, or latexmk -pdf
$pdflatex='pdflatex -synctex=1 %O %S';
if ( $^O eq "darwin" ) {{
    $pdf_previewer='open -a Skim';
    $pdf_update_method=0; # skim can automatically update itself
  }} elsif ( $^O eq "cygwin" ) {{
    $pdf_previewer='"c:/Program Files/SumatraPDF/SumatraPDF.exe"';
    $pdf_update_method=3;
    #$pdf_previewer='start xpdf -remote %R %O %S'; # %R is the file name without suffix
    #$pdf_update_method=4; # run $pdf_update_command to do the update
    #$pdf_update_command='xpdf -remote %R -reload';
  }} else {{
    $pdf_update_method=2; # latexmk send SIGHUP signal to $pdf_previewer
    $pdf_previewer='mupdf-x11';
  }};
