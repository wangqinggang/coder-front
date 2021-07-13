FROM node:lts-alpine as build-stage
WORKDIR /app
COPY /src ./src/
COPY /public ./public/
COPY package.json index.html jsconfig.json yarn.lock vite.config.js ./

# install simple http server for serving static content(dev)
# RUN yarn global add http-server

RUN yarn add vite && yarn install
COPY . .
RUN yarn run build

# serve /dist (dev)
# CMD [ "http-server", "dist" ]

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

# 打包命令 docker build -t coder .  