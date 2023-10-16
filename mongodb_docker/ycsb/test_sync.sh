#!/bin/bash

# PARAMETERS
ycsb_dir=~/ycsb/ycsb-0.17.0
log_dir=~/data/ycsb

# READ INPUTS
sync=-async
workload_id=a

while getopts ":sw:r:o:" option; do
    case $option in
        s) sync="";; # use sync driver if set
        w) workload_id=$OPTARG;; # workload type
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
        :)  echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
   esac
done

should_load=0
recordcount=1000
should_run=0
operationcount=1000

while [ $# -gt 0 ]; do
    case "$1" in
    "load") 
        should_load=1
        while getopts ":r:" option; do
            case $option in
                r) recordcount=$OPTARG;; # recordcount
                \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
                :)  echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
            esac
        done
        ;;
    "run") 
        should_run=1
        while getopts ":o:" option; do
            case $option in
                o) operationcount=$OPTARG;; # recordcount
                \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
                :)  echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
            esac
        done
    ;;
    esac
    shift
done


if [ $should_load == 1 ]; then
    ${ycsb_dir}/bin/ycsb load mongodb${sync} -s \
        -P ${ycsb_dir}/workloads/workload$workload_id \
        -p recordcount=$recordcount
fi

if [ $should_run == 1 ]; then
    ${ycsb_dir}/bin/ycsb run mongodb${sync} -s \
        -P ${ycsb_dir}/workloads/workload$workload_id \
        -p operationcount=$operationcount \
        -p measurementtype=raw \
        -p status.interval=1 \
        -p maxexecutiontime=150 \
        -p mongodb.url=mongodb://localhost:27017 \
        > ${log_dir}/raw.log 2> >(tee ${log_dir}/runtime.log >&2)
fi



# ${ycsb_dir}/bin/ycsb.sh run cassandra-cql -p hosts=$cas1_ip -s -P ${ycsb_dir}/workloads/workload${1} -p measurementtype=raw -p operationcount=$3 -p maxexecutiontime=150 -p status.interval=1 > ${data_dir}/${log_dir2}/raw-$5-$6-$8.log 2> >(tee ${data_dir}/${log_dir2}/runtime-$5-$6-$8.log >&2) &

# mongodb://localhost:27017/ycsb?w=1,localhost:27018/ycsb?w=1,localhost:27019/ycsb?w=1,localhost:270120/ycsb?w=1/?authSource=admin&replicaSet=rs0