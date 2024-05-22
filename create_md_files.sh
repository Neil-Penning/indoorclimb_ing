#! /bin/zsh
# file name: create_md_files.zsh

for num in {19..21}; do
    for letter in {A..Z}; do
        filename="SSAB-2024-$num-$letter.md"
        echo "" > "$filename"
        
        
        images=$(./findimg $num $letter)
        
        while IFS= read -r img; do
            echo "![[$img]]" >> "$filename"
        done <<< "$images"

        
        echo "Created $filename with embedded images."
    done
done
