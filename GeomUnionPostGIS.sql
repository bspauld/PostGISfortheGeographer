/*

	Script: GeomUnionPostGIS.sql

	Purpose: Two example scripts.  One for ST_Union and one for ST_Collect.  The two
		 essentially perform the same action.  The queries will select a series of
		 geometries from the table and reutn a single geometry that meets the requirements
		 of the where and group by statement. In this example, the two queries
		 return the single geometry for the US.

	ST_Collect is much, much faster than ST_Union

	For ST_Union documentation - http://postgis.net/docs/ST_Union.html
	For ST_Collect documentation - http://postgis.net/docs/ST_Collect.html

	Author: Ben Spaulding


*/

--ST_Union
select 	
	s.name_0, 
	ST_Union(s.geom)	
from public."States_Provinces" s  
where s.name_0 = 'United States of America'
group by s.name_0;

--ST_Collect
select 	
	s.name_0, 
	ST_Collect(s.geom)	
from public."States_Provinces" s  
where s.name_0 = 'United States of America'
group by s.name_0;
