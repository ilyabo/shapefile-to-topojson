## shapefile-to-topojson

This utility converts shapefiles to TopoJSON attempting to automatically find a reasonable simplification threshold parameter value by looking at the bounding boxes of the shapes in the shapefile.

The motivation is to be able to produce shapes of about the same visual detail level when rendered on the screen no matter what the actual (geographic) sizes of the shapes are and what the input shapefiles detail level is.

The utility also ensures that all the shapes in the output TopoJSON have their ids and names set.

The utility requires [Node.js](https://nodejs.org) to run.

First, install dependencies:

    npm install

### Usage

    shapefile-to-topojson <shapefile> <id property> <name property> [<simplification accuracy>]


### Examples

To download test shapefiles:

    ./get-test-data

Convert US states to TopoJSON:

    ./shapefile-to-topojson build/tl_2018_us_state.shp STUSPS NAME 1/10000
    
Convert US counties to TopoJSON:

    ./shapefile-to-topojson build/tl_2018_us_county.shp GEOID NAMELSAD
 

The default value for the simplification accuracy parameter is 1/5000.
That means that 1/5000th of the average shape area will be used as the [simplification threshold](https://github.com/topojson/topojson-simplify#toposimplify_spherical_area).

All the shapes in the DBF must have a value for the id property, otherwise the conversion will fail.
