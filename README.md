## shapefile-to-topojson

This utility converts shapefiles to TopoJSON.
It attemtps to automatically find the best simplification threshold parameter value by looking
at the bounding boxes of the shapes in the shapefile.
It also ensures that all the shapes in the output TopoJSON have ids and names set.

First, install dependencies:

    npm install

To run:

    ./shapefile-to-topojson <path to shapefile> <path to DBF file> <id property in DBF> <name property in DBF> [<simplification accuracy>]


Examples:

    ./get-test-data
    ./shapefile-to-topojson build/tl_2018_us_state.shp build/tl_2018_us_state.dbf STUSPS NAME 1/10000

The default value for the simplification accuracy parameter is 1/5000.
That means that 1/5000th of the average shape area will be used as the simplification threshold.

All the shapes in the DBF must have a unique value for the <ID_PROPERTY>.
