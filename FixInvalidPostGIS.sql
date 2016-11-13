/*

	Script: FixInvalidPostGIS.sql

	Purpose: Using ST_MakeValid, try to repair any bad geometries. Script also reports
		 whether the feature is valid to begin with (ST_IsValidDetail).

	Author: Ben Spaulding

	ST_MakeValid - http://postgis.net/docs/ST_MakeValid.html
	ST_IsValidDetail - http://postgis.net/docs/ST_IsValidDetail.html


*/


select  id,
	s.name_0,
	s.name_1,
	geom, 
	ST_IsValidDetail(geom) as IsValidDetail,
	ST_MakeValid(geom) as FixGeomResult
from public."States_Provinces" s
where s.name_0 = 'United States of America'
order by s.name_1;
