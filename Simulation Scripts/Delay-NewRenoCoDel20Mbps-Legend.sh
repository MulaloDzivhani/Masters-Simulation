#!/bin/sh

if [ -d myResults/DelayBandwidthImpact/NewRenoCoDel20Mbps-VarDelay ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/Combined Fairness/Cubic
    mkdir myResults/Combined Fairness/Cubic/CubicFairness
fi

gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TCP NewReno with CoDel - Impact of Delay "
set key right bottom
set xrange [0:200]

set output "myResults/Combined Fairness/Cubic/N-PFIFO-BDP-jainFairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/Combined Fairness/Cubic/N-PFIFO-100Mbpsx30ms-jainFairness.data" using 1:2 title "10 flows"


set output "myResults/Combined Fairness/Cubic/Combined-Cubic-Fairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/Combined Fairness/Cubic/Cubic-CoDel-100Mbpsx5ms-jainFairness.data" using 1:2 title "Cubic_CoDel 5ms", "myResults/Combined Fairness/Cubic/Cubic-CoDel-100Mbpsx30ms-jainFairness.data" using 1:2 title "Cubic_CoDel 30ms", "myResults/Combined Fairness/Cubic/N-PFIFO-100Mbpsx5ms-jainFairness.data" using 1:2 title "Cubic_NewReno 5ms", "myResults/Combined Fairness/Cubic/N-PFIFO-100Mbpsx30ms-jainFairness.data" using 1:2 title "Cubic_NewReno 30ms"

EOF






