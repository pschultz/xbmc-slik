#!/bin/bash

cd $(dirname $0)

function codes() {
cat<<EOS
de ger
ru rus
jp jpn
us eng west
EOS
}
border=4
opacity=75%
codes | while read short long gravity; do
    [ -z "$gravity" ] && gravity=center
    wget http://flagpedia.net/data/flags/small/$short.png -O $long.png
    mogrify -resize '120x72!' -gravity $gravity  -crop 16x72+0+0 +repage -matte -channel a -evaluate set $opacity -bordercolor black -border ${border}x${border} $long.png
done 
