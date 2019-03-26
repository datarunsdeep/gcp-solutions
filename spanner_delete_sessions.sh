#!/bin/bash

if [$1 == ""]; then
    echo "Please enter your Spanner database id as first argument"
fi

if [$2 == ""]; then
    echo "Please enter your instance id as second argument"
fi

sessions=$(gcloud spanner databases sessions list --database=$1 --instance=$2 | grep -w name | cut -d / -f 8)

for id in ${sessions[@]}
do 
    gcloud spanner databases sessions delete "$id" --database=$1 --instance=$2
done 
