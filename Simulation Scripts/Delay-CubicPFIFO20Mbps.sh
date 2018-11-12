#!/bin/sh

if [ -d myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay ]
then
    ECHO "Dir exists"
else
    ECHO "Dir does not exists - being created"
    mkdir myResults/DelayBandwidthImpact
    mkdir myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay
fi

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx5ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="5ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows=1"

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx10ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="10ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows=1"

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx20ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="20ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows=1"

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx40ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="40ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows=1"

./waf --run "tcp-variants-fairness-comparison --transport_prot="TcpCubic" --tracing=true --prefix_name="myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx80ms" --duration=200 --bandwidth="20Mbps" --access_bandwidth="100Mbps" --access_delay="0.0001ms" --delay="80ms" --queue_disc_type="ns3::PfifoFastQueueDisc" --num_flows=1"


gnuplot << EOF
set terminal png size 640,480

set grid xtics ytics ls 100
set grid mxtics mytics ls 101

set xlabel 'time (seconds)'
set title "TCP Cubic with DropTail - Impact of Delay "
set key right bottom
set xrange [0:200]

set output "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/PlotCubic-PFIFO-20MbpsxVarDelay-cwnd.png"
set ylabel 'cwnd (bytes)'
set xlabel 'time (seconds)'
plot "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx5ms-cwnd.data" using 1:2 title "20Mbps x 5ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx10ms-cwnd.data" using 1:2 title "20Mbps x 10ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx20ms-cwnd.data" using 1:2 title "20Mbps x 20ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx40ms-cwnd.data" using 1:2 title "20Mbps x 40ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx80ms-cwnd.data" using 1:2 title "20Mbps x 80ms"

set output "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/PlotCubic-PFIFO-20MbpsxVarDelay-rtt.png"
set ylabel 'RTT (seconds)'
plot "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx5ms-rtt.data" using 1:2 title "20Mbps x 5ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx10ms-rtt.data" using 1:2 title "20Mbps x 10ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx20ms-rtt.data" using 1:2 title "20Mbps x 20ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx40ms-rtt.data" using 1:2 title "20Mbps x 40ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx80ms-rtt.data" using 1:2 title "20Mbps x 80ms"

set output "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/PlotCubic-PFIFO-20MbpsxVarDelay-avThroughput.png"
set ylabel 'Average Throughput (kbps)'
plot "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx5ms-avThroughput.data" using 1:2 title "20Mbps x 5ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx10ms-avThroughput.data" using 1:2 title "20Mbps x 10ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx20ms-avThroughput.data" using 1:2 title "20Mbps x 20ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx40ms-avThroughput.data" using 1:2 title "20Mbps x 40ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx80ms-avThroughput.data" using 1:2 title "20Mbps x 80ms"

set output "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/PlotCubic-PFIFO-20MbpsxVarDelay-insThroughput.png"
set ylabel 'Average Throughput (kbps)'
plot "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx5ms-insThroughput.data" using 1:2 title "20Mbps x 5ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx10ms-insThroughput.data" using 1:2 title "20Mbps x 10ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx20ms-insThroughput.data" using 1:2 title "20Mbps x 20ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx40ms-insThroughput.data" using 1:2 title "20Mbps x 40ms", "myResults/DelayBandwidthImpact/CubicPFIFO20Mbps-VarDelay/Cubic-PFIFO-20Mbpsx80ms-insThroughput.data" using 1:2 title "20Mbps x 80ms"

EOF






