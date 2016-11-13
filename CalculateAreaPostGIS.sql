/*

	Script: CalculateAreaPostGIS.sql

	Purpose: Example of using ST_Area.  ST_Area calculates the area in the projection of the dataset,
		 so in this example, the ST_Transform is used to transform the projection of the selected
		 record to Mass State Plane.  

	ST_Area - http://postgis.net/docs/ST_Area.html
	ST_Transform - http://postgis.org/docs/ST_Transform.html 	 

	Author: Ben Spaulding

*/


select  id,
	s.name_0,
	s.name_1,
	geom, 
	ST_Area(ST_Transform(geom,26986))  as PolyArea_SquareFeet
from public."States_Provinces" s
where s.name_0 = 'United States of America' and s.name_1 = 'Massachusetts';
