FROM archlinux:base-devel as toolchain-build

RUN pacman --noconfirm -Sy git

RUN git clone https://github.com/KallistiOS/KallistiOS  /opt/toolchains/dc-rust/kos && \
    git clone https://github.com/Rust-GCC/gccrs         /opt/toolchains/dc-rust/kos/utils/dc-chain/gcc-rs

ADD config.mk /opt/toolchains/dc-rust/kos/utils/dc-chain/

RUN cd /opt/toolchains/dc-rust/kos/utils/dc-chain && \
    ls -la && \
    ./download.sh && \
    ./unpack.sh && \
    rm -rf gcc-12.2.0 && \
    sed -i -e "s/sh_gcc_ver=12.2.0/sh_gcc_ver=rs/" config.mk && \
    make all && \
    ./cleanup.sh

RUN ls -la /opt/toolchains/dc-rust

FROM archlinux:base-devel as paru-build

COPY --from=toolchain-build /opt/toolchains/dc-rust/sh-elf      /opt/toolchains/dc-rust/sh-elf
COPY --from=toolchain-build /opt/toolchains/dc-rust/arm-eabi    /opt/toolchains/dc-rust/arm-eabi

# create user for pike makepkg build
RUN pacman -Syu --noconfirm && \
    pacman -S git --noconfirm && \
    useradd -m build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/build && \
    git clone https://aur.archlinux.org/pike.git /src/pike && \
    chown -R build:build /src

USER build

# building and patching pike
# could remove the sed line after gnome servers come back up
# gtkglarea was unavailable so its being patched out for now
# and I don't think sql is necessary so I figured could lose that dep as well
# seems to figure out those deps are missing and still build, probably some configure
# flag could be added to clean it up
RUN cd /src/pike && \
    sed -i -e "s/depends=('sane' 'libzip' 'libmariadbclient' 'gtkglarea' 'nettle')/depends=('sane' 'libzip' 'nettle')/" PKGBUILD && \
    cat PKGBUILD && \
    makepkg --noconfirm --syncdeps --install

ENV PATH="/opt/toolchains/dc-rust/sh-elf/bin:/opt/toolchains/dc-rust/arm-eabi/bin:$PATH"

# Symbol link arm toolchain since libronin wants arm-elf
RUN sudo ln -s /opt/toolchains/dc-rust/arm-eabi/bin/arm-eabi-as /opt/toolchains/dc-rust/arm-eabi/bin/arm-elf-as && \
    sudo ln -s /opt/toolchains/dc-rust/arm-eabi/bin/arm-eabi-gcc /opt/toolchains/dc-rust/arm-eabi/bin/arm-elf-gcc && \
    sudo ln -s /opt/toolchains/dc-rust/arm-eabi/bin/arm-eabi-objcopy /opt/toolchains/dc-rust/arm-eabi/bin/arm-elf-objcopy


