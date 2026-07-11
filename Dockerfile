FROM node:22-alpine3.23

RUN rm -rf /usr/local/lib/node_modules/npm && \
    rm -f /usr/local/bin/npm /usr/local/bin/npx && \
    addgroup -g 10001 -S appgroup && \
    adduser -S -D -H -u 10001 -G appgroup appuser

WORKDIR /app

COPY app/src ./src

USER 10001

EXPOSE 3000

CMD ["node", "src/index.js"]