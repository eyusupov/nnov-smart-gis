CREATE OR REPLACE FUNCTION public.districts(z integer, x integer, y integer, query_params json) RETURNS BYTEA AS $$
DECLARE
  bounds GEOMETRY(POLYGON, 3857) := TileBBox(z, x, y, 3857);
  mvt BYTEA;
BEGIN
  SELECT INTO mvt ST_AsMVT(tile, 'public.districts', 4096, 'geom') FROM (
    SELECT
      ST_AsMVTGeom(wkb_geometry, bounds, 4096, 64, true) AS geom
    FROM public.geo_territorial_name WHERE territorial_type_id = 2
  ) as tile WHERE geom IS NOT NULL;

  RETURN mvt;
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;
