#!/bin/bash
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export gitrepodir="$CUR_DIR/../pointer-generator"
export vocab_path="$CUR_DIR/../finished_files/vocab"
export log_root="$CUR_DIR/../log"
export hidden_dim="256" # default
export emb_dim=128 # default
export batch_size=16 # default
export max_enc_steps=400 # default
export max_dec_steps=$((max_enc_steps / 4)) # default iff max_enc_steps is default
export vocab_size=50000 # default
export lr=0.15 # default
export adagrad_init_acc=0.1 # default
export rand_unif_init_mag=0.02 # default
export trunc_norm_init_std="1e-4" # default
export max_grad_norm=2.0 # default
export cov_loss_wt=0.1 # default
export convert_to_coverage_model=False # default
export debug=False # default
export exp_name="pretrained_model"
