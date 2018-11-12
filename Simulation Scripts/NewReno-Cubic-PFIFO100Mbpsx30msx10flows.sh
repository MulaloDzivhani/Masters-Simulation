#!/bin/sh

if [ -d myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/FairnessAnalysis
    mkdir myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows
fi

./waf --run "tcp-variants-RTT-comparison --transport_prot1="TcpNewReno" --transport_prot2="TcpCubic" --tracing=true --prefix_name="myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/NRandCubic-PFIFO-100Mbpsx30ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay1="5ms" --access_delay2="5ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows1=2 --num_flows2=2"


gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TcpNewReno and TcpCubic flows with PFIFO - 100Mbpsx30msx2x2flows"
set key right bottom
set xrange [0:200]

set output "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-BDP-cwnd.png"
set ylabel 'cwnd (bytes)'
set xlabel 'time (seconds)'
plot [1:200] [0:100000] "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-cwnd.data" using 1:2 title "TcpNewReno1", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-cwnd.data" using 1:3 title "TcPNewReno2", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-cwnd.data" using 1:4 title "TcpCubic1", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-cwnd.data" using 1:5 title "TcpCubic2"

set output "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-BDP-rtt.png"
set ylabel 'rtt (seconds)'
plot [1:200] [0:0.2] "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-rtt.data" using 1:2 title "TcpNewReno1", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-rtt.data" using 1:3 title "TcpNewReno2", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-rtt.data" using 1:4 title "Flow 3", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-rtt.data" using 1:5 title "TcpCubic2"

set output "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-BDP-throughput.png"
set ylabel 'Normalised Average Throughput'
plot "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-throughput.data" using 1:2 title "TcpNewReno1", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-throughput.data" using 1:3title "TcpNewReno2", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-throughput.data" using 1:4 title "TcpCubic1", "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-throughput.data" using 1:5 title "TcpCubic2"

set output "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-BDP-throughputAggrefate.png"
set ylabel 'Normalised Average Throughput'
plot "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-throughput.data" using 1:(column(2)+column(3)+column(4)+column(5)) title "Total all flows"

set output "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-BDP-jainFairness.png"
set ylabel 'Jain Fairness Index'
set xlabel 'time (seconds)'
plot "myResults/FairnessAnalysis/NewReno-Cubic-PFIFO100Mbpsx30msx2x2flows/N-PFIFO-100Mbpsx30ms-jainFairness.data" using 1:2 title "4 flows"

EOF






