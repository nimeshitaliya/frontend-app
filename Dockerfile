FROM nginx:alpine
COPY ./dist/poc-app /usr/share/nginx/html
EXPOSE 80
