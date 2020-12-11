FROM alpine
ARG USER_ID=1000
ARG GROUP_ID=100

# Enable HTTPS support in wget and set nsswitch.conf to make resolution work within containers
RUN apk add --no-cache --update openssl \
  && echo hosts: dns files > /etc/nsswitch.conf

# curl for nix install; shadow for adding a user
RUN apk add --no-cache curl shadow

# create a "dscuser" user with the same user ID as host
RUN useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/sh dscuser

# install nix as dscuser
RUN install -d -m755 -o $(id -u dscuser) -g $(id -g dscuser) /nix
USER dscuser
RUN curl -L https://nixos.org/nix/install | sh
RUN echo "export USER=dscuser; source /home/dscuser/.nix-profile/etc/profile.d/nix.sh" >> /home/dscuser/.profile

# add entrypoint script; this just sources nix and runs its arguments inside a nix shell
USER root
RUN echo -e \
    '#! /bin/sh\n' \
    'source /home/dscuser/.profile\n' \
    'nix-shell --run "$@"\n' >> /home/dscuser/entry.sh
RUN chown dscuser /home/dscuser/entry.sh
RUN chmod +x /home/dscuser/entry.sh
USER dscuser

WORKDIR /home/dscuser
ENTRYPOINT ["/home/dscuser/entry.sh"]
