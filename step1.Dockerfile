FROM ubuntu:24.04

# port à exposer pour accéder à l'application
EXPOSE 80

# on installe les outils nécessaire à la construction et à l'exécution
RUN apt update && apt install -y nodejs npm nginx

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY frontend /app

# On construit l'application et on la déplace dans le bon dossier pour nginx
RUN npm install && npm run build
RUN cp -r dist/* /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
