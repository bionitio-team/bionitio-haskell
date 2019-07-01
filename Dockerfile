FROM haskell:8
WORKDIR /bionitio
COPY . .

RUN stack setup
RUN stack install 
