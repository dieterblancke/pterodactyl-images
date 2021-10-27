FROM        ubuntu:20.04

MAINTAINER  Dieter Blancke
LABEL       author="Dieter Blancke"

# Insert Steam prompt answers
RUN         echo steam steam/question select "I AGREE" | debconf-set-selections \
            && echo steam steam/license note '' | debconf-set-selections

# Update the repository
RUN         apt-get update \
			&& apt-get install -y software-properties-common \
			&& add-apt-repository multiverse \
			&& dpkg --add-architecture i386

# Install SteamCMD and required libraries
RUN			apt-get update && apt-get -y upgrade \
			&& apt-get install -y libsdl2-2.0-0:i386 lib32gcc1 steamcmd

# Create container user and link steamcmd command
RUN			adduser --disabled-password --home /home/container container \
            && ln -s /usr/games/steamcmd /usr/bin/steamcmd

# Container setup
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]