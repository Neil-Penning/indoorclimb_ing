#! /bin/zsh
# file name: create_md_files.zsh

echo "" > "reciept.tmp"
for num in {19..21}; do
    for letter in {A..Z}; do
        filename="./routes/SSAB-2024-$num-$letter.md"
        echo "" > "$filename"
        
        
        images=$(./findimg $num $letter)
        
        while IFS= read -r img; do
            echo "$filename" >> "reciept.tmp"
            echo "\t$img" >> "reciept.tmp"
            echo "![[$img]]" >> "$filename"
            #cat ./template.md > "$filename"
        done <<< "$images"
    done
done

cat reciept.tmp | tr -s "\n"
