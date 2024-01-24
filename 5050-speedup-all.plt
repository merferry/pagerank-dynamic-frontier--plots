set term pdf
set terminal pdf size 10in,6in font ",20"
set output '5050-speedup-all.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set title noenhanced
set style fill solid border lt -1
set style textbox opaque noborder
set lmargin 4.5
set tmargin 1
unset xtics
set logscale x 10
# set logscale y 10
set format x "10^{%L}"
set grid   y
set key off
set multiplot layout 3,4 margins 0.06,0.98,0.10,0.95 spacing 0.06,0.07
# set xlabel  'Batch fraction'
# set ylabel  'Speedup'


## Set line styles
set style line  1 linewidth 2 linetype 7 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 6 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 1 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1


## Draw plot
set label "Speedup" at screen 0.01,0.5 center rotate font ",18"
set label "Batch fraction" at screen 0.5,0.02 center font ",18"
files='indochina-2004 arabic-2005 uk-2005 webbase-2001 it-2004 sk-2005 com-LiveJournal com-Orkut asia_osm europe_osm kmer_A2a kmer_V1r'
do for [i=1:words(files)] {
set title word(files, i) offset 0,-0.8
set ytics auto
# if (i==7) { set ytics 1 }
if (i>=9) { set xtics rotate by 45 right }
plot '5050/'.word(files, i).'.csv' \
       using 4:($5 /$8 ) title 'Static'            linestyle 1 with linespoints, \
    '' using 4:($6 /$8 ) title 'Naive-dynamic'     linestyle 2 with linespoints, \
    '' using 4:($7 /$8 ) title 'Dynamic Traversal' linestyle 3 with linespoints
}
unset multiplot




## Names of CSV files.
# 01. indochina-2004
# 02. uk-2002
# 03. arabic-2005
# 04. uk-2005
# 05. webbase-2001
# 06. it-2004
# 07. sk-2005
# 08. com-LiveJournal
# 09. com-Orkut
# 10. asia_osm
# 11. europe_osm
# 12. kmer_A2a
# 13. kmer_V1r


## Columns in CSV file.
# 01. graph
# 02. batch_deletions_fraction
# 03. batch_insertions_fraction
# 04. batch_fraction
# 05. sta-t
# 06. nai-t
# 07. tra-t
# 08. fro-t
# 09. frop-t
# 10. sta-e
# 11. nai-e
# 12. tra-e
# 13. fro-e
# 14. frop-e
