#!/bin/bash

# Create sample files for testing the sorting script

# Get the path of the current directory
NEW_FOLDER="$1"

# Create new folder if it doesn't exist
mkdir -p "$NEW_FOLDER"

# Change to the new folder
cd "$NEW_FOLDER"

# Create documents
echo "This is a sample document." > sample_doc1.doc
echo "Another document for testing." > sample_doc2.docx
touch sample_doc3.pdf
touch sample_doc4.txt

# Create images
touch sample_image1.jpg
touch sample_image2.png
touch sample_image3.gif
touch sample_image4.bmp

# Create audios
touch sample_audio1.mp3
touch sample_audio2.wav
touch sample_audio3.m4a
touch sample_audio4.flac

# Create videos
touch sample_video1.mp4
touch sample_video2.avi
touch sample_video3.mov
touch sample_video4.mkv

# Create files with unsupported extensions
touch sample_unknown1.xyz
touch sample_unknown2.abc

echo "Sample files created."
