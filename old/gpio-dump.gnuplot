reset

#### Labels ####
#set xlabel "time";
#set ylabel "state";
#set y2label "RH (%)";
#set title "GPIO dump";
#set key autotitle columnhead

set yrange [-0.3:1.3];
#set y2range [10:100];
set xtics nomirror #rotate
set ytics 1 nomirror
#set y2tics
unset xtics;
#unset ytics;
#unset key;
#set key bottom;
#set mxtics 4;
#set x2tics;
#set x2tic rotate by 90
#set log x
#set log x2
set xrange [-50:10000];
#set x2range [1:62];
#set mytics 5;
set grid xtics mxtics lc -1 lw 0.5, lc -1 lw 0.5,;

#time format
#set xdata time
#set timefmt "%Y-%m-%d %H:%M:%S"
# set xtics 3600
#set format x "%d 	%H:%M"
set datafile separator "\t"

set xrange ["2015-12-16":];
#### Styles ####
#set cbrange [0:1]
#set palette gray negative;
#set pointsize 0.7;
#set style line 1  lc -1 lw 1 lt 1
#set style line 2  lc -1 lw 2 lt 1

set size ratio .05;

#### Equations ####
#a=3715.56
#b=0.00116101
#c=18738
#d=37.7326
#f(x) = a*exp( -(x-c) * b)+d;
#fit f(x) 'logs/T.log' using 1:2 via a,b,c,d;

#### Output Terminal ####
#  choose the SVG terminal
set terminal svg font "Bitstream Vera Sans, 10" linewidth 1 size 2000 250;
#  pipe the output to a file
set output "|cat >./gpio-dump.svg";

#### Plot ####
#http://old.nabble.com/Conditional-plot-with-lines-td26678688.html
#lastx = NaN ; lasty = NaN ; selection = 0

set multiplot
set size 1,1
set origin 0.0,0.20
plot 'gpio-dump_7.log' using 1:2 with steps lc -1  lw 1 notitle;
set xtics 200 nomirror;
set mxtics 2;
set size 1,1
set origin 0.0,-0.20
plot 'gpio-dump_8.log' using 1:2 with steps lc -1  lw 1 notitle;

unset multiplot

#pause -1 "Hit return to continue";
