FROM nginx:alpine

# Copiamos tu web
COPY index.html /usr/share/nginx/html/index.html

# Cambiamos Nginx para que escuche en 8080 (Railway suele usar 8080)
RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/conf.d/default.conf && \
sed -i 's/listen \\[::\\]:80;/listen [::]:8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
