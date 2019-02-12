#!/usr/bin/env bash

# Usage example: shapefile-to-topojson my.shp my.topo.json GEOID NAME

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#
SIMPLIFICATION_PRECISION=3000

INPUT_FILE=${1:?Input shapefile not specified}
OUTPUT_FILE=${2:?Output file name not specified}
ID_PROPERTY=${3:?ID property not specified}
NAME_PROPERTY=${4:?Name property not specified}

#
# http://active-namenode.service.tef.dns.teralytics.net:50070/webhdfs/v1/projects/insights/shapes/plz5_used_in_2019.shp?op=OPEN

AVG_SHAPE_AREA=`"$DIR/average-shape-area" $INPUT_FILE`
SIMPLIFICATION_THRESHOLD=$(node -pe "$AVG_SHAPE_AREA/$SIMPLIFICATION_PRECISION")

geo2topo \
  zones=<("$DIR/shapefile-to-geojson" $INPUT_FILE) \
  | toposimplify -f -s $SIMPLIFICATION_THRESHOLD \
  | topoquantize 1e5 \
  | "$DIR/pick-properties" $ID_PROPERTY $NAME_PROPERTY \
> $OUTPUT_FILE




