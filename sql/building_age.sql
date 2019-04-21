CREATE OR REPLACE FUNCTION public.building_age(z integer, x integer, y integer, query_params json) RETURNS BYTEA AS $$
DECLARE
  bounds GEOMETRY(POLYGON, 3857) := TileBBox(z, x, y, 3857);
  mvt BYTEA;
  year INT := (query_params->>'year')::int;
BEGIN
  SELECT INTO mvt ST_AsMVT(tile, 'public.building_age', 4096, 'geom') FROM (
    SELECT
      ST_AsMVTGeom(g.wkb_geometry, bounds, 4096, 64, true) AS geom, (year - build_year::int) as age
    FROM public.v_portal2_exist_buildings_g as g, public.v_portal2_exist_buildings_a as a
    WHERE g.wkb_geometry && bounds AND g.ogc_fid = a.ogc_fid AND build_year::int > 0 and build_year::int <= year
  ) as tile WHERE geom IS NOT NULL;

  RETURN mvt;
END
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;
