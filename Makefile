PORTNAME=teamviewer-iot-agent
PORTVERSION=2.20.2
CATEGORIES=net-mgmt
MASTER_SITES=https://download.teamviewer-iot.com/agents/freebsd/2.20.2/x86_64/

LICENSE=EULA
LICENSE_NAME=TeamViewer IoT End-User License Agreement http://www.teamviewer.com/link/?url=653670
LICENSE_FILE=${WRKSRC}/usr/local/share/doc/teamviewer-iot-agent/copyright
LICENSE_PERMS=auto-accept

MAINTAINER=service@teamviewer.com
COMMENT=TeamViewer IoT Agent provides easy, fast and secure remote access to your device

# This is empty on purpose
do-build:

do-install:
	${MKDIR} ${STAGEDIR}/usr/local/libexec/teamviewer-iot-agent
	${MKDIR} ${STAGEDIR}/etc/defaults
	${MKDIR} ${STAGEDIR}/etc/teamviewer-iot-agent
	${MKDIR} ${STAGEDIR}/usr/local/share/doc/teamviewer-iot-agent
	${MKDIR} ${STAGEDIR}/usr/local/etc/rc.d
	${MKDIR} ${STAGEDIR}/usr/local/etc/rc.conf.d
	${INSTALL_PROGRAM} ${WRKSRC}/usr/local/libexec/teamviewer-iot-agent/teamviewer-iot-agent ${STAGEDIR}/usr/local/libexec/teamviewer-iot-agent
	${INSTALL_LIB} ${WRKSRC}/usr/local/libexec/teamviewer-iot-agent/TVResource.so ${STAGEDIR}/usr/local/libexec/teamviewer-iot-agent
	${INSTALL_DATA} ${WRKSRC}/etc/defaults/teamviewer-iot-agent.conf ${STAGEDIR}/etc/defaults/
	${INSTALL_DATA} ${WRKSRC}/etc/teamviewer-iot-agent/agent.conf ${STAGEDIR}/etc/teamviewer-iot-agent/
	${INSTALL_DATA} ${WRKSRC}/etc/teamviewer-iot-agent/agent.conf ${STAGEDIR}/etc/teamviewer-iot-agent/agent.conf.sample
	${INSTALL_DATA} ${WRKSRC}/usr/local/share/doc/teamviewer-iot-agent/description ${STAGEDIR}/usr/local/share/doc/teamviewer-iot-agent/
	${INSTALL_DATA} ${WRKSRC}/usr/local/share/doc/teamviewer-iot-agent/copyright ${STAGEDIR}/usr/local/share/doc/teamviewer-iot-agent/
	${INSTALL_DATA} ${WRKSRC}/usr/local/share/doc/teamviewer-iot-agent/Third_Party_License_IoT.txt ${STAGEDIR}/usr/local/share/doc/teamviewer-iot-agent/
	${INSTALL_DATA} ${WRKSRC}/usr/local/share/doc/teamviewer-iot-agent/README_FreeBSD ${STAGEDIR}/usr/local/share/doc/teamviewer-iot-agent/
	${INSTALL_DATA} ${WRKSRC}/usr/local/etc/rc.conf.d/teamviewer_iot_agent ${STAGEDIR}/usr/local/etc/rc.conf.d/
	${INSTALL_DATA} ${WRKSRC}/usr/local/etc/rc.conf.d/teamviewer_iot_agent ${STAGEDIR}/usr/local/etc/rc.conf.d/teamviewer_iot_agent.sample
	${INSTALL_SCRIPT} ${WRKSRC}/usr/local/etc/rc.d/teamviewer_iot_agent ${STAGEDIR}/usr/local/etc/rc.d/

post-install:
	${MKDIR} ${STAGEDIR}/var/db/teamviewer-iot-agent/.local
	${MKDIR} ${STAGEDIR}/var/log/teamviewer-iot-agent
	${MKDIR} ${STAGEDIR}/var/crash/teamviewer-iot-agent

.include <bsd.port.mk>
