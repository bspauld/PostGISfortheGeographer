/*

	Script: CalculateExtentPostGIS.sql

	Purpose: Return the bounding box of the selected feature using ST_Extent.
		 Script also gives examples of using the ST_asText, ST_YMIN, 
		 ST_XMIN, ST_YMAX, and ST_XMAX

	For ST_Extent - http://postgis.net/docs/ST_Extent.html
	For ST_asText - http://www.postgis.org/docs/ST_AsText.html
	For ST_Xmin - http://www.postgis.org/docs/ST_XMin.html
	For ST_Ymin - http://www.postgis.org/docs/ST_YMin.html
	For ST_Xmax - http://www.postgis.org/docs/ST_XMax.html
	For ST_Ymax - http://www.postgis.org/docs/ST_YMax.html

	Author: Ben Spaulding

*/

select 	
	s.name_1 as StateName,
	ST_asText(ST_Extent(geom)) BoundingBoxText,
	ST_Extent(geom) as BoundingBoxGeom, 
	ST_XMIN(s.geom) as MinLon, 
	ST_YMIN(s.geom) as MinLat, 
	ST_XMAX(s.geom) as MaxLon, 
	ST_YMAX(s.geom) as MaxLat
from public."States_Provinces" s  
where s.name_0 = 'United States of America' and s.name_1 = 'Massachusetts'
group by s.name_0, s.geom,s.name_1;
