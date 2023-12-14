% security, tools, sandfly, pushou
# bash history zeroize
export HISTFILE=/dev/null
export HISTSIZE=0
export HISTFILESIZE=0

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

$ PROTO: echo 'tcp udp all' | tr ' ' '\n'
$ IP_VERSION: echo '4 6' | tr ' ' '\n'
