#!/bin/bash
# Optimized 3D generation script for TripoSR (for 16GB VRAM)

source ~/anaconda3/etc/profile.d/conda.sh
conda activate TripleSR
cd /home/hongyu/Documents/TripoSR

# Usage: ./generate_optimized.sh your_image.png
IMAGE_PATH=$1

if [ -z "$IMAGE_PATH" ]; then
    echo "Usage: ./generate_optimized.sh <image_path>"
    echo "Example: ./generate_optimized.sh examples/chair.png"
    exit 1
fi

# Optimized settings to avoid OOM:
# - Lower mc-resolution (256 instead of 512)
# - Smaller chunk-size to reduce memory usage
# - Lower texture resolution (2048 instead of 4096)
python run.py "$IMAGE_PATH" \
    --mc-resolution 256 \
    --bake-texture \
    --texture-resolution 2048 \
    --render \
    --foreground-ratio 0.85 \
    --chunk-size 4096

echo "Done! Check the output/ directory for results"
