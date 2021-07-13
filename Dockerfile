# build stage
FROM node:lts-alpine as build-stage

# dev 引入node
# FROM node:lts-alpine

WORKDIR /app
COPY /src ./src/
COPY /public ./public/
COPY package.json index.html jsconfig.json yarn.lock vite.config.js ./

# install simple http server for serving static content
# RUN yarn global add http-server

RUN yarn add vite && yarn install
COPY . .
RUN yarn run build

# EXPOSE 8080
# CMD [ "http-server", "dist" ]


# prod stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

# 最后生成的镜像，以最后一条 FROM 为准

# 打包命令 docker build -t coder .  