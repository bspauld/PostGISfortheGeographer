/*

	Script: CalculateBufferPostGIS.sql

	Purpose: Using ST_Buffer, calculate a simple buffer around each point. 
		buff field will be a polygon feature. ST_Buffer takes two values, the input geomerty field,
		and a float for the buffer radius.  The buffer radius is in the units of the dataset.
		In this example, the units, decimal degrees, is used.
    
    Script uses data from https://github.com/bspauld/PostGISfortheGeographer example data

		For more detailed information about the buffer feature see - http://postgis.net/docs/ST_Buffer.html

	Author: Ben Spaulding

*/

select 
  id, 
  nameascii, 
  sov0name, 
  ST_Buffer(geom, 0.5) as buff 
from public."Populated_Places"
where sov0name like 'United States'
