#!/bin/bash
echo "start .NET runtime install"
## ref.:
# 1.. https://learn.microsoft.com/zh-tw/dotnet/core/tools/dotnet-install-script
# 2.. https://learn.microsoft.com/zh-tw/dotnet/core/install/linux-scripted-manual#scripted-install
# 3.. https://dotnet.microsoft.com/zh-cn/download/dotnet/2.2
# 4.. https://dotnet.microsoft.com/zh-cn/download/dotnet

_PWD=`pwd`
_DOTNET_ROOT="$1"

mkdir -p "${_DOTNET_ROOT}/tools"
cd "${_DOTNET_ROOT}"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh 
bash ./dotnet-install.sh --runtime aspnetcore --version 2.2.8 --install-dir "${_DOTNET_ROOT}"
bash ./dotnet-install.sh --channel LTS --version 2.2 --install-dir "${_DOTNET_ROOT}"

cd "${_PWD}"
