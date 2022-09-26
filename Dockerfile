FROM node:alpine

WORKDIR /srv/app

ARG OPENAPISPEC="https://abrasel-nacional.github.io/docs/openapi.yaml"
ENV OPENAPISPEC=${OPENAPISPEC}

RUN wget ${OPENAPISPEC} \
  --tries 5 \
  -O openapi.yaml

RUN npm install -g @mockoon/cli

CMD ["mockoon-cli", "start", "-l", "0.0.0.0", "-D", "--data", "openapi.yaml"]
