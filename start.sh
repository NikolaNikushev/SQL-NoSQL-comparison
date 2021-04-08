rm results/*.result
times=100

for entry in "./sql"/*
do
  entryName=$(basename -s .sql $entry)

  if test -f "../results/sql_v2/$entryName.result"; then
    echo "$entryName.result exists. Skipping"
  else
    echo "Starting $entry"
    for i in $(seq $times)
    do
        psql -U postgres postgres < $entry | grep "Time:" >> ./results/sql/$entryName.result
        echo "$entry $i"
    done
  fi
done






