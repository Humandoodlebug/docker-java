FROM archlinux/base

RUN pacman -Syy --noconfirm pacman-contrib curl sed --needed && \
	curl -s "https://www.archlinux.org/mirrorlist/?country=FR&country=GB&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 6 - > /etc/pacman.d/mirrorlist && \
	pacman -Syyu --noconfirm --needed \
		jdk8-openjdk \
		jdk11-openjdk \
		jdk-openjdk \
		maven \
		git \
		git-lfs \
		ca-certificates && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync /tmp/* /var/tmp/*


ENV JAVA_HOME_8_X64="/usr/lib/jvm/java-8-openjdk"
ENV JAVA_HOME_8="/usr/lib/jvm/java-8-openjdk"
ENV JAVA_HOME_11_X64="/usr/lib/jvm/java-11-openjdk"
ENV JAVA_HOME_11="/usr/lib/jvm/java-11-openjdk"
ENV JAVA_HOME_X64="/usr/lib/jvm/default"
ENV JAVA_HOME="/usr/lib/jvm/default"

CMD /bin/sh
