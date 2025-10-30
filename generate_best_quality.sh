#!/bin/bash
# Best quality 3D generation script for TripoSR

source ~/anaconda3/etc/profile.d/conda.sh
conda activate TripleSR
cd /home/hongyu/Documents/TripoSR

# Usage: ./generate_best_quality.sh your_image.png
IMAGE_PATH=$1

if [ -z "$IMAGE_PATH" ]; then
    echo "Usage: ./generate_best_quality.sh <image_path>"
    echo "Example: ./generate_best_quality.sh examples/chair.png"
    exit 1
fi

python run.py "$IMAGE_PATH" \
    --mc-resolution 512 \
    --bake-texture \
    --texture-resolution 4096 \
    --render \
    --foreground-ratio 0.85 \
    --chunk-size 8192

echo "Done! Check the output/ directory for results"
