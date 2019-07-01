FROM haskell:7 
WORKDIR /bionitio

RUN apt-get update && apt-get install hlint
RUN cabal update

COPY ./bionitio-hs.cabal /bionitio/bionitio-hs.cabal

RUN cabal install --only-dependencies -j4

COPY . /bionitio

RUN cabal install 
ENTRYPOINT ["bionitio-hs"]
