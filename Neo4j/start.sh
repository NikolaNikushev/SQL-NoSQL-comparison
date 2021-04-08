export databasePath="/Users/nikolanikushev/Library/Application Support/com.Neo4j.Relate/Data/dbmss/dbms-b2e39e53-ae33-408f-815f-692ee6c15262"

times=100

for entry in "./cypher"/*.cypher
do
  echo "Starting $entry"
  entryName=$(basename -s .cypher $entry)
  outputName="../results/neo4j_v2/$entryName.result"
  if test -f $outputName; then
    echo "$entryName.result exists. Skipping"
  else
    for i in $(seq $times)
    do
        "$databasePath/bin/cypher-shell" -u neo4j -p bpi -d bpi2020tailored -f ./clearCache.cypher --format plain | grep "Query caches successfully cleared of 2 queries."
        "$databasePath/bin/cypher-shell" -u neo4j -p bpi -d bpi2020tailored -f $entry --format verbose | grep "consumed" >> $outputName
        echo "$entry $i"
    done
  fi
done






