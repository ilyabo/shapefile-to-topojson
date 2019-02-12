## shapefile-to-topojson

This utility converts shapefiles to TopoJSON for the OD dashboard.
It attemtps to find the best simplification threshold parameter value by looking
at the bounding boxes of the shapes in the shapefile.

First, install dependencies:

    npm install

To run:

    npm start <INPUT.shp> <OUTPUT.topo.json> <ID_PROPERTY> <NAME_PROPERTY>

All the shapes in the shapefile must have a unique value for the <ID_PROPERTY>.
