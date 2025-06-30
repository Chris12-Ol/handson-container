FROM node:18-alpine AS build

WORKDIR /app
COPY frontend /app

RUN npm install && npm run build

FROM jtyr/asmttpd:0.4.4-1

COPY --from=build /app/dist/ /dist
EXPOSE 80

CMD ["/asmttpd", "/dist", "80"]
