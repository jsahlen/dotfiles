MEM_TOTAL=$(($(cat /proc/meminfo | grep '^MemTotal' | awk 'END {print $2}') * 1024))
MEM_AVAILABLE=$(($(cat /proc/meminfo | grep '^MemAvailable' | awk 'END {print $2}') * 1024))
ZFS_USE=$(cat /proc/spl/kstat/zfs/arcstats | grep "^size" | awk 'END {print $3}')
MEM_REAL_AVAILABLE=$((MEM_AVAILABLE + ZFS_USE))

echo "Total memory: $(echo $MEM_TOTAL | numfmt --to=iec)"
echo "Available: $(echo $MEM_AVAILABLE | numfmt --to=iec)"
echo "Used by ZFS: $(echo $ZFS_USE | numfmt --to=iec)"
echo "Actually available: $(echo $MEM_REAL_AVAILABLE | numfmt --to=iec)"
