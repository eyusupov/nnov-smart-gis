CREATE OR REPLACE FUNCTION public.mo_boundary(z integer, x integer, y integer, query_params json) RETURNS BYTEA AS $$
DECLARE
  bounds GEOMETRY(POLYGON, 3857) := TileBBox(z, x, y, 3857);
  mvt BYTEA;
BEGIN
  SELECT INTO mvt ST_AsMVT(tile, 'public.mo_boundary', 4096, 'geom') FROM (
    SELECT
      ST_AsMVTGeom(wkb_geometry, bounds, 4096, 64, true) AS geom
    FROM public.geo_mo_boundary WHERE type_id = 4
  ) as tile WHERE geom IS NOT NULL;

  RETURN mvt;
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;
