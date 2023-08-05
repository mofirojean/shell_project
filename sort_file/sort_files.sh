#!/bin/bash

# Check for correct usage
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

# Get the path of the current directory
# CURR_DIR="$(pwd)"
CURR_DIR="$1"
SCRIPT_NAME="$(basename "$0")"

echo "$SCRIPT_NAME"

# List the various file format and their extensions
LIST_DOCS=("doc" "docx" "pdf" "txt")
LIST_IMAGES=("jpg" "jpeg" "png" "gif")
LIST_AUDIOS=("mp3" "wav" "ogg" "aac" "m4a" "mp4" "wma" "aiff" "au" "vox")
LIST_VIDEOS=("mp4" "avi" "mov" "wmv" "mpeg" "mpg" "m4v" "mkv" "flv" "webm")

# Check and create directories if they don't exist
for dir_name in images videos documents audios others; do
    if [ ! -d "$CURR_DIR/$dir_name" ]; then
        mkdir -p "$CURR_DIR/$dir_name"
    fi
done

# Read all the files and sort them
for file in "$CURR_DIR"/*; do
    # Check if the current file is not the script itself or a directory
    if [ "$file" = "$CURR_DIR/$SCRIPT_NAME" ] || [ -d "$file" ]; then
        continue
    fi

    # Get the file extension in lowercase
    ext="${file##*.}"

    # get lowercase so you can handle all cases well
    ext_lc="${ext,,}"

    # Move the file to the destination directory
    matched=false
    for ext_list in "${LIST_DOCS[@]}"; do
        if [ "$ext_lc" = "$ext_list" ]; then
            matched=true
            echo "Moving $file to documents/"
            mv "$file" "$CURR_DIR/documents/"
            break
        fi
    done

    if ! "$matched"; then
        for ext_list in "${LIST_IMAGES[@]}"; do
            if [ "$ext_lc" = "$ext_list" ]; then
                matched=true
                echo "Moving $file to images/"
                mv "$file" "$CURR_DIR/images/"
                break
            fi
        done
    fi

    if ! "$matched"; then
        for ext_list in "${LIST_AUDIOS[@]}"; do
            if [ "$ext_lc" = "$ext_list" ]; then
                matched=true
                echo "Moving $file to audios/"
                mv "$file" "$CURR_DIR/audios/"
                break
            fi
        done
    fi

    if ! "$matched"; then
        for ext_list in "${LIST_VIDEOS[@]}"; do
            if [ "$ext_lc" = "$ext_list" ]; then
                matched=true
                echo "Moving $file to videos/"
                mv "$file" "$CURR_DIR/videos/"
                break
            fi
        done
    fi

    if ! "$matched"; then
        echo "Moving $file to others/"
        mv "$file" "$CURR_DIR/others/"
    fi
done

echo -e "Your files are now sorted :)\nProcess terminated"
