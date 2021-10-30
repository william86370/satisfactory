#!/bin/bash 

# Check for satisfactory saves folder || create if it dosent exist
test -d ~/.config/Epic/FactoryGame/Saved || mkdir -p ~/.config/Epic/FactoryGame/Saved
test -d ${STEAMAPPDIR}/saves || mkdir ${STEAMAPPDIR}/saves
test -L ~/.config/Epic/FactoryGame/Saved/SaveGames || ln -s ${STEAMAPPDIR}/saves ~/.config/Epic/FactoryGame/Saved/SaveGames
mkdir -p "${STEAMAPPDIR}" || true  
# install satisfactory dedicated server 
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" validate \
				+quit

cd "${STEAMAPPDIR}"
# Start Server
./FactoryServer.sh