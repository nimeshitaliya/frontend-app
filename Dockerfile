FROM nginx:alpine
COPY ./dist/frontend-app /usr/share/nginx/html
EXPOSE 80
