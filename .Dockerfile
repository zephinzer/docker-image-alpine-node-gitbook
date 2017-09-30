FROM __IMAGE_NAME__:__IMAGE_TAG__
ENV GITBOOK_VERSION="__GITBOOK_VERSION__"
RUN npm install -g gitbook-cli && \
    gitbook fetch ${GITBOOK_VERSION} && \
    rm -rf /tmp/*
WORKDIR /app
COPY ./system/usr/bin /usr/bin
ENTRYPOINT ["get-container-info"]