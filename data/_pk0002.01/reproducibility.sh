#!/bin/bash


# layer block:
rm -rf /tmp/sandbox/_pk48400000201_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/55e32574fbee8b1088979c56dfb44d7f585d94e4677957bb61defa74e7b92377.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/55e32574fbee8b1088979c56dfb44d7f585d94e4677957bb61defa74e7b92377.zip && sudo chmod 664 /var/www/dl.digital-guard.org/55e32574fbee8b1088979c56dfb44d7f585d94e4677957bb61defa74e7b92377.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201201_p2_block CASCADE"
cd /tmp/sandbox/_pk48400000201_001; 7z  x -y /var/www/dl.digital-guard.org/55e32574fbee8b1088979c56dfb44d7f585d94e4677957bb61defa74e7b92377.zip "*m*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201201_p2_block'
cd $(sandbox); shp2pgsql -p -D   -s 6362 $$(find $(sandbox) -path "*m*.shp" | head -n 1) pk48400000201201_p2_block | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*m*.shp" | parallel -j8 "shp2pgsql -a -D   -s 6362 '{}' pk48400000201201_p2_block | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*m*.shp" | head -n 1)','block_full','pk48400000201201_p2_block','48400000201201','55e32574fbee8b1088979c56dfb44d7f585d94e4677957bb61defa74e7b92377.zip',array['gid', 'geografico', 'cvegeo', 'codigo', 'fechaact', 'instituc', 'geometria', 'geom'],5,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201201_p2_block CASCADE"
rm -f /tmp/sandbox/_pk48400000201_001/*m.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('block','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block -type f -exec chmod 664 {} \;





# layer geoaddress:
rm -rf /tmp/sandbox/_pk48400000201_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/d0b51cdba97f9c04eb7e8e4c17695770d66730b895308543781729851e0bd67e.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/d0b51cdba97f9c04eb7e8e4c17695770d66730b895308543781729851e0bd67e.zip && sudo chmod 664 /var/www/dl.digital-guard.org/d0b51cdba97f9c04eb7e8e4c17695770d66730b895308543781729851e0bd67e.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201101_p1_geoaddress CASCADE"
cd /tmp/sandbox/_pk48400000201_001; 7z  x -y /var/www/dl.digital-guard.org/d0b51cdba97f9c04eb7e8e4c17695770d66730b895308543781729851e0bd67e.zip "*ne*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201101_p1_geoaddress'
cd $(sandbox); shp2pgsql -p -D   -s 6362 $$(find $(sandbox) -path "*ne*.shp" | head -n 1) pk48400000201101_p1_geoaddress | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*ne*.shp" | parallel -j8 "shp2pgsql -a -D   -s 6362 '{}' pk48400000201101_p1_geoaddress | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*ne*.shp" | head -n 1)','geoaddress_full','pk48400000201101_p1_geoaddress','48400000201101','d0b51cdba97f9c04eb7e8e4c17695770d66730b895308543781729851e0bd67e.zip',array['gid', 'geografico', 'cveft', 'cvegeo', 'tipovial', 'nomvial', 'cveref1', 'tipovr1', 'nomref1', 'cveref2', 'tipovr2', 'nomref2', 'cveasen', 'tipoasen', 'nomasen', 'cp', 'codigo', 'fechaact', 'instituc', 'geometria', 'geom'],1,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201101_p1_geoaddress CASCADE"
rm -f /tmp/sandbox/_pk48400000201_001/*ne.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('geoaddress','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress -type f -exec chmod 664 {} \;

# layer nsvia:
rm -rf /tmp/sandbox/_pk48400000201_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/922fd7121333ca1c08cedf94feaac8ffc08049cd8a51ea05a61dd6581e1554f9.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/922fd7121333ca1c08cedf94feaac8ffc08049cd8a51ea05a61dd6581e1554f9.zip && sudo chmod 664 /var/www/dl.digital-guard.org/922fd7121333ca1c08cedf94feaac8ffc08049cd8a51ea05a61dd6581e1554f9.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201301_p3_nsvia CASCADE"
cd /tmp/sandbox/_pk48400000201_001; 7z  x -y /var/www/dl.digital-guard.org/922fd7121333ca1c08cedf94feaac8ffc08049cd8a51ea05a61dd6581e1554f9.zip "*as*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201301_p3_nsvia'
cd $(sandbox); shp2pgsql -p -D   -s 6362 $$(find $(sandbox) -path "*as*.shp" | head -n 1) pk48400000201301_p3_nsvia | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*as*.shp" | parallel -j8 "shp2pgsql -a -D   -s 6362 '{}' pk48400000201301_p3_nsvia | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*as*.shp" | head -n 1)','nsvia_full','pk48400000201301_p3_nsvia','48400000201301','922fd7121333ca1c08cedf94feaac8ffc08049cd8a51ea05a61dd6581e1554f9.zip',array['gid', 'cveasen AS ref', 'nomasen AS nsvia', 'codigo', 'fechaact', 'instituc', 'geometria', 'tipoasen', 'geom'],5,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201301_p3_nsvia CASCADE"
rm -f /tmp/sandbox/_pk48400000201_001/*as.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('nsvia','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia -type f -exec chmod 664 {} \;


# layer via:
rm -rf /tmp/sandbox/_pk48400000201_001 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_001
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org http://dl.digital-guard.org/09a6131f004f8561b1731e37d805ffd73a6cd0d78c195f15dd9b0827362a6ce5.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/09a6131f004f8561b1731e37d805ffd73a6cd0d78c195f15dd9b0827362a6ce5.zip && sudo chmod 664 /var/www/dl.digital-guard.org/09a6131f004f8561b1731e37d805ffd73a6cd0d78c195f15dd9b0827362a6ce5.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201401_p4_via CASCADE"
cd /tmp/sandbox/_pk48400000201_001; 7z  x -y /var/www/dl.digital-guard.org/09a6131f004f8561b1731e37d805ffd73a6cd0d78c195f15dd9b0827362a6ce5.zip "*v*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201401_p4_via'
cd $(sandbox); shp2pgsql -p -D   -s 6362 $$(find $(sandbox) -path "*v*.shp" | head -n 1) pk48400000201401_p4_via | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*v*.shp" | parallel -j8 "shp2pgsql -a -D   -s 6362 '{}' pk48400000201401_p4_via | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*v*.shp" | head -n 1)','via_full','pk48400000201401_p4_via','48400000201401','09a6131f004f8561b1731e37d805ffd73a6cd0d78c195f15dd9b0827362a6ce5.zip',array['gid', 'geografico', 'tipovial', 'nomvial', 'sentido', 'destino', 'codigo', 'fechaact', 'instituc', 'geometria', 'geom'],5,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201401_p4_via CASCADE"
rm -f /tmp/sandbox/_pk48400000201_001/*v.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via/*.geojson
psql postgres://postgres@localhost/ingest1 -c "SELECT ingest.publicating_geojsons('via','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via -type f -exec chmod 664 {} \;




