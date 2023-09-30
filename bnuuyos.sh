#!/bin/sh

git clone https://github.com/rozniak/xfce-winxp-tc.git
cd xfce-winxp-tc/packaging/
chmod +x buildall.sh chkdeps.sh
apt update && apt upgrade
apt install $(./chkdeps.sh -l | cut -d':' -f2 | tr '\n' ' ')
echo "Now building Luna GUI, please wait warmly!"
./buildall.sh

ed /etc/os-release 1 c NAME="bnuuyOS"
ed /etc/os-release 5 c PRETTY_NAME="bnuuyOS Alpha 2023.23.09"

