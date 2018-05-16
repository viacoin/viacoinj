FROM base/archlinux

# force locale for value formatting
RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

# install gradle and build dependencies
RUN pacman --noconfirm -Syy jdk8-openjdk gradle protobuf
RUN echo "1" | pacman --noconfirm -S java-openjfx

CMD ["/bin/bash"]
