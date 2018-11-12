#!/bin/sh

if [ -d myResults/DelayBandwidthImpact/NewRenoCoDel20Mbps-VarDelay ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/Combined Fairness/HSTCP
    mkdir myResults/Combined Fairness/HSTCP/TCPHighSpeedFairness
fi

gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TCP High Speed with CoDel & PFIFO - Fairness Analysis"
set key right bottom
set xrange [0:200]
set yrange [0.5:1]

set output "myResults/Combined Fairness/HSTCP/Combined-HighSpeed-Fairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/Combined Fairness/HSTCP/HighSpeed-CoDel-100Mbpsx5ms-jainFairness.data" using 1:2 title "HighSpeed_CoDel_5ms", "myResults/Combined Fairness/HSTCP/HighSpeed-CoDel-100Mbpsx30ms-jainFairness.data" using 1:2 title "HighSpeed_CoDel_30ms", "myResults/Combined Fairness/HSTCP/HighSpeed-PFIFO-100Mbpsx5ms-jainFairness.data" using 1:2 title "HighSpeed_PFIFO_5ms", "myResults/Combined Fairness/HSTCP/HighSpeed-PFIFO-100Mbpsx30ms-jainFairness.data" using 1:2 title "HighSpeed_PFIFO_30ms"

EOF






