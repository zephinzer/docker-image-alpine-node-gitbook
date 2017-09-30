FROM __IMAGE_NAME__:__IMAGE_TAG__
ENV GITBOOK_VERSION="__GITBOOK_VERSION__"
ENV PATHS_TO_REMOVE="\
  /tmp/* \
  /root/.gnupg/* \
  /root/.node-gyp/* \
  /root/.npm/* \
  /usr/include/* \
  /usr/lib/node_modules/npm/man/* \
  /usr/lib/node_modules/npm/doc/* \
  /usr/lib/node_modules/npm/html/* \
  /usr/lib/node_modules/npm/scripts/* \
  /usr/share/man/* \
  /var/cache/apk/*"
RUN npm install -g gitbook-cli && \
    gitbook fetch ${GITBOOK_VERSION} && \
    rm -rf ${PATHS_TO_REMOVE}
WORKDIR /app
COPY ./system/usr/bin /usr/bin
ENTRYPOINT ["get-container-info"]