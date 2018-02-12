FROM alpine:3.7

RUN apk update && apk upgrade
RUN apk add curl git unzip jq openssh-client python3 groff bind-tools bash bash-completion coreutils --update
RUN pip3 install pyhcl

ENV PLATFORM_DIR=/platform \
    KD_VERSION=0.8.0 \
    KUBECTL_VERSION=1.9.2 \
    PAGER="busybox less" \
    TMPDIR="/tmp" \
    XTERM=linux

WORKDIR $PLATFORM_DIR

RUN curl -sL https://github.com/UKHomeOffice/kd/releases/download/v${KD_VERSION}/kd_linux_amd64 -o /usr/bin/kd && \
    curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl

RUN chmod +x /usr/bin/kd /usr/bin/kubectl

RUN /usr/bin/kd --version && \
    /usr/bin/kubectl version --client

ADD .bashrc /root/.bashrc
ADD ./scripts ${PLATFORM_DIR}/scripts

ENTRYPOINT [ "/bin/bash" ]
