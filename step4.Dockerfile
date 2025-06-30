FROM node:18-alpine AS build

WORKDIR /app
COPY frontend /app

RUN npm install && npm run build

FROM franckcussac/rust-webserver:static

# port à exposer pour accéder à l'application
EXPOSE 80

# on récupère le résultat de notre conteneur de build
COPY --from=build /app/dist/ /public/
