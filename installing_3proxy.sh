echo "installing apps"
yum -y install gcc net-tools bsdtar zip >/dev/null

install_3proxy() {
    echo "installing 3proxy"
    # URL="https://raw.githubusercontent.com/quayvlog/quayvlog/main/3proxy-3proxy-0.8.6.tar.gz"
    URL="https://raw.githubusercontent.com/Minh-Nhat-2208/proxyv6/main/3proxy-master.tar.gz"
    wget -qO- $URL | bsdtar -xvf-
    cd 3proxy-3proxy-0.9.3
    make -f Makefile.Linux
    mkdir -p /usr/local/etc/3proxy/{bin,logs,stat}
    cp src/3proxy /usr/local/etc/3proxy/bin/
    cp ./scripts/rc.d/proxy.sh /etc/init.d/3proxy
    chmod +x /etc/init.d/3proxy
    chkconfig 3proxy on
#     cd $WORKDIR
}

install_3proxy
