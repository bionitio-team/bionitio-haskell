FROM haskell:8
WORKDIR /bionitio
COPY . .

RUN stack install 
