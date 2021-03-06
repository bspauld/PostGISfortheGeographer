
<h2>PostGIS for the Geographer - Loading Data into PostGIS with QGIS</h2>

Loading shapefile into PostGIS with QGIS is a fairly easy process. The following steps will outline this process.

1. In QGIS, connect to your PostGIS ready database. In the Browser Panel, right click on the PostGIS menu item and select New Connection.
2. In the Create a New PostGIS connection window, enter information for the name of the connection, the host (I used localhost), 
the port, and the database name - PostGISforGeographer.  Click on Test Connection to test the set-up. You will be asked to enter your credentials,with the database username and password.
![alt tag](https://github.com/bspauld/PostGISfortheGeographer/blob/master/Images/CreateNewConnection.JPG)
3. Once the connection has been established, you will use DB Manager plugin in QGIS to load the shapefiles into PostGIS.  
If you need to install the plugin, simply use the functionality available in the QGIS Plugin Manager.  For more detailed instructions check out the <a href="http://docs.qgis.org/2.14/en/docs/user_manual/plugins/plugins.html#the-plugins-dialog">QGIS documentation</a>
4. Once the DB Manager plugin is ready, open the tool from the menu and connect to the necessary database from the PostGIS menu option. 
You will need to enter your user name and password for the database.
5. In the DB Manager, click on the Import Layer button.  In the Import Layer dialog the user will need to select the desired shapefile
from the dropdown (or by browsing to the dataset by clicking on the radial button to the right of the dialog).  When the shapefile is 
selected, you will need to set the Output table schema and table name.  You will then need to set the Options, including checking off the
Primary Key, Geometry Column, and Create spatial index checkboxes.  You should also set your Source SRID.  For the data in this 
exercise everything is WGS84 = SRID 4326. Once all the items are set, click OK to import the shapefile.  Repeat as necessary.
![alt tag](https://github.com/bspauld/PostGISfortheGeographer/blob/master/Images/DB_Manager.JPG)
6. Once the dataset is loaded, it can be viewed in QGIS or accessed in PostGIS/PostgreSQL.  You can preview the data in DB Manager by 
selecting the layer in the database, and then clicking on the Preview tab. The layer will become visiable in the view.  
![alt tag](https://github.com/bspauld/PostGISfortheGeographer/blob/master/Images/DBManager_Preview.JPG)
