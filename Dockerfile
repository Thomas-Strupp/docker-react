FROM node:16-alpine as build
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /build /usr/share/nginx/html

