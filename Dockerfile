FROM eclipse-temurin:20-jre as build

RUN apt update && apt upgrade -y
RUN apt install curl jq -y

WORKDIR /opt/minecraft

COPY download-paper.sh download-paper.sh

RUN chmod +x download-paper.sh
RUN ./download-paper.sh 1.19.4 

##################################################

FROM eclipse-temurin:20-jre as runtime

ARG memory_size=6G
ENV MEMORYSIZE=$memory_size

WORKDIR /data
RUN useradd docker

COPY ./start-server.sh /data/start-server.sh
COPY --from=build /opt/minecraft/paper.jar paper.jar
RUN chmod +x start-server.sh
RUN chown -R docker /data

USER docker

# expose minecraft ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

# expose rcon port
EXPOSE 25575/tcp 

ENTRYPOINT /data/start-server.sh