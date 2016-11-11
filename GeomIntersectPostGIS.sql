/*

	Script: GeomIntersectPostGIS.sql

	Purpose: Script that uses an inner join to find all line segements (roads) that intersect
		 selected polygon feature (state). 

		 Script uses data from https://github.com/bspauld/PostGISfortheGeographer

		 For more information about ST_Intersects see - http://postgis.net/docs/ST_Intersects.html

	Author: Ben Spaulding


*/


select 	r.id, 
	s.name_0, 
	s.name_1, 
	r.geom as RoadGeom 
from public."States_Provinces" s inner join public."Roads" r on ST_Intersects(s.geom, r.geom)
where name_0 = 'United States of America' and name_1 = 'Massachusetts';
