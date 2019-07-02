FROM haskell:7.10
WORKDIR /bionitio

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get install hlint -y

COPY . /bionitio
RUN stack install 

RUN which bionitio
RUN env 

ENTRYPOINT ["/root/.local/bin/bionitio"]
