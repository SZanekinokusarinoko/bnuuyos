#!/bin/sh

git clone https://github.com/rozniak/xfce-winxp-tc.git
cd xfce-winxp-tc/packaging/
chmod +x buildall.sh chkdeps.sh
apt update && apt upgrade
apt install $(./chkdeps.sh -l | cut -d':' -f2 | tr '\n' ' ')
# apparently cmake isn't one of the dependencies checked, maybe adjust later?
apt install cmake
./buildall.sh

# copy default binary folder to a custom one because cmake
mv $(ls | grep -w 'master') built

ed /etc/os-release 1 c NAME="bnuuyOS" w /etc/os-release
ed /etc/os-release 5 c PRETTY_NAME="bnuuyOS Alpha 2023.23.09" w /etc/os-release

