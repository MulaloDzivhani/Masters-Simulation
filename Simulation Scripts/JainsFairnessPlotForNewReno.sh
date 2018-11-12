#!/bin/sh

if [ -d myResults/DelayBandwidthImpact/New RenoCoDel20Mbps-VarDelay ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/Combined Fairness/New Reno
    mkdir myResults/Combined Fairness/New Reno/New RenoFairness
fi

gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TCP New Reno with CoDel & PFIFO - Fairness Analysis"
set key right bottom
set xrange [0:200]
set yrange [0.5:1]

set output "myResults/Combined Fairness/New Reno/Combined-New Reno-Fairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/Combined Fairness/New Reno/N-CoDel-100Mbpsx5ms-jainFairness.data" using 1:2 title "NewRenoCoDel 5ms", "myResults/Combined Fairness/New Reno/N-CoDel-100Mbpsx30ms-jainFairness.data" using 1:2 title "NewRenoCoDel 30ms", "myResults/Combined Fairness/New Reno/N-PFIFO-100Mbpsx5ms-jainFairness.data" using 1:2 title "NewRenoPFIFO 5ms", "myResults/Combined Fairness/New Reno/N-PFIFO-100Mbpsx30ms-jainFairness.data" using 1:2 title "NewRenoPFIFO 30ms"

EOF






