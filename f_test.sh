#/bin/bash

tmp="${LANG%.*}"

if [ $tmp = "en_US" ];then
#   echo "us"

expect << EOF
spawn fdisk /dev/vdb
expect "Command" { send "n\n" }
expect "Select" { send "p\n" }
expect "Partition" { send "\n" }
expect "First" { send "\n" }
expect "Last" { send "+2G\n" }
expect "Command" { send "w\n" }
expect "Command" { send "p\n" }
EOF

else
#   echo "cn"

expect << EOF
spawn fdisk /dev/vdb
expect "命令" { send "n\n" }
expect "Select" { send "p\n" }
expect "分区号" { send "\n" }
expect "起始" { send "\n" }
expect "Last" { send "+2G\n" }
expect "命令" { send "w\n" }
expect "命令" { send "p\n" }
EOF

fi
