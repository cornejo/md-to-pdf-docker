FROM node:23

RUN set -ex ; \
    apt-get update ; \
    apt-get install -y fonts-noto-cjk ; \
    apt-get install -y libnss3 libdbus-1-3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libxkbcommon0 libasound2 ; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex ; \
    npm install -g md-to-pdf ; \
    rm -rf ~/.npm/cache/* ; \
    mkdir -p /opt/docs

WORKDIR /opt/docs

COPY fonts.conf /etc/fonts/conf.d/99-local.conf

ENV NODE_PATH=/usr/local/lib/node_modules

USER node

RUN set -ex ; \
    echo y | npx puppeteer browsers install chrome

CMD ["/bin/bash"]

