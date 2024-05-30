#!/bin/bash


# layer block:
rm -rf /tmp/sandbox/_pk48400000201_002 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_002
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org https://dl.digital-guard.org/10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip && sudo chmod 664 /var/www/dl.digital-guard.org/10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201202_p2_block CASCADE"
cd /tmp/sandbox/_pk48400000201_002; 7z  x -y /var/www/dl.digital-guard.org/10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip "*m*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201202_p2_block'
cd $(sandbox); shp2pgsql -p -D -W Windows-1252  -s 6362 $$(find $(sandbox) -path "*m*.shp" | head -n 1) pk48400000201202_p2_block | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*m*.shp" | parallel -j8 "shp2pgsql -a -D -W Windows-1252  -s 6362 '{}' pk48400000201202_p2_block | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*m*.shp" | head -n 1)','block_full','pk48400000201202_p2_block','48400000201202','10a9a43d9081e00bacca240b93847819671abde1f00807035df03206261fa572.zip',array['gid', 'geografico', 'cvegeo AS ref', 'codigo', 'fechaact', 'instituc', 'geometria', 'geom'],5,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201202_p2_block CASCADE"
rm -f /tmp/sandbox/_pk48400000201_002/*m.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block/*.geojson
psql postgres://postgres@localhost/ingest1 -c "CALL ingest.ppublicating_geojsons('block','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/block -type f -exec chmod 664 {} \;





# layer geoaddress:
rm -rf /tmp/sandbox/_pk48400000201_002 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_002
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org https://dl.digital-guard.org/cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip && sudo chmod 664 /var/www/dl.digital-guard.org/cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201102_p1_geoaddress CASCADE"
cd /tmp/sandbox/_pk48400000201_002; 7z  x -y /var/www/dl.digital-guard.org/cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip "*direccion/*ne*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201102_p1_geoaddress'
cd $(sandbox); shp2pgsql -p -D -W Windows-1252  -s 6362 $$(find $(sandbox) -path "*direccion/*ne*.shp" | head -n 1) pk48400000201102_p1_geoaddress | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*direccion/*ne*.shp" | parallel -j8 "shp2pgsql -a -D -W Windows-1252  -s 6362 '{}' pk48400000201102_p1_geoaddress | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "CREATE VIEW vw1_pk48400000201102_p1_geoaddress AS SELECT gid,numext AS hnum,idunico,cvegeo AS ref,idnexft,cveft,tipovial || ' ' || nomvial AS via,cveref1,tipovr1,nomref1,cveref2,tipovr2,nomref2,cveasen,tipoasen,nomasen AS nsvia,cp,codigo,fechaact,observ,nomserv,tipoarea,geografico,acceso,instituc,geometria,tipodom,tiposerv,geom FROM $(tabname)" | psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*direccion/*ne*.shp" | head -n 1)','geoaddress_full','vw1_pk48400000201102_p1_geoaddress','48400000201102','cf292acbe8d4b1b562a9af3172b2e8571de0f24be7fd814f10fdc50323d9494f.zip',array[]::text[],1,1,true)" | psql $(pg_uri_db) -c "DROP VIEW vw1_pk48400000201102_p1_geoaddress"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201102_p1_geoaddress CASCADE"
rm -f /tmp/sandbox/_pk48400000201_002/*direccion/*ne.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress/*.geojson
psql postgres://postgres@localhost/ingest1 -c "CALL ingest.ppublicating_geojsons('geoaddress','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/geoaddress -type f -exec chmod 664 {} \;

# layer nsvia:
rm -rf /tmp/sandbox/_pk48400000201_002 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_002
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org https://dl.digital-guard.org/f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip && sudo chmod 664 /var/www/dl.digital-guard.org/f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201302_p3_nsvia CASCADE"
cd /tmp/sandbox/_pk48400000201_002; 7z  x -y /var/www/dl.digital-guard.org/f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip "*as*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201302_p3_nsvia'
cd $(sandbox); shp2pgsql -p -D -W Windows-1252  -s 6362 $$(find $(sandbox) -path "*as*.shp" | head -n 1) pk48400000201302_p3_nsvia | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*as*.shp" | parallel -j8 "shp2pgsql -a -D -W Windows-1252  -s 6362 '{}' pk48400000201302_p3_nsvia | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*as*.shp" | head -n 1)','nsvia_full','pk48400000201302_p3_nsvia','48400000201302','f45c916e53cbd61e789a80651ff0986ad20ff5bea0f80a957d80873183e2a464.zip',array['gid', 'cveasen AS ref', 'nomasen AS nsvia', 'codigo', 'fechaact', 'instituc', 'geometria', 'tipoasen', 'geom'],5,1,true)"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201302_p3_nsvia CASCADE"
rm -f /tmp/sandbox/_pk48400000201_002/*as.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia/*.geojson
psql postgres://postgres@localhost/ingest1 -c "CALL ingest.ppublicating_geojsons('nsvia','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/nsvia -type f -exec chmod 664 {} \;


# layer via:
rm -rf /tmp/sandbox/_pk48400000201_002 || true
mkdir -m 777 -p /tmp/sandbox
mkdir -m 777 -p /tmp/sandbox/_pk48400000201_002
mkdir -p /tmp/pg_io
wget -P /var/www/dl.digital-guard.org https://dl.digital-guard.org/a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip
sudo chown postgres:www-data /var/www/dl.digital-guard.org/a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip && sudo chmod 664 /var/www/dl.digital-guard.org/a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201402_p4_via CASCADE"
cd /tmp/sandbox/_pk48400000201_002; 7z  x -y /var/www/dl.digital-guard.org/a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip "*v*" ; chmod -R a+rwx . > /dev/null
psql postgres://postgres@localhost/ingest1 -c "SELECT srid, proj4text FROM spatial_ref_sys where srid=6362"
@echo Executando shp2pgsql with GNU paralell ...
psql $(pg_uri_db) -c 'DROP TABLE IF EXISTS pk48400000201402_p4_via'
cd $(sandbox); shp2pgsql -p -D -W Windows-1252  -s 6362 $$(find $(sandbox) -path "*v*.shp" | head -n 1) pk48400000201402_p4_via | psql -q $(pg_uri_db)
cd $(sandbox); find $(sandbox) -path "*v*.shp" | parallel -j8 "shp2pgsql -a -D -W Windows-1252  -s 6362 '{}' pk48400000201402_p4_via | psql -q $(pg_uri_db)" \;
cd $(sandbox); psql $(pg_uri_db) -c "CREATE VIEW vw4_pk48400000201402_p4_via AS SELECT gid,geografico,tipovial || ' ' || nomvial AS via,sentido,destino,codigo,fechaact,instituc,geometria,geom FROM $(tabname)" | psql $(pg_uri_db) -c "SELECT ingest.any_load('shp2sqlparalell','$$(find $(sandbox) -path "*v*.shp" | head -n 1)','via_full','vw4_pk48400000201402_p4_via','48400000201402','a4a1a9253a1cd1633fd9680a73601d450919abcd9937a0f52f436856c0ff15e7.zip',array[]::text[],5,1,true)" | psql $(pg_uri_db) -c "DROP VIEW vw4_pk48400000201402_p4_via"
@echo "Confira os resultados nas tabelas ingest.donated_packcomponent e ingest.feature_asis".
psql postgres://postgres@localhost/ingest1 -c "DROP  TABLE IF EXISTS pk48400000201402_p4_via CASCADE"
rm -f /tmp/sandbox/_pk48400000201_002/*v.* || true
mkdir -m777 -p /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via
rm -rf /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via/*.geojson
psql postgres://postgres@localhost/ingest1 -c "CALL ingest.ppublicating_geojsons('via','MX','/var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via','1',9,3);"
sudo chown -R postgres:www-data /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via -type d -exec chmod 774 {} \;
sudo find /var/gits/_dg/preservCutGeo-MX2021/data/_pk0002.01/via -type f -exec chmod 664 {} \;







