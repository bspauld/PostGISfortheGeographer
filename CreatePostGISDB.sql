/*
  Script: CreatePostGISDB.sql
  
  Purpose: Create an empty Postgresql database that is spatially enabled when the
           create extension command is called for postgis and postgis_topology

          For PostGIS documentation check out their docs - http://postgis.net/install/

  Author: Ben Spaulding
  
*/


--Create empty database
CREATE DATABASE "PostGISforGeographer"
  WITH ENCODING='UTF8'
       CONNECTION LIMIT=-1;

 -- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;
-- Enable Topology
CREATE EXTENSION postgis_topology;
