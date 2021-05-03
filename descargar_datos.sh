#!/bin/bash

#Descargar los ultimos datos publicados por ls Secreataria de Salud Publica
wget --progress=bar:force http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip 

#Descomprimir los datos en una nueva carpeta llamada datos_salud y eliminar el archivo zip
mkdir datos_salud
unzip datos_abiertos_covid19.zip -d datos_salud/
rm -f datos_abiertos_covid19.zip

#Lanzar la libreta de jupiter disponible para todos (0.0.0.0)
#Puerto por default 8888
#No ocupamos que se abra un navegador, por eso se lo decimos explicitamente con "--no-browser"
#Por ultimo le permitimos acceso como root, como estamos en un contenedor esto no implica ningun riesgo.
#/root/miniconda3/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
voila mapa-covid19-sonora.ipynb
