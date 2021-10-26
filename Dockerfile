FROM node:14-bullseye
LABEL maintainer="timo.stark@msg.group" \
        group.msg.at.cloud.cnj-hello-backend-nodejs.project="Cloudsbirds" \
        group.msg.at.cloud.cnj-hello-backend-nodejs.version="3.0.0" \
        group.msg.at.cloud.cnj-hello-backend-nodejs.description="Simplest possible node-modules backend based on Express"

RUN echo "adding run user nodejs to system" \
    && addgroup nodejs --gid 1001 \
    && adduser nodejs --uid 1001 --system --gid 1001

COPY package.json /home/nodejs/
COPY nodejs-entrypoint.sh /home/nodejs/
COPY src /home/nodejs/src

WORKDIR /home/nodejs

RUN npm install

RUN chown -R nodejs:nodejs /home/nodejs \
    && chmod u+x /home/nodejs/nodejs-entrypoint.sh

USER nodejs

EXPOSE 3000

ENTRYPOINT ["/home/nodejs/nodejs-entrypoint.sh"]
CMD ["npm", "start"]