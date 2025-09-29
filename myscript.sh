# !/bin/bash

HOSTS=("google.com" "8.8.8.8" "github.com" "facebook.com")

LOGFILE="./network_check.log"

#Ham ghi log

log () {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1" | tee -a "$LOGFILE"
}
log "====bat dau kiem tra mang===="

#kiem tra ket noi mang
for host in "${HOSTNAME[@]}";do
    if ping -c 2 -W 2 "$host" > /dev/null 2>&1; then
        log "$host is reachable"
    else
        log "$host is unreacheable"
    fi
done

#Kiem tra IP Local

MYIP = $(hostname -I | awk '{print $1}')
log "IP local cua may la :$MYIP"
#kiem tra toc do mang(neu co speedtest-cli thi moi chay duoc)
if command -v speedtest-cli %> /dev/null ; then
    log "Kiem tra toc do mang..."
    speedtest-cli --simple | tee -a $LOGFILE
else
    log" speedtest-cli khong duoc cai dat, bo qua kiem tra toc do mang"
fi

log "====ket thuc kiem tra mang===="
