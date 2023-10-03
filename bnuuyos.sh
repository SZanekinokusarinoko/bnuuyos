#!/bin/bash

git clone https://github.com/rozniak/xfce-winxp-tc.git
cd xfce-winxp-tc/packaging/
chmod +x buildall.sh chkdeps.sh
apt update && apt upgrade
apt install $(./chkdeps.sh -l | cut -d':' -f2 | tr '\n' ' ')
# apparently cmake isn't one of the dependencies checked, maybe adjust later?
apt install cmake
./buildall.sh

# grep magic needed to install binaries, blame cmake. Weird varible nonsense needed to use directory, blame bash(?)
cd xptc/
bndr=$(ls | grep -w 'master')
sudo dpkg -i ./xfce-winxp-tc/packaging/xptc/$bndr/deb/x86_64/*.deb

ed /etc/os-release 1 c NAME="bnuuyOS" w /etc/os-release
ed /etc/os-release 5 c PRETTY_NAME="bnuuyOS Alpha 2023.03.10" w /etc/os-release
