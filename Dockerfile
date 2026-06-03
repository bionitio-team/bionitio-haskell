FROM haskell:7.10
WORKDIR /bionitio

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main" > /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install hlint -y

COPY . /bionitio
RUN stack install 

# Executable is installed into /root/.local/bin.
# The parent Docker puts this directory into the PATH
