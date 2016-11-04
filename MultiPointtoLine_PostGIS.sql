/*
	Script:  MultiPointtoLine_PostGIS.sql

	Purpose: Fast script to convert a series of points into line objects using PostGIS. Script uses a self join on the lineID field,
		where only the next point in line is joined to the current point.

		Input dataset will need ID values for the line, and sequential point IDs.  

	Code built using PostgreSQL and PostGIS

	Author - Benjamin Spaulding @gisdoctor

	Created - October 2016

*/

select 	
	--Set FROM point
	f.lineID,
	f.pointID as from_pointID, 
	f.lat as from_lat, 
	f.lon as from_lon,
	--Set TO point
	t.pointID as to_pointID,
	t.lat as to_lat,
	t.lon as to_lon,
	--Build line object (ST_MakeLine) between the two points (ST_MakePoint) with spatial statements.  
	--SRID is set as well, so that the output can be easily used in a GIS program
	ST_SetSRID(ST_MakeLine(ST_MakePoint(f.lon,f.lat),ST_MakePoint(t.lon,t.lat)),4326) as linegeom
from public.inputTable f join public.inputTable t on f.lineID = t.lineID 
-- in the where statement only select those records where the from point is the next point from the to point with the -1 
where f.from_pointID = t.to_pointID -1 
--order by the pointID sequence
order by f.idvallist, t.idvalList;
