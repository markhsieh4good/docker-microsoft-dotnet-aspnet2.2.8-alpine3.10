#!/bin/bash
echo "start .NET runtime install"
## ref.:
# 1.. https://learn.microsoft.com/zh-tw/dotnet/core/tools/dotnet-install-script
# 2.. https://learn.microsoft.com/zh-tw/dotnet/core/install/linux-scripted-manual#scripted-install
# 3.. https://dotnet.microsoft.com/zh-cn/download/dotnet/2.2

_PWD=`pwd`
_DIST="/usr/local/bin"

mkdir -p "${_DIST}"
cd "${_DIST}"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh 
bash ./dotnet-install.sh --runtime aspnetcore --version 2.2.8xx --install-dir "${_DIST}"
bash ./dotnet-install.sh --runtime dotnet --version 2.2.8xx --install-dir "${_DIST}"

cd "${_PWD}"
