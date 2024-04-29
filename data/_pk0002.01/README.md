<aside>
<table align="right" style="padding: 1em">
<tr><td>Paquete <big><b>pk0002.01</b></big> de <small><a target="_afacodes" title="Jurisdicción" href="https://afa.codes/MX">MX</a></small>
</td></tr>
<tr><td>
Donante: <a rel="external" target="_doador" href="https://www.inegi.org.mx">Instituto Nacional de Estadística y Geografía</a>
<br/>&nbsp; <small>RFC INE0804164Z7</small> • Wikidata <a rel="external" target="_doador" title="Enlace del descriptor Wikidata del donante" href="https://www.wikidata.org/wiki/Q795074">Q795074</a></small><br/>
Licencia <a rel="external" target="_doador" href="https://git.digital-guard.org/licenses/blob/master/reports/implied-INEGI-MX-v1.md"><b>Implied INEGI-MX-1.0</b></a> (by)<br/>
Obtido via <i>site</i> em <b>12/04/2024</b> por:
<br/>&nbsp; Avaliação técnica: <a rel="external" target="_gitPerson" title="Usuario de Git" href="https://github.com/0e1">0e1</a>
<br/>&nbsp; Representação institucional: <a rel="external" target="_gitPerson" title="Usuario de" href="https://github.com/ThierryAJean">ThierryAJean</a><br/>
</td></tr>
<tr><td>Camadas: <a title="via" href="#-via"><img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-via.png" alt="via" width="20"/></a> <a title="block" href="#-block"><img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-block.png" alt="block" width="20"/></a> <a title="nsvia" href="#-nsvia"><img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-nsvia.png" alt="nsvia" width="20"/></a> <a title="geoaddress" href="#-geoaddress"><img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-geoaddress.png" alt="geoaddress" width="20"/></a> </td></tr>
<tr><td>Datos publicados en <a href="https://git.digital-guard.org/preservCutGeo-MX2021/tree/main/data/_pk0002.01">preservCutGeo-MX2021</a><br/><a href="#reproducibilidad">Reproducible</a></td></tr>
<tr><td>Visualización: <a title="geoaddress" href="https://viz.addressforall.org/MX/_pk0002.01/geoaddress"><img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-geoaddress.png" alt="geoaddress" width="20"/></a> </td></tr>
</table>
</aside>

<section>

Este repositorio de metadatos describe un paquete de archivos donados al dominio público. Está siendo conservado por Digital Guard: para obtener más detalles, consulte la [documentación sobre el proceso de registro y conservación](https://wiki.addressforall.org/doc/Documentação_Digital-guard).

Nota. Este documento README fue generado por software a partir de la información contenida en el archivo [`make_conf.yaml`](https://git.digital-guard.org/preserv-MX/blob/main/data/_pk0002.01/make_conf.yaml) en este paquete, e información adicional de los catálogos de [donantes](https://git.digital-guard.org/preserv-BR/blob/main/data/donor.csv) y [paquetes](https://git.digital-guard.org/preserv-BR/blob/main/data/donatedPack.csv).

# Capas de datos

Los archivos contienen "capas de datos" temáticas. Los metadatos también describen cómo se evaluó cada capa y cómo se filtraron sus datos de forma estandarizada.

## <img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-geoaddress.png" alt="geoaddress" width="20"/> geoaddress

Nombre del archivo: `direccion/*ne`<br/>*Descarga* e integridad: [cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip](https://dl.digital-guard.org/cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip)<br/>Descripción: Direccion<br/>Tamaño del archivo: 586193052 bytes (559.04 <abbr title="mebibyte">MiB</abbr>)<br/>Formato: shp<br/>SRID: 6362

#### Datos relevantes
* `numext` (hnum): número de dirección externo. Sin número es representado como "SN".

* `tipovial || ' ' || nomvial` (via): nombre de la vía en mayúsculas, con acentuación y abreviaturas. Sin nombre es representado como "NINGUNO".

* `nomasen` (nsvia): nombre del asentamiento.

* `cvegeo` (ref): clave de estadística INEGI para la dirección.

#### Otros datos relevantes
* `tipoasen`: tipo del asentamiento (barrio, colonia etc.).

#### Filtrado de resultados y su publicación
734393679 bytes (700.37 <abbr title="mebibyte">MiB</abbr>)<br/>13775321 pontos<br/>densidad media: 1791.59 pontos/km²<br/>GeoJSONs publicados em [https://git.digital-guard.org/preservCutGeo-MX2021/tree/main/data/_pk0002.01/geoaddress](https://git.digital-guard.org/preservCutGeo-MX2021/tree/main/data/_pk0002.01/geoaddress)

#### Visualización
[https://viz.addressforall.org/MX/_pk0002.01/geoaddress](https://viz.addressforall.org/MX/_pk0002.01/geoaddress)
## <img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-block.png" alt="block" width="20"/> block

Nombre del archivo: `m`<br/>*Descarga* e integridad: [10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip](https://dl.digital-guard.org/10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip)<br/>Descripción: Manzana<br/>Tamaño del archivo: 462956079 bytes (441.51 <abbr title="mebibyte">MiB</abbr>)<br/>Formato: shp<br/>SRID: 6362

#### Datos relevantes
* `cvegeo` (ref): clave de estadística INEGI para la manzana.

## <img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-nsvia.png" alt="nsvia" width="20"/> nsvia

Nombre del archivo: `as`<br/>*Descarga* e integridad: [f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip](https://dl.digital-guard.org/f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip)<br/>Descripción: Asentamiento<br/>Tamaño del archivo: 19495408 bytes (18.59 <abbr title="mebibyte">MiB</abbr>)<br/>Formato: shp<br/>SRID: 6362

#### Datos relevantes
* `nomasen` (nsvia): nombre del asentamiento.

* `cveasen` (ref): clave de estadística INEGI para el asentamiento.

#### Otros datos relevantes
* `tipoasen`: tipo del asentamiento (barrio, colonia etc.).

## <img src="https://raw.githubusercontent.com/digital-guard/preserv/main/docs/assets/layerIcon-via.png" alt="via" width="20"/> via

Nombre del archivo: `v`<br/>*Descarga* e integridad: [a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip](https://dl.digital-guard.org/a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip)<br/>Descripción: Vial<br/>Tamaño del archivo: 115690125 bytes (110.33 <abbr title="mebibyte">MiB</abbr>)<br/>Formato: shp<br/>SRID: 6362

#### Datos relevantes
* `tipovial || ' ' || nomvial` (via): nombre de la vía en mayúsculas, con acentuación y abreviaturas. Sin nombre es representado como "NINGUNO".

# Evidencia de prueba
<img src="evidenceTest.png" width="400"/>

</section>
<section>

# Reproducibilidad

Consulte los detalles en [reproducibility.sh](https://git.digital-guard.org/preserv-MX/blob/main/data/_pk0002.01/reproducibility.sh).

</section>

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
