#!/bin/bash
echo "start .NET runtime install"
## ref.:
# 1.. https://learn.microsoft.com/zh-tw/dotnet/core/tools/dotnet-install-script
# 2.. https://learn.microsoft.com/zh-tw/dotnet/core/install/linux-scripted-manual#scripted-install
# 3.. https://dotnet.microsoft.com/zh-cn/download/dotnet/2.2

curl -sSL https://dot.net/v1/dotnet-install.sh | bash --runtime aspnetcore --version 2.2.x
curl -sSL https://dot.net/v1/dotnet-install.sh | bash --runtime dotnet --version 2.2.x
