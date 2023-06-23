FROM ubuntu:lunar as build

RUN apt update
RUN apt install curl jq -y

WORKDIR /opt/minecraft

COPY download-paper.sh download-paper.sh

RUN chmod +x download-paper.sh
RUN ./download-paper.sh 1.19.4 

##################################################

FROM eclipse-temurin:20-jre as runtime

ARG memory_size=6G
ENV MEMORYSIZE=$memory_size

WORKDIR /opt/minecraft
RUN useradd docker

COPY ./start-server.sh ./start-server.sh
COPY ./docker-entrypoint.sh ./docker-entrypoint.sh 
COPY --from=build /opt/minecraft/paper.jar paper.jar
RUN chmod +x start-server.sh docker-entrypoint.sh

USER docker

# expose minecraft ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

# expose rcon port
EXPOSE 25575/tcp 

ENTRYPOINT /opt/minecraft/docker-entrypoint.sh