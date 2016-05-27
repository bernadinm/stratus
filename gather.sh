#!/bin/sh

mkdir mesos-logs-"$(hostname)" && \
cd mesos-logs-"$(hostname)" && \
dmesg -T > dmesg.log && \
journalctl -u dcos-mesos-master -n 1000000 > master-"$(hostname)".log && \
journalctl -u --no-pager -n 1000000 -u dcos-exhibitor > exhibitor.log && \
cp /opt/mesosphere/active/exhibitor/usr/zookeeper/zookeeper.out . && \
cd .. && tar -cvf mesos-master-logs-"$(hostname)".tar.gz mesos-logs-"$(hostname)" && \
rm -fr mesos-logs-"$(hostname)"/
