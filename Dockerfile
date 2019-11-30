FROM archlinux/base

RUN pacman -Syy --noconfirm pacman-contrib curl sed --needed && \
	curl -s "https://www.archlinux.org/mirrorlist/?country=FR&country=GB&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 6 - > /etc/pacman.d/mirrorlist && \
	pacman -Syu --noconfirm --needed \
		jdk8-openjdk \
		jdk11-openjdk \
		jdk-openjdk \
		maven \
		git \
		git-lfs \
		ca-certificates && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync /tmp/* /var/tmp/*

CMD /bin/sh
