FROM haskell:7 
WORKDIR /bionitio

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get install hlint -y
RUN cabal update

COPY ./bionitio-hs.cabal /bionitio/bionitio-hs.cabal

RUN cabal install --only-dependencies -j4

COPY . /bionitio

RUN cabal install 
ENTRYPOINT ["bionitio-hs"]
