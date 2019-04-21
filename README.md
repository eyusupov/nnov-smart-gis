OSM:
  https://overpass-api.de/api/map?bbox=43.6867905,56.2179687,44.138259,56.41466129
  https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/raster/NE1_HR_LC_SR_W_DR.zip
  http://naciscdn.org/naturalearth/packages/natural_earth_vector.sqlite.zip

Bounding box:
 56.409646, 43.732935 
 56.173571, 44.148926 

 https://github.com/openmaptiles/import-natural-earth/blob/master/import-natural-earth.sh
 https://stackoverflow.com/questions/19701271/importing-data-from-osm-to-postgis

 PGCLIENTENCODING=LATIN1 ogr2ogr \
    -progress \
    -f Postgresql \
    -s_srs EPSG:4326 \
    -t_srs EPSG:3857 \
    -clipsrc 56.409646 43.732935 56.173571 44.148926 \
    PG:"$PGCONN" \
    -lco GEOMETRY_NAME=geometry \
    -lco OVERWRITE=YES \
    -lco DIM=2 \
    -nlt GEOMETRY \
    -overwrite \
    "$NATURAL_EARTH_DB"

Tile styles:
  https://github.com/openmaptiles/osm-bright-gl-style

shp2pgsql
PostGIS

- Static tile serving
- Dynamic tile generation

Openlayers
  <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
  <link rel="stylesheet" href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css">

OSM data
NaturalEarth
PostGIS -> MBTiles / Layer
tileserver-gl


QGis

https://www.youtube.com/watch?v=UydhTefty8c
https://www.youtube.com/watch?v=52yx0eWNetc

TODO:
1. Setup postgis:
   - persistence

3. Download data:
 - naturalearth
 - openstreetmaps

2. Import geodata:
  Data needs to be versioned
3. Visualize map
4. Import data
5. Visualize data

