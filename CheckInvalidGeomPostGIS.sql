/*

	Script: CheckInvalidGeomPostGIS.sql

	Purpose: Performs checks on the spatial data to see if the object is well formed using four different
		 PostGIS commands. Some of the polygons in the sample dataset will not be well formed 
		 and will return False in the isvalid_check column,and description of what is wrong in the
		 IsValidDetail column.

	Author: Ben Spaulding

	ST_IsValid - http://postgis.net/docs/ST_IsValid.html
	ST_IsValidReason - http://postgis.net/docs/ST_IsValidReason.html
	ST_IsValidDetail - http://postgis.net/docs/ST_IsValidDetail.html
	ST_Summary - http://postgis.net/docs/ST_Summary.html
  
*/

select  id,
	s.name_0,
	s.name_1,
	geom, 
	ST_IsValid(geom)  as IsValid_Check,
	ST_IsValidReason(geom) as IsValid_CheckReason,
	ST_IsValidDetail(geom) as IsValidDetail,
	ST_Summary (geom) as Geom_Summary
from public."States_Provinces" s
where s.name_0 = 'United States of America'
order by s.name_1;
