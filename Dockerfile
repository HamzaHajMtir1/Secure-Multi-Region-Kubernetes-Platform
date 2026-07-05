FROM node:20-alpine3.22

RUN addgroup -g 10001 -S appgroup && \
    adduser -S -D -H -u 10001 -G appgroup appuser

WORKDIR /app

COPY app/src ./src

USER 10001

EXPOSE 3000

CMD ["node", "src/index.js"]