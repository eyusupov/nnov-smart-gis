CREATE OR REPLACE FUNCTION public.exist_buildings(z integer, x integer, y integer, query_params json) RETURNS BYTEA AS $$
DECLARE
  bounds GEOMETRY(POLYGON, 3857) := TileBBox(z, x, y, 3857);
  mvt BYTEA;
BEGIN
  SELECT INTO mvt ST_AsMVT(tile, 'public.exist_buildings', 4096, 'geom') FROM (
    SELECT
      ST_AsMVTGeom(g.wkb_geometry, bounds, 4096, 64, true) AS geom, a.*
    FROM public.v_portal2_exist_buildings_g as g, public.v_portal2_exist_buildings_a as a
    WHERE g.wkb_geometry && bounds AND g.ogc_fid = a.ogc_fid
  ) as tile WHERE geom IS NOT NULL;

  RETURN mvt;
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;
