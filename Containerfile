# Building with a Fedora base, may be subject to change pending https://github.com/containers/bootc/issues/865
FROM quay.io/fedora/fedora-bootc:41

# Exclude system-cosmic-config
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --save --setopt=exclude=system-cosmic-config

# Install environment group
RUN dnf install -y @cosmic-desktop-environment
# Install latest git packages
RUN dnf copr enable -y ryanabx/cosmic-epoch && dnf install -y --best cosmic-desktop
# Clean dnf
RUN dnf clean all