service postgresql stop
sync
chmod a+rwx /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
service postgresql start
