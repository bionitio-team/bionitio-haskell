FROM ubuntu:18.04 
WORKDIR /bionitio
COPY . .

# RUN stack install --resolver ghc-8.4.3

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442
RUN echo 'deb http://download.fpcomplete.com/ubuntu precise main' | tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && sudo apt-get install stack -y
RUN stack setup
RUN stack install 
