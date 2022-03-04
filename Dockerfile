FROM garethr/kubeval:0.15.0

RUN apk --no-cache add curl bash git openssh-client

COPY LICENSE README.md /

COPY src/deps.sh /deps.sh
RUN /deps.sh

COPY src/hrval.sh /usr/local/bin/hrval.sh
COPY src/hrval-all.sh /usr/local/bin/hrval

# update helmv3 cli
RUN wget -c https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz -O - | tar -xz linux-amd64/helm  --to-stdout > /bin/helmv3 && chmod +x /bin/helmv3

ENTRYPOINT ["hrval"]
