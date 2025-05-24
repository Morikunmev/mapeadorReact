# Dockerfile
FROM node:18-alpine

# Instalar herramientas adicionales para hot reload
RUN apk add --no-cache bash

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo package.json para aprovechar cache de Docker
COPY package.json ./

# Instalar dependencias (esto se cachea si package.json no cambia)
RUN npm install

# Copiar el resto de archivos
COPY . .

# Exponer puerto
EXPOSE 3000

# Variables de entorno para desarrollo optimizado
ENV CHOKIDAR_USEPOLLING=true
ENV FAST_REFRESH=true
ENV WDS_SOCKET_HOST=localhost
ENV WATCHPACK_POLLING=true

# Comando para desarrollo con hot reload mejorado
CMD ["npm", "start"]