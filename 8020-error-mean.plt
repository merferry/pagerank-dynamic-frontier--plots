set term pdf
set terminal pdf size 4in,3.6in
set output '8020-error-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set format x "10^{%L}"
set grid y
set key above font ",12"


## Set line styles
set style line  1 linewidth 2 linetype 6 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 7 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 2 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1
set style line  5 linewidth 2 linetype 8 pointtype 3 dashtype 2


## Draw plot
set logscale x 10
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Error}'
plot '8020.csv' \
     using 4:($10) title 'Static' linestyle  1 with linespoints, \
  '' using 4:($11) title 'ND'     linestyle  2 with linespoints, \
  '' using 4:($12) title 'DT'     linestyle  3 with linespoints, \
  '' using 4:($13) title 'DF'     linestyle  4 with linespoints, \
  '' using 4:($14) title 'DF-P'   linestyle  5 with linespoints




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
