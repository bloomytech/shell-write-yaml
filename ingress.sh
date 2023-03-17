#!/bin/bash
while read -r values;
do
echo "Line is : $values"
user=$(echo $values |awk -F ',' '{print $1}')
workspace=$(echo $values | awk -F ',' '{print $2}')
groupname=$(echo $values | awk -F ',' '{print $3}')
echo -e "apiVersion: v1\n\
kind: Pod\n\
metadata:\n\
  name: $user\n\
spec:\n\
  containers:\n\
  - name: $workspace\n\
    image: $groupname\n\
    ports:\n\
    - containerPort: 80" >> $user.yaml
done < values.txt
