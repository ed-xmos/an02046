#!/usr/bin/env bash
while getopts a:n:u:t: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG}; name_upper=$(echo "$name" | tr '[:lower:]' '[:upper:]');;
        u) urlname=${OPTARG};;
        t) title=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Title: $title";

echo "Renaming app note..."

original_author="ed-xmos"
original_name="an02046"
original_name_upper="AN02046"
original_urlname="an02046"
original_title="Adding CDC Virtual Comm Port to USB Audio"

# for filename in $(find . -name "*.*")
for filename in $(git ls-files)
do
    sed -i '' "s/$original_author/$author/g" $filename
    sed -i '' "s/$original_name/$name/g" $filename
    sed -i '' "s/$original_name_upper/$name_upper/g" $filename
    sed -i '' "s/$original_urlname/$urlname/g" $filename
    sed -i '' "s/$original_title/$title/g" $filename

    # Clean up readme (probably should only run on that file...)
