FROM nginx
        
COPY public /usr/share/nginx/html/
COPY ./nginx.conf /etc/nginx/nginx.conf
CMD ["nginx","-g","daemon off;"]