#!/bin/bash

#Descargar los ultimos datos publicados por ls Secreataria de Salud Publica
wget --progress=bar:force http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip

#Descomprimir los datos en una nueva carpeta llamada datos_salud y eliminar el archivo zip
mkdir datos_salud
unzip datos_abiertos_covid19.zip -d datos_salud/
rm -f datos_abiertos_covid19.zip

#Procesar datos COVID
#Columnas disponibles 
#1: FECHA_ACTUALIZACION	    7: ENTIDAD_NAC		13: FECHA_DEF       19: HABLA_LENGUA_INDIG  25: HIPERTENSION    31: OTRO_CASO               37: MIGRANTE
#2: ID_REGISTRO		        8: ENTIDAD_RES		14: INTUBADO		20: INDIGENA			26: OTRA_COM		32: TOMA_MUESTRA_LAB		38: PAIS_NACIONALIDAD
#3: ORIGEN			        9: MUNICIPIO_RES	15: NEUMONIA		21: DIABETES			27: CARDIOVASCULAR	33: RESULTADO_LAB		    39: PAIS_ORIGEN
#4: SECTOR			       10: TIPO_PACIENTE	16: EDAD			22: EPOC			    28: OBESIDAD		34: TOMA_MUESTRA_ANTIGENO	40: UCI
#5: ENTIDAD_UM			   11: FECHA_INGRESO	17: NACIONALIDAD	23: ASMA			    29: RENAL_CRONICA	35: RESULTADO_ANTIGENO
#6: SEXO			       12: FECHA_SINTOMAS	18: EMBARAZO		24: INMUSUPR			30: TABAQUISMO		36: CLASIFICACION_FINAL

#En nueso caso utilizaremos las columnas 1, 8, 9, 13, 23, 27, y 30
#Elegiremos todos los municipios del estado de Sonora (ID=26)
#en cuyos casos los pacientes fallecieron, presenten o no algun sintoma relacionado al asma,
#cardiovascular o tabaquismo

#No especificamos el nombre del archivo por si cambia, en su lugar tomamos de referencia
#la Fecha de actualizacion de los datos
csvcut -c 1,8,9,13,23,30,27 datos_salud/*COVID19MEXICO.csv | csvgrep --columns ENTIDAD_RES --match "26" > municipios_sonora.csv

#Obtener latitud y longitud de los municipios de Sonora
#Datos Obtenidos de INEGI 
#Nombre del archivo AGEEML_2021521630391.csv
#Columnas disponibles
#1: Mapa        5: Cve_Mun  9: Ámbito           13: Lon_Decimal     17: Pob_Masculina
#2: Cve_Ent		6: Nom_Mun  10: Latitud			14: Altitud			18: Pob_Femenina
#3: Nom_Ent		7: Cve_Loc  11: Longitud		15: Cve_Carta		19: Total De Viviendas Habitadas
#4: Nom_Abr		8: Nom_Loc	12: Lat_Decimal		16: Pob_Total
#Solo ocupamos 3, 6, 8, 12 y 13
csvcut -c 3,6,8,12,13 AGEEML_2021521630391.csv | csvgrep -c "Nom_Ent" -m "Sonora" > inegi_sonora_lat_lon.csv

#En base a esto obtenemos los nombres de los municipios solamente sin tomar en cuenta las localidades
csvcut -c Nom_Mun inegi_sonora_lat_lon.csv  | uniq | sed '1d' > nombre_municipios_sonora.dat

#Lanzar la aplicacion
#voila mapa-covid19-sonora.ipynb
