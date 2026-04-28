#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=7
export CUTLASS_PATH=workaround

# BASE_DIR=/home/gpywe/data/2025-12-03_yannic_water_experiment
# BASE_DIR=/home/gpywe/data/fold_factory_test
# BASE_DIR=/home/gpywe/data/of3_protein_ligand_example
BASE_DIR=/home/gpywe/data/2026-03-12_eddy_cyp9

# Create a temporary directory for output
# TMP_OUTPUT_DIR=$(mktemp -d)
# echo "Created temporary output directory: $TMP_OUTPUT_DIR"


pixi run -e affinity \
aqaffinity predict \
    --query_json /home/gpywe/data/2026-02-25_lukas_finetunining_kras/processed/openfold3/default.json \
    --output_dir /home/gpywe/data/2026-02-25_lukas_finetunining_kras/predictions/openfold3/default \
    --num_diffusion_samples 2 \
    --use_msa_server False \
    --use_templates False \
    --binding_affinity_ckpt_path ./plugins/aqaffinity/model_weights/model_weights_only.pt \
    --inference_ckpt_path ~/.openfold3/of3_ft3_v1.pt

  # aqaffinity predict \
  # --query_json $BASE_DIR/inputs/openfold3.json \
  # --use_msa_server=False \
  # --use_templates=False \
  # --output_dir $BASE_DIR/outputs/openfold3 \
  # --binding_affinity_ckpt_path ./plugins/aqaffinity/model_weights/model_weights_only.pt \
  # --inference_ckpt_path ~/.openfold3/of3_ft3_v1.pt
  # --output_dir "$TMP_OUTPUT_DIR"
  # --num_diffusion_samples=2 \
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
