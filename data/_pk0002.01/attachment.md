# Adjunto

## Proceso utilizado para reagrupar datos convenientemente

1. Creación del directorio de trabajo:

```sh
mkdir arquivos && cd arquivos

```

2. Obteniendo la lista de archivos en formato csv:

Busque y exporte el resultado de búsqueda de `Vectorial de localidades amanzanadas y números exteriores, Urbanas` o `Vectorial de localidades amanzanadas y números exteriores, Rurales` en https://www.inegi.org.mx/app/mapas/#Busqueda_avanzada en la raíz del paquete de datos.

![image](https://github.com/digital-guard/preserv-MX/blob/main/data/_pk0002.01/buscaAvancada.png)


3. Preparando la lista de archivos para descargar:

```sh
grep -E -i '^\"?[0-9]+' ../Mapas_2024411_22115535.csv | awk -F"[\.,]"  '{print $1","$3","$12}' | sed 's/\"//g;s/, /,/g;s/\"//g;s/Urbanas/urbana/;s/Rurales/rural/;s/ /_/g' > data.csv
```

4. Script para descargar archivos:

```sh
#! /bin/bash
while IFS="," read -r c1 c2 c3
do
  wget https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/${c2}/SHP_2/${c3}/${c1}_s.zip
done < data.csv
```

5. Script para generar el sha256 de los archivos descargados:

```sh
#! /bin/bash
while IFS="," read -r c1 c2 c3
do
  sha256=$(sha256sum -b ${c1}_s.zip)
  echo "https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/geografia/${c2}/SHP_2/${c3}/${c1}_s.zip,${sha256}" >> sha256_originales.csv
done < data.csv
```

6. Descomprimir archivos descargados:

```sh
a


#! /bin/bash
mkdir extract1
while IFS="," read -r c1 c2 c3
do
  unzip -o ${c1}_s.zip -d extract1
done < data.csv
```

7. Descomprimir archivos comprimidos dentro de archivos comprimidos:

```sh
mkdir extract{2,3,4,5}
find extract1 -type f -name '*.zip' -exec unzip -o {} -d extract2 \; &> logunzip2
find extract2 -type f -name '*.zip' -exec unzip -o {} -d extract3 \; &> logunzip3
find extract1/conjunto_de_datos -type f -name '*.zip' -exec unzip -o {} -d extract4 \; &> logunzip4
find extract4 -type f -name '*.zip' -exec unzip -o {} -d extract5 \; &> logunzip5
```

8. Crear directorios para diferentes tipos de datos:

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

9. Mover datos a los directorios respectivos:

```sh
find . -type f \( -name \*sia.shp -o -name \*sia.dbf -o -name \*sia.prj -o -name \*sia.shx -o -name \*sia.shp.xml \) -exec mv -t servicio_publico {} +
find . -type f \( -name \*sip.shp -o -name \*sip.dbf -o -name \*sip.prj -o -name \*sip.shx -o -name \*sip.shp.xml \) -exec mv -t poi {} +
find . -type f \( -name \*ne.shp  -o -name \*ne.dbf  -o -name \*ne.prj  -o -name \*ne.shx  -o -name \*ne.shp.xml  \) -exec mv -t direccion  {} +
find . -type f \( -name \*fm.shp  -o -name \*fm.dbf  -o -name \*fm.prj  -o -name \*fm.shx  -o -name \*fm.shp.xml  \) -exec mv -t frente_manzana  {} +
find . -type f \( -name \*as.shp  -o -name \*as.dbf  -o -name \*as.prj  -o -name \*as.shx  -o -name \*as.shp.xml  \) -exec mv -t asentamiento  {} +
find . -type f \( -name \*v.shp   -o -name \*v.dbf   -o -name \*v.prj   -o -name \*v.shx   -o -name \*v.shp.xml   \) -exec mv -t vial   {} +
find . -type f \( -name \*a.shp   -o -name \*a.dbf   -o -name \*a.prj   -o -name \*a.shx   -o -name \*a.shp.xml   \) -exec mv -t area_geoestadistica {} +
find . -type f \( -name \*m.shp   -o -name \*m.dbf   -o -name \*m.prj   -o -name \*m.shx   -o -name \*m.shp.xml   \) -exec mv -t manzana   {} +
find . -type f \( -name \*l.shp   -o -name \*l.dbf   -o -name \*l.prj   -o -name \*l.shx   -o -name \*l.shp.xml   \) -exec mv -t area_urbana   {} +
```

10. Comprimir archivos:

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

11. Preservación digital de archivos generados:

Para preservar digitalmente los archivos generados en el ítem anterior, consulte el paso del Workflow: https://wiki.addressforall.org/doc/dg:Workflow#Gerar_sha256

```sh
upcloud(){
    link_operacao='operacao:preserv.addressforall.org/download/'
    file=$1

    sha256file=$(sha256sum -b ${file} | cut -d' ' -f1)

    file_namezip=${sha256file}.zip

    mv $file $file_namezip

    sudo rclone copy ${file_namezip} ${link_operacao}
    url_cloud=$( sudo rclone link ${link_operacao}${file_namezip})

    echo "${file_namezip},${url_cloud}"
}

upcloud area_geoestadistica.zip
upcloud area_urbana.zip
upcloud asentamiento.zip
upcloud direccion.zip
upcloud frente_manzana.zip
upcloud manzana.zip
upcloud poi.zip
upcloud servicio_publico.zip
upcloud vial.zip
```

12. Eliminar los archivos:

```sh
cd ../ && rm -rf arquivos
```

12. Subir diferencias al repositorio remoto:

```sh
git push
```
