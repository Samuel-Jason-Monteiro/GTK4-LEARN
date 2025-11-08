#!/bin/bash

# Check if user passed a file name
if [ -z "$1" ]; then
  echo "Usage: ./build.sh <source_file.c>"
  exit 1
fi

# Get source file and output name
SRC="$1"
OUT="${SRC%.c}"   # Remove .c to create output name (myfile.c → myfile)

# Compile with GTK4 flags
gcc `pkg-config --cflags gtk4` "$SRC" -o "$OUT" `pkg-config --libs gtk4`

# Check if compile succeeded
if [ $? -eq 0 ]; then
  echo "✅ Build successful! Run with: ./$OUT"
else
  echo "❌ Build failed."
fi
