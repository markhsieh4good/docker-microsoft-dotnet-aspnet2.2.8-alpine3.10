#!/bin/bash
echo "start .NET runtime install"

curl -sSL https://dot.net/v1/dotnet-install.sh | bash --runtime aspnetcore --version 2.2.x
curl -sSL https://dot.net/v1/dotnet-install.sh | bash --runtime dotnet --version 2.2.x
