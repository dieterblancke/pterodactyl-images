#!/bin/bash
steamcmd +login anonymous +force_install_dir /home/container/SatisfactoryDedicatedServer +app_update 1690800 -beta experimental validate +quit

cd /home/container/SatisfactoryDedicatedServer

# Starting FactoryServer
${STARTUP}