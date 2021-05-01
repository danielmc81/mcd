# Trabajando con datos COVID19 en Sonora

## Requisitos previos  
- Docker
- Git

## Instalación  

1. Descargar el repositorio  
   ```git clone https://github.com/danielmc81/mcd.git```
2. Crear la imagen docker  
   ```docker build -t mcd/covid19 .```
3. Inicializar un contenedor con base en la imagen que acabamos de crear  
   ```docker run --rm -it -p 8888:8888 mcd/covid19```

