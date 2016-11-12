/*

	Script: GeomContainsPostGIS.sql

	Purpose: Example of the ST_Contains PostGIS command.  Query finds all the centroids of selected regions
		 that are contained by a given polygon (UK country boundary).

	For ST_Contains - http://postgis.net/docs/ST_Contains.html
	For ST_Centroid - http://postgis.net/docs/ST_Centroid.html

	Author: Ben Spaulding


*/

select s.id,
	s.name_0,
	s.name_1,
	w.admin,
	s.geom as RegionGeom,
	w.geom as CountryGeom,
	ST_Centroid(s.geom) as RegionCentroid
from public."States_Provinces" s inner join public."World_Countries" w 
on ST_Contains(w.geom, ST_Centroid(s.geom))
where w.admin = 'United Kingdom';
