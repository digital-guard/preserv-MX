## Proceso utilizado para reagrupar datos convenientemente

1. Preparando la lista de archivos para descargar:

```sh
mkdir arquivos && cd arquivos

grep -E -i '^[0-9]+' Mapas_2023719_214631165.csv | awk -F"[\.,]"  '{print $1","$3","$12}' | sed 's/, /,/g;s/Urbanas/urbana/;s/Rurales/rural/;s/ /_/g' > data.csv
```

2. Script para descargar archivos:

```sh
#! /bin/bash
while IFS="," read -r c1 c2 c3
do
  wget https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/${c2}/SHP_2/${c3}/${c1}_s.zip
done < data.csv
```

3. Script para generar el sha256 de los archivos descargados:

```sh
#! /bin/bash
while IFS="," read -r c1 c2 c3
do
  sha256=$(sha256sum -b ${c1}_s.zip)
  echo "https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/${c2}/SHP_2/${c3}/${c1}_s.zip,${sha256}" >> ../sha256_originales.csv
done < ../data.csv
```

4. Descomprimir archivos descargados:

```sh
#! /bin/bash
while IFS="," read -r c1 c2 c3
do
  unzip -o ${c1}_s.zip -d extract1
done < ../data.csv
```

5. Descomprimir archivos comprimidos dentro de archivos comprimidos:

```sh
find arquivos/extract1 -type f -name '*.zip' -exec unzip -o {} -d arquivos/extract2 \; &> logunzip2
find arquivos/extract2 -type f -name '*.zip' -exec unzip -o {} -d arquivos/extract3 \; &> logunzip3
find arquivos/extract1/conjunto_de_datos -type f -name '*.zip' -exec unzip -o {} -d arquivos/extract4 \; &> logunzip4
find arquivos/extract4 -type f -name '*.zip' -exec unzip -o {} -d arquivos/extract5 \; &> logunzip5
```

6. Crear directorios para diferentes tipos de datos:

```sh
mkdir {a,as,fm,l,m,ne,sia,sip,v}

mv a   area_geoestadistica
mv as  asentamiento
mv fm  frente_manzana
mv l   area_urbana
mv m   manzana
mv ne  direccion
mv sia servicio_publico
mv sip poi
mv v   vial
```

7. Mover datos a los directorios respectivos:

```sh
find arquivos -type f \( -name \*sia.shp -o -name \*sia.dbf -o -name \*sia.prj -o -name \*sia.shx -o -name \*sia.shp.xml \) -exec mv -t arquivos_r/servicio_publico {} +
find arquivos -type f \( -name \*sip.shp -o -name \*sip.dbf -o -name \*sip.prj -o -name \*sip.shx -o -name \*sip.shp.xml \) -exec mv -t arquivos_r/poi {} +
find arquivos -type f \( -name \*ne.shp  -o -name \*ne.dbf  -o -name \*ne.prj  -o -name \*ne.shx  -o -name \*ne.shp.xml  \) -exec mv -t arquivos_r/direccion  {} +
find arquivos -type f \( -name \*fm.shp  -o -name \*fm.dbf  -o -name \*fm.prj  -o -name \*fm.shx  -o -name \*fm.shp.xml  \) -exec mv -t arquivos_r/frente_manzana  {} +
find arquivos -type f \( -name \*as.shp  -o -name \*as.dbf  -o -name \*as.prj  -o -name \*as.shx  -o -name \*as.shp.xml  \) -exec mv -t arquivos_r/asentamiento  {} +
find arquivos -type f \( -name \*v.shp   -o -name \*v.dbf   -o -name \*v.prj   -o -name \*v.shx   -o -name \*v.shp.xml   \) -exec mv -t arquivos_r/vial   {} +
find arquivos -type f \( -name \*a.shp   -o -name \*a.dbf   -o -name \*a.prj   -o -name \*a.shx   -o -name \*a.shp.xml   \) -exec mv -t arquivos_r/area_geoestadistica {} +
find arquivos -type f \( -name \*m.shp   -o -name \*m.dbf   -o -name \*m.prj   -o -name \*m.shx   -o -name \*m.shp.xml   \) -exec mv -t arquivos_r/manzana   {} +
find arquivos -type f \( -name \*l.shp   -o -name \*l.dbf   -o -name \*l.prj   -o -name \*l.shx   -o -name \*l.shp.xml   \) -exec mv -t arquivos_r/area_urbana   {} +
```
8. Comprimir archivos:

```sh
zip -r area_geoestadistica.zip area_geoestadistica
zip -r area_urbana.zip area_urbana
zip -r asentamiento.zip asentamiento
zip -r direccion.zip direccion
zip -r frente_manzana.zip frente_manzana
zip -r manzana.zip manzana
zip -r poi.zip poi
zip -r servicio_publico.zip servicio_publico
zip -r vial.zip vial
```

