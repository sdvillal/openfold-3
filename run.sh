#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=7
export CUTLASS_PATH=workaround

# BASE_DIR=/home/gpywe/data/2025-12-03_yannic_water_experiment
BASE_DIR=/home/gpywe/data/fold_factory_test

# Create a temporary directory for output
# TMP_OUTPUT_DIR=$(mktemp -d)
# echo "Created temporary output directory: $TMP_OUTPUT_DIR"


pixi run run_openfold predict \
  --query_json $BASE_DIR/of3_outputs/openfold3_7OVD_benzene.json \
  --use_msa_server=False \
  --use_templates=False \
  --num_diffusion_samples=2 \
  --output_dir $BASE_DIR/of3_run
  # --output_dir "$TMP_OUTPUT_DIR"
  # --runner_yaml $BASE_DIR/runner.yaml \

echo "Run complete." 

# echo "Output saved to: $TMP_OUTPUT_DIR"
# read -p "Do you want to delete the temporary output directory? [y/N]: " -n 1 -r
# echo
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#     rm -rf "$TMP_OUTPUT_DIR"
#     echo "Temporary directory deleted."
# else
#     echo "Temporary directory preserved at: $TMP_OUTPUT_DIR"
# fi

# --inference_ckpt_path=/project/biomols-public/biobay/openfold3_beta3/of3_ft3_v1.pt 
