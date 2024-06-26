# preserv-MX
[Preservación digital](https://en.wikipedia.org/wiki/Digital_preservation) de las principales fuentes de la **base de datos AddressForAll-México**, mantenida por el [Instituto AddressForAll](https://addressforall.org/).

A México se le asignó: en el contexto [ISO&nbsp;3166](https://en.wikipedia.org/wiki/ISO_3166) el geocódigo [**MX**](https://en.wikipedia.org/wiki/ISO_3166-2:MX) y el número [**484**](https://en.wikipedia.org/wiki/ISO_3166-1_numeric); en [Wikidata](https://wikidata.org) el identificador [Q96](https://wikidata.org/entity/Q96); en [OpenStreetMap](https://osm.org) el identificador de [*relación* 114686](https://osm.org/relation/114686).


## Organización territorial
El territorio nacional y sus subdivisiones representam **jurisdiciones**:

* El país está dividido en **32 entidades federativas**(treinta y un estados y la Ciudad de México, capital de la república).

* Los estados se subdividen en **2447 municipios**. Ciudad de México se subdividen en **16 demarcaciones territoriales**.

La jurisdicción que asigna nombres a las calles y el sistema de numeración urbana es el municipio.

https://es.wikipedia.org/wiki/Anexo:Entidades_federativas_de_M%C3%A9xico

## Organización de este repositorio

En este *git*, solo se guardan los metadatos, es decir, descriptores de entidad, como nombres y códigos geográficos &mdash; mapas y otros datos, almacenados externamente porque son muy grandes. Los metadatos se organizaron de la siguiente manera, en la carpeta [`/data`](./data):

* [`/data`](./data): datos originales de **entrada**, es decir, metadatos proporcionados para el sistema.
   * `jurisdictionLevel*.csv`:  jurisdicciones (en todos los niveles) y sus geocódigos. La primera subdivisión es [jurisdictionLevel4.csv](./data/jurisdictionLevel4.csv).
   * [`donor.csv`](./data/donor.csv): donantes de paquetes de datos. Metadatos de las instituciones que brindan datos oficiales.
   * [`donatedPack.csv`](./data/donatedPack.csv): descriptores de los archivos donados.
   * *paquetes* (carpetas `_packXX`): *hash*  y otros descriptores de archivos almacenados externamente, así como `makefile` y otros descriptores de proceso para descomprimir estos archivos y llevarlos a la base de datos (PostregSQL)... 

* [`/data/_out`](./data/_out): resultados generados por el sistema (**salida**), es decir, metadatos creados a partir de los algoritmos y estadísticas aplicados a los datos de `_pack`.

## Licencia
La licencia es específica para México y está en este enlace: https://www.inegi.org.mx/contenidos/inegi/doc/terminos_info.pdf (TÉRMINOS DE LIBRE USO DE LA INFORMACIÓN DEL INEGI)
La familia de la licencia es CC BY y requiere atribuir el dato a: "INEGI, Censos Económicos"
La licencia especifica: f) Debe otorgar los créditos correspondientes al INEGI como autor, y cuando técnicamente
sea posible, mencionar la fuente de extracción de la información de la siguiente manera:
“Fuente: INEGI, nombre del producto de donde se extrae la información” y en su caso fecha
de actualización, ejemplo: “Fuente: INEGI, Censos Económicos 2009”.

