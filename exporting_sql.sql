mysql -uroot --pyub.miha --skip-column-names -e "SELECT * FROM kpwm;" | sed 's/\t/;/g;s/\n//g' > input.csv


mysql -uroot -pyub.miha --skip-column-names weather -e "SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE 'input2.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM `weather`.`KPWM`;"

gnuplot
set terminal pngcairo size 600,800 enhanced font "arial,6.0" persist
set datafile separator ';'
set grid
set xlabel "Date/Time"
set ylabel "Temperature (F)"
set xdata time
unset key
set timefmt "%s"
set format x "%d.%m\n%R"    # Display time in 24 hour notation on the X axis
set terminal png 
set style line 1 lc rgb '#0060ad' pt 7 ps .75 lt 1 # --- blue
set output "plot3.png"
plot "/tmp/input2.csv" using 1:2 with points linestyle 1


'nocrop enhanced size 640,480 font "arial,12.0" '
reset
set terminal pngcairo size 600,800 enhanced font 'Verdana,9'
set output 'plotting_data1.png'
set datafile separator ';'
set xdata time
set timefmt "%s"
set format x "%d.%m\n%R"    # Display time in 24 hour notation on the X axis
set border linewidth 1.5
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5
unset key
plot "/tmp/input2.csv" with linespoints linestyle 1
EOF