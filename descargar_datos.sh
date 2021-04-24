#!/bin/bash

wget --progress=bar:force http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip 

mkdir datos_salud
unzip datos_abiertos_covid19.zip -d datos_salud/
rm -f datos_abiertos_covid19.zip
