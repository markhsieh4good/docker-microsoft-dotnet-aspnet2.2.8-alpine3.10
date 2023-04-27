#!/bin/bash
echo "start .NET runtime install"
## ref.:
# 1.. https://learn.microsoft.com/zh-tw/dotnet/core/tools/dotnet-install-script
# 2.. https://learn.microsoft.com/zh-tw/dotnet/core/install/linux-scripted-manual#scripted-install
# 3.. https://dotnet.microsoft.com/zh-cn/download/dotnet/2.2
# 4.. https://dotnet.microsoft.com/zh-cn/download/dotnet

_PWD=`pwd`
_DIST_ROOT="/usr/local"
export DOTNET_ROOT="${_DIST_ROOT}"/dotnet
export PATH="$PATH:${DOTNET_ROOT}:${DOTNET_ROOT}/tools"

mkdir -p "${DOTNET_ROOT}/tools"
cd "${DOTNET_ROOT}"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh 
bash ./dotnet-install.sh --runtime aspnetcore --version 2.2.8
bash ./dotnet-install.sh --runtime dotnet --version 2.2.8 

cd "${_PWD}"
