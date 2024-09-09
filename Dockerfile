# syntax=docker/dockerfile:1.4
FROM directus/directus:11.1.0
USER root
RUN corepack enable \
&& corepack prepare pnpm@8.7.6 --activate \
&& chown node:node /directus
EXPOSE 8055
USER node
RUN pnpm install @directus-labs/video-player-interface
CMD : \
&& node /directus/cli.js bootstrap \
&& node /directus/cli.js start;