#
# ANAR+ EnergyPlus plotting script
#
# author: lluj@anar.ch
#
# TODO "set terminal windows" for windows (especially windows7 x64)
# TODO exclude PNG export for macs (such that no error is printed)
set terminal wxt
set xdata time
set timefmt "%m/%d-%H:%M:%S"
# time range must be in same format as data file
#@trange
set xrange ["1/1-00:00:00":"12/31-00:00:00"]
#@Trange
#set yrange [-10.0:50.0]
set autoscale y
set grid
set mouse

set xlabel "Date"
set ylabel "Temperature [C]"
set format x "%d/%m" 

#set title "ANAR+ EnergyPlus simulation"
#set key left box
#@temp 
plot "test.dat" using 1:2 index 0 title "outdoor temp [C]" with lines, \
     "test.dat" using 1:12 index 0 title "L0_Zone1 temp [C]" with lines, \
     "test.dat" using 1:13 index 0 title "L0_Zone2 temp [C]" with lines, \
     "test.dat" using 1:14 index 0 title "L1_Zone1 temp [C]" with lines, \
     "test.dat" using 1:15 index 0 title "L1_Zone2 temp [C]" with lines, \
     "test.dat" using 1:16 index 0 title "L2_Zone1 temp [C]" with lines, \
     "test.dat" using 1:17 index 0 title "L2_Zone2 temp [C]" with lines



#@svg
# SVG export 
set terminal svg size 1200,800
set output "testTemp.svg"
#@temp 
plot "test.dat" using 1:2 index 0 title "outdoor temp [C]" with lines, \
     "test.dat" using 1:12 index 0 title "L0_Zone1 temp [C]" with lines, \
     "test.dat" using 1:13 index 0 title "L0_Zone2 temp [C]" with lines, \
     "test.dat" using 1:14 index 0 title "L1_Zone1 temp [C]" with lines, \
     "test.dat" using 1:15 index 0 title "L1_Zone2 temp [C]" with lines, \
     "test.dat" using 1:16 index 0 title "L2_Zone1 temp [C]" with lines, \
     "test.dat" using 1:17 index 0 title "L2_Zone2 temp [C]" with lines


set output "testHumid.svg"
set ylabel "Relative humidity [%]"
set yrange [0:110]
#@humid 
plot "test.dat" using 1:3 index 0 title "outdoor rel. humidity [%]" with lines, \
     "test.dat" using 1:20 index 0 title "L0_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:23 index 0 title "L0_Zone2 rel. humidity [%]" with lines, \
     "test.dat" using 1:26 index 0 title "L1_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:29 index 0 title "L1_Zone2 rel. humidity [%]" with lines, \
     "test.dat" using 1:32 index 0 title "L2_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:35 index 0 title "L2_Zone2 rel. humidity [%]" with lines


set output "testACH.svg"
set ylabel "Air change rate [ach]"
set yrange [0:10]
#@airchangehour 
plot \
     "test.dat" using 1:36 index 0 title "L0_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:37 index 0 title "L0_Zone2 mechanical [ach]" with lines, \
     "test.dat" using 1:38 index 0 title "L1_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:39 index 0 title "L1_Zone2 mechanical [ach]" with lines, \
     "test.dat" using 1:40 index 0 title "L2_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:41 index 0 title "L2_Zone2 mechanical [ach]" with lines



set output "testEnergyRate.svg"
set ylabel "Daily energy rate [W]"
#set yrange [0:5000.0]
set autoscale y
#@coolheat
plot \
     "test.dat" using 1:18 index 0 title "L0_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:21 index 0 title "L0_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:24 index 0 title "L1_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:27 index 0 title "L1_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:30 index 0 title "L2_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:33 index 0 title "L2_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:19 index 0 title "L0_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:22 index 0 title "L0_Zone2 cooling rate [W]" with lines, \
     "test.dat" using 1:25 index 0 title "L1_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:28 index 0 title "L1_Zone2 cooling rate [W]" with lines, \
     "test.dat" using 1:31 index 0 title "L2_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:34 index 0 title "L2_Zone2 cooling rate [W]" with lines


set output "testEnergyDaily.svg"
set boxwidth 0.9 relative
set style fill solid 1.0
set ylabel "Daily energy use [kWh]"
#set yrange [0:1000.0]
set autoscale y
#@energy
plot \
	"testMeter.dat" using 1:($2/3600000) index 0 title "daily heating energy use [J]" with boxes   , \
	"testMeter.dat" using 1:($3/3600000) index 0 title "daily cooling energy use [J]" with boxes   , \
	"testMeter.dat" using 1:($4/3600000) index 0 title "daily electricity use [J]" with boxes   


reset

# ##############   
# some histograms   
set terminal svg size 1200,800
#@Trange
#set xrange [-10.0:50.0]
set autoscale y
#@hrange
#set yrange [0:1000.0]
set autoscale y
set grid
set xlabel "inside temperature"
set ylabel "hours"
set style fill solid border -1
  
binwidth=.5
bin(x,width)=width*floor(x/width) + binwidth/2
set boxwidth binwidth

# output is hourly
timestep = 1
#@hist
set output "testHist_L0_Zone1.svg"
plot 'test.dat' using (bin($12,binwidth)):(1.0/timestep) title "L0_Zone1" smooth freq with boxes
set output "testHist_L0_Zone2.svg"
plot 'test.dat' using (bin($13,binwidth)):(1.0/timestep) title "L0_Zone2" smooth freq with boxes
set output "testHist_L1_Zone1.svg"
plot 'test.dat' using (bin($14,binwidth)):(1.0/timestep) title "L1_Zone1" smooth freq with boxes
set output "testHist_L1_Zone2.svg"
plot 'test.dat' using (bin($15,binwidth)):(1.0/timestep) title "L1_Zone2" smooth freq with boxes
set output "testHist_L2_Zone1.svg"
plot 'test.dat' using (bin($16,binwidth)):(1.0/timestep) title "L2_Zone1" smooth freq with boxes
set output "testHist_L2_Zone2.svg"
plot 'test.dat' using (bin($17,binwidth)):(1.0/timestep) title "L2_Zone2" smooth freq with boxes


  
reset

set xdata time
set timefmt "%m/%d-%H:%M:%S"
# time range must be in same format as data file
#@trange
set xrange ["1/1-00:00:00":"12/31-00:00:00"]
#@Trange
#set yrange [-10.0:50.0]
set autoscale y
set grid
set mouse
set xlabel "Date"
set format x "%d/%m"
set ylabel "Temperature"
#set title "ANAR+ EnergyPlus simulation"



#@png
# PNG export (not functional on OSX)
set terminal png size 1200,800
set output "testTemp.png"

# uncomment if thick font and lines are needed
#set terminal png size 800,600
#set style line 1 lw 3
#set style line 2 lw 3
#set style line 3 lw 3
#set style line 4 lw 3
#set style line 5 lw 3
#set style line 6 lw 3
#set style line 7 lw 3
#set style line 8 lw 3
#set style line 9 lw 3
#set style increment user
#set key right top font "Helvetica,16" spacing 1.3
#set tics font "Helvetica,16"
#set xlabel "Date" font "Helvetica,20"
#set ylabel "Temperature" font "Helvetica,20"


#@temp 
plot "test.dat" using 1:2 index 0 title "outdoor temp [C]" with lines, \
     "test.dat" using 1:12 index 0 title "L0_Zone1 temp [C]" with lines, \
     "test.dat" using 1:13 index 0 title "L0_Zone2 temp [C]" with lines, \
     "test.dat" using 1:14 index 0 title "L1_Zone1 temp [C]" with lines, \
     "test.dat" using 1:15 index 0 title "L1_Zone2 temp [C]" with lines, \
     "test.dat" using 1:16 index 0 title "L2_Zone1 temp [C]" with lines, \
     "test.dat" using 1:17 index 0 title "L2_Zone2 temp [C]" with lines


set output "testHumid.png"
set ylabel "Relative humidity [%]"
set yrange [0:110]
#@humid 
plot "test.dat" using 1:3 index 0 title "outdoor rel. humidity [%]" with lines, \
     "test.dat" using 1:20 index 0 title "L0_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:23 index 0 title "L0_Zone2 rel. humidity [%]" with lines, \
     "test.dat" using 1:26 index 0 title "L1_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:29 index 0 title "L1_Zone2 rel. humidity [%]" with lines, \
     "test.dat" using 1:32 index 0 title "L2_Zone1 rel. humidity [%]" with lines, \
     "test.dat" using 1:35 index 0 title "L2_Zone2 rel. humidity [%]" with lines


set output "testACH.png"
set ylabel "Air change rate [ach]"
set yrange [0:10]
#@airchangehour 
plot \
     "test.dat" using 1:36 index 0 title "L0_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:37 index 0 title "L0_Zone2 mechanical [ach]" with lines, \
     "test.dat" using 1:38 index 0 title "L1_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:39 index 0 title "L1_Zone2 mechanical [ach]" with lines, \
     "test.dat" using 1:40 index 0 title "L2_Zone1 mechanical [ach]" with lines, \
     "test.dat" using 1:41 index 0 title "L2_Zone2 mechanical [ach]" with lines


set output "testEnergyRate.png"
set ylabel "Daily energy rate [W]"
#set yrange [0:5000.0]
set autoscale y
#@coolheat
plot \
     "test.dat" using 1:18 index 0 title "L0_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:21 index 0 title "L0_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:24 index 0 title "L1_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:27 index 0 title "L1_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:30 index 0 title "L2_Zone1 heating rate [W]" with lines, \
     "test.dat" using 1:33 index 0 title "L2_Zone2 heating rate [W]" with lines, \
     "test.dat" using 1:19 index 0 title "L0_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:22 index 0 title "L0_Zone2 cooling rate [W]" with lines, \
     "test.dat" using 1:25 index 0 title "L1_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:28 index 0 title "L1_Zone2 cooling rate [W]" with lines, \
     "test.dat" using 1:31 index 0 title "L2_Zone1 cooling rate [W]" with lines, \
     "test.dat" using 1:34 index 0 title "L2_Zone2 cooling rate [W]" with lines


set output "testEnergyDaily.png"
set boxwidth 0.9 relative
set style fill solid 1.0
set ylabel "Daily energy use [kWh]"
#set yrange [0:1000.0]
set autoscale y
#@energy
plot \
	"testMeter.dat" using 1:($2/3600000) index 0 title "daily heating energy use [J]" with boxes   , \
	"testMeter.dat" using 1:($3/3600000) index 0 title "daily cooling energy use [J]" with boxes   , \
	"testMeter.dat" using 1:($4/3600000) index 0 title "daily electricity use [J]" with boxes   


reset

#@Trange
#set xrange [-10.0:50.0]
set autoscale y
#@hrange
#set yrange [0:1000.0]
set autoscale y
set grid
set xlabel "inside temperature"
set ylabel "hours"
set style fill solid border -1
  
binwidth=.5
bin(x,width)=width*floor(x/width) + binwidth/2
set boxwidth binwidth

# output is hourly
timestep = 1
#@hist
set output "testHist_L0_Zone1.png"
plot 'test.dat' using (bin($12,binwidth)):(1.0/timestep) title "L0_Zone1" smooth freq with boxes
set output "testHist_L0_Zone2.png"
plot 'test.dat' using (bin($13,binwidth)):(1.0/timestep) title "L0_Zone2" smooth freq with boxes
set output "testHist_L1_Zone1.png"
plot 'test.dat' using (bin($14,binwidth)):(1.0/timestep) title "L1_Zone1" smooth freq with boxes
set output "testHist_L1_Zone2.png"
plot 'test.dat' using (bin($15,binwidth)):(1.0/timestep) title "L1_Zone2" smooth freq with boxes
set output "testHist_L2_Zone1.png"
plot 'test.dat' using (bin($16,binwidth)):(1.0/timestep) title "L2_Zone1" smooth freq with boxes
set output "testHist_L2_Zone2.png"
plot 'test.dat' using (bin($17,binwidth)):(1.0/timestep) title "L2_Zone2" smooth freq with boxes


   
reset  
quit
