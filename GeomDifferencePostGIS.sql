/*

	Script: GeomDifferencePostGIS.sql

	Purpose: Script finds the geometric difference between the two selected geometries. 
           In this example an inner join is used to bring together to different tables with geometries
           and the ST_difference is then performed. In the ST_difference parameters, 
           the second geometry is subtracted from the first.  

	Author: Ben Spaulding

	For ST_Difference - http://postgis.net/docs/ST_Difference.html

*/

select 	
	s.name_1 as StateName,
	w.admin,
	ST_difference(w.geom,s.geom) as difGeom
from public."States_Provinces" s inner join public."World_Countries" w
	on s.name_0 = w.admin
where s.name_0 = 'United States of America' and s.name_1 = 'Massachusetts'
