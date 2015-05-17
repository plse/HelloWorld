#!/bin/bash
#
# Simple script to increment version in demo

set -x 

DATE=$(date)

# Update the version of the file
UPDATE=$(echo "<h3>Version Update ${DATE}</h3>")
sed -e "/\<h1>/a \ ${UPDATE}" src/main/webapp/index.jsp > update.jsp
cat update.jsp > src/main/webapp/index.jsp

# House cleaning
rm update.jsp

# Commit the chnmage to our local git repo
git commit -a -m "Version Update ${DATE}"

# Push the commit and trigger a dev build
git push origin master
