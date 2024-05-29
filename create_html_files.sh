#!/bin/zsh
# file name: create_html_files.zsh

echo "" > "reciept.tmp"
for num in {19..22}; do
    for letter in {A..Z}; do
        filename="./html/routes/SSAB-2024-$num-$letter.html"
        touch "$filename"
        echo "" > "$filename"
        
        images=$(./findimg $num $letter)
        
        # Start the file with <!DOCTYPE html><html>
        echo "<!DOCTYPE html>" > "$filename"
        echo "<html>" >> "$filename"
        
        while IFS= read -r img; do
            echo "$filename" >> "reciept.tmp"
            echo "\t$img" >> "reciept.tmp"
            # Add HTML image tag
            echo "<img src=\"$img\" alt=\"Image\">" >> "$filename"
        done <<< "$images"
        
        # Append the template at the end
        cat ./template.html >> "$filename"
    done
done

cat reciept.tmp | tr -s "\n"

