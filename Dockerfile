###########################################################
# Dockerfile that builds a satisfactory docker container
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="william86370@gmail.com"

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/william86370/satisfactory

# Add entry script & satisfactory config
# Remove packages and tidy up
RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget \
		ca-certificates \
		libsdl2-2.0-0:i386 \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& wget --max-redirect=30 "${DLURL}/master/etc/entry.sh" -O "${HOMEDIR}/entry.sh" \
	&& { \
		echo '@ShutdownOnFailedCommand 1'; \
		echo '@NoPromptForPassword 1'; \
		echo 'login anonymous'; \
		echo 'force_install_dir '"${STEAMAPPDIR}"''; \
		echo 'app_update '"${STEAMAPPID}"''; \
		echo 'quit'; \
	   } > "${HOMEDIR}/${STEAMAPP}_update.txt" \
	&& chmod +x "${HOMEDIR}/entry.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" "${HOMEDIR}/${STEAMAPP}_update.txt" \	
	&& rm -rf /var/lib/apt/lists/* 

USER ${USER}

WORKDIR ${HOMEDIR}

EXPOSE 15777/udp 15000/udp 7777/udp

CMD ["/bin/bash","entry.sh"]