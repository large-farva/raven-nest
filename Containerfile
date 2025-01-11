# Inherit from stable Bazzite
FROM ghcr.io/ublue-os/bazzite:stable

# KDE environment (kinoite). If you wanted GNOME, set this to "silverblue".
ARG BASE_IMAGE_NAME="kinoite"

LABEL \
  org.opencontainers.image.title="Raven Nest" \
  org.opencontainers.image.description="My wife's custom Bazzite image." \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.version="1.0.0"

# Remove dev tools, Vim, Lutris, MangoHUD
# Then install Firefox at the system level
RUN \
    rpm-ostree override remove \
      gcc* \
      clang* \
      cmake* \
      make* \
      vim* \
      lutris \
      mangohud* \
    && \
    rpm-ostree install \
      firefox \
    && \
    /usr/libexec/containerbuild/cleanup.sh \
    && \
    ostree container commit
