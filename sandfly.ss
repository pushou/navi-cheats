% security, tools, sandfly, pushou

# bash history zeroize
export HISTFILE=/dev/null
export HISTSIZE=0
export HISTFILESIZE=0
unset HISTFILE
rm $HISTIFLE
shred $HISTFILE
rm .bash_history
cat /dev/null > $HISTFILE
set +o history
chattr +i $HISTFILE

# env variable for a process
cat /proc/<PID>/environ | tr '\0' '\n'
strings  /proc/<PID>/environ

# copy linux malware binary from /proc
cp /proc/<PID>/exe /tmp/badbin

# sniffer trace
strings /proc/<PID>/stack
ls -al /proc/<PID>/fd

# ebpf cap of a process
ss -0bp

# alter file hash in bash script
echo -ne '\0' >> $1

# whoami shellcode
dd bs=1 if=$(echo -e "\x2f\x75\x73\x72\x2f\x62\x69\x6e\x2f\x77\x68\x6f\x61\x6d\x69") of=./test;chmod +x ./test;echo -ne '\0' >> ./test;./test



$ PROTO: echo 'tcp udp all' | tr ' ' '\n'
$ IP_VERSION: echo '4 6' | tr ' ' '\n'
