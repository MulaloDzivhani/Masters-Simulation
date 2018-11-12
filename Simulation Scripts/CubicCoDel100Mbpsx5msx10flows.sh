#!/bin/sh

if [ -d myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/FairnessAnalysis
    mkdir myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows
fi

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms" --duration=200 --bandwidth="100Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="5ms" --queue_disc_type="ns3::CoDelQueueDisc" --num_flows="10""


gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TCP Cubic with CoDel - Fairness Analysis - 100Mbpsx5msx10flows"
set key right bottom
set xrange [0:200]

set output "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-BDP-cwnd.png"
set ylabel 'cwnd (bytes)'
set xlabel 'time (seconds)'
plot [1:200] [0:80000] "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:2 title "Flow 1", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:3 title "Flow 2", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:4 title "Flow 3", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:5 title "Flow 4", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:6 title "Flow 5", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:7 title "Flow 6", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:8 title "Flow 7", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:9 title "Flow 8", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:10 title "Flow 9", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-cwnd.data" using 1:11 title "Flow 10"


set output "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-BDP-rtt.png"
set ylabel 'rtt (seconds)'
plot [1:200] [0:0.2] "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:2 title "Flow 1", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:3 title "Flow 2", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:4 title "Flow 3", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:5 title "Flow 4", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:6 title "Flow 5", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:7 title "Flow 6", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:8 title "Flow 7", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:9 title "Flow 8", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:10 title "Flow 9", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-rtt.data" using 1:11 title "Flow 10"

set output "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-BDP-throughput.png"
set ylabel 'Normalised Average Throughput'
plot "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:2 title "Flow 1", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:3 title "Flow 2", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:4 title "Flow 3", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:5 title "Flow 4", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:6 title "Flow 5", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:7 title "Flow 6", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:8 title "Flow 7", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:9 title "Flow 8", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:10 title "Flow 9", "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:11 title "Flow 10"

set output "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-BDP-throughputAggregate.png"
set ylabel 'Normalised Average Throughput'
plot "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-avThroughput.data" using 1:((column(2)+column(3)+column(4)+column(5)+column(6)+column(7)+column(8)+column(9)+column(10)+column(11))) title "Total all flows"

set output "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-BDP-jainFairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/FairnessAnalysis/CubicCoDel100Mbpsx5msx10flows/Cubic-CoDel-100Mbpsx5ms-jainFairness.data" using 1:2 title "10 flows"

EOF






