/*

	Script: CalculateCentroidPostGIS.sql

	Purpose: Using ST_Centroid, calculate the centroid of a selected polygon from a dataset.
		 Script also returns the X - Longitude and Y - Longitude coordinate 	
	
		 Script uses sample data from - https://github.com/bspauld/PostGISfortheGeographer
	
		 For more detailed information about ST_Centroid see - http://postgis.net/docs/ST_Centroid.html

	Author: Ben Spaulding

*/

select 	id, 
	name_0, 
	name_1, 
	ST_Centroid(geom) as PolyCent,
	ST_X(ST_Centroid(geom)) as Longitude,
	ST_Y(ST_Centroid(geom)) as Latitude
from public."States_Provinces"
where name_0 = 'United States of America' and name_1 = 'Massachusetts';

