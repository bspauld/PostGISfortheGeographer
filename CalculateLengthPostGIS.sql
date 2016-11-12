/*

	Script: CalculateLengthPostGIS.sql

	Purpose: Example of how to use the ST_Length command, measure each segment in a table 
		 meeting the requirement in the where statement.  Script also gives an example
		 of ST_Transform, which will transform the WGS84 4326 data into Mass State Plane - 26986

	ST_Length - http://postgis.net/docs/ST_Length.html
	ST_Transform - http://postgis.org/docs/ST_Transform.html
	
*/

select id,
	name,
	feature,
	state_fips, 
	geom, 
	ST_Length(ST_Transform(geom,26986))  as RoadLength 
	from public."Roads"
where state_fips = '25';
