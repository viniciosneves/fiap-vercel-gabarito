# Etapa de build
FROM node:20 AS build

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante dos arquivos do projeto
COPY . .

# Construir o aplicativo
RUN npm run build

# Etapa de produção
FROM nginx:alpine

# Copiar os arquivos buildados para o diretório padrão do nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Expor a porta 80
EXPOSE 80

# Iniciar o nginx
CMD ["nginx", "-g", "daemon off;"]