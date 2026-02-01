FROM node:22.22

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  zsh \
  gh \
  vim \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY package*.json ./

RUN npm ci
