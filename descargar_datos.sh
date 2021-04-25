#!/bin/bash

#git clone https://github.com/danielmc81/mcd.git
#cd mcd

wget --progress=bar:force http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip 

mkdir datos_salud
unzip datos_abiertos_covid19.zip -d datos_salud/
rm -f datos_abiertos_covid19.zip

/root/miniconda3/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
