FROM node:14.17-alpine

WORKDIR /usr/app
COPY --chown=node:node package.json package-lock.json ./
ARG devmode
RUN if [ "$devmode" = "true" ]; \
		then npm i; \
		else npm ci --only=production; \
	fi
COPY --chown=node:node . .

USER node
CMD if [ "${NODE_ENV}" = "development" ]; \
		then npm run dev; \
		else node src/index.js; \
	fi
