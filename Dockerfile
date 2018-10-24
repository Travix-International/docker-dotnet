FROM microsoft/dotnet:2.2-sdk

RUN apt update && \
    apt install -y apt-transport-https dirmngr && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt update && \
    apt install -y mono-devel curl && \
    curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    echo '#!/bin/bash\nmono /usr/local/bin/nuget.exe "$@"' > /usr/bin/nuget && \
    chmod +x /usr/bin/nuget
