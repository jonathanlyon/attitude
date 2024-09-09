# syntax=docker/dockerfile:1.4
FROM directus/directus:11.1.0

USER root
# Enable corepack and activate pnpm
RUN corepack enable \
  && corepack prepare pnpm@8.7.6 --activate \
  && chown node:node /directus

# Expose Directus port
EXPOSE 8055

USER node
# Install the necessary Directus extension (without --dev if not needed)
RUN pnpm add @directus-labs/video-player-interface

# Start Directus after bootstrapping if needed
CMD node /directus/cli.js bootstrap && node /directus/cli.js start