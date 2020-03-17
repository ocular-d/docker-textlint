FROM node:12.16.1-alpine3.11

LABEL maintainer "Sven <sven@ocular-d.tech>" \
    org.label-schema.vendor = "ocular-d"

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

ENV TEXTLINT_VERSION=11.6.3
ENV TEXTLINT_MAX_NUMMER_OF_LINES=1.0.3

RUN npm install --no-cache -g textlint@${TEXTLINT_VERSION} \
    textlint-rule-max-number-of-lines@${TEXTLINT_MAX_NUMMER_OF_LINES}

USER node
ENTRYPOINT ["textlint"]
CMD ["-h"]

