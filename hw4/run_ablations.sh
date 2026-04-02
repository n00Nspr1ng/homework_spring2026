#!/usr/bin/env bash

set -euo pipefail

# Ablation 1: different ppo_epochs (1, 2, 5, 10)
for ppo_epochs in 1 2 5 10; do
  uv run modal run --detach scripts/modal_train.py -- \
    --task format_copy \
    --algo grpo \
    --output_dir "/vol/runs/modal_format_copy_grpo_ablation_ppo_epochs_${ppo_epochs}" \
    --steps 51 \
    --batch_size 8 \
    --group_size 6 \
    --min_new_tokens 1 \
    --max_new_tokens 24 \
    --lr 3e-5 \
    --ppo_epochs "${ppo_epochs}" \
    --minibatch_size 8 \
    --grad_accum_steps 6 \
    --clip_eps 0.2 \
    --kl_coef 0.05 \
    --max_grad_norm 0.5 \
    --wandb_enabled \
    --wandb_project llm-rl-hw4 \
    --wandb_name "format_copy_grpo_ablation_ppo_epochs_${ppo_epochs}" \
    --sample_markdown_log_interval 1 \
    --sample_log_interval 10 \
    --sample_log_n 6 \
    --eval_interval 50 \
    --save_interval 50 \
    --warmup_steps 10
done

# Ablation 2: different kl_coef (0, 0.01, 0.05, 0.1)
for kl_coef in 0.0 0.01 0.05 0.1; do
  kl_tag="${kl_coef//./p}"
  uv run modal run --detach scripts/modal_train.py -- \
    --task format_copy \
    --algo grpo \
    --output_dir "/vol/runs/modal_format_copy_grpo_ablation_kl_coef_${kl_tag}" \
    --steps 51 \
    --batch_size 8 \
    --group_size 6 \
    --min_new_tokens 1 \
    --max_new_tokens 24 \
    --lr 3e-5 \
    --ppo_epochs 2 \
    --minibatch_size 8 \
    --grad_accum_steps 6 \
    --clip_eps 0.2 \
    --kl_coef "${kl_coef}" \
    --max_grad_norm 0.5 \
    --wandb_enabled \
    --wandb_project llm-rl-hw4 \
    --wandb_name "format_copy_grpo_ablation_kl_coef_${kl_tag}" \
    --sample_markdown_log_interval 1 \
    --sample_log_interval 10 \
    --sample_log_n 6 \
    --eval_interval 50 \
    --save_interval 50 \
    --warmup_steps 10
done

# Ablation 3: different clip_eps (0.0, 0.1, 0.2, 0.5)
for clip_eps in 0.0 0.1 0.2 0.5; do
  clip_tag="${clip_eps//./p}"
  uv run modal run --detach scripts/modal_train.py -- \
    --task format_copy \
    --algo grpo \
    --output_dir "/vol/runs/modal_format_copy_grpo_ablation_clip_eps_${clip_tag}" \
    --steps 51 \
    --batch_size 8 \
    --group_size 6 \
    --min_new_tokens 1 \
    --max_new_tokens 24 \
    --lr 3e-5 \
    --ppo_epochs 2 \
    --minibatch_size 8 \
    --grad_accum_steps 6 \
    --clip_eps "${clip_eps}" \
    --kl_coef 0.05 \
    --max_grad_norm 0.5 \
    --wandb_enabled \
    --wandb_project llm-rl-hw4 \
    --wandb_name "format_copy_grpo_ablation_clip_eps_${clip_tag}" \
    --sample_markdown_log_interval 1 \
    --sample_log_interval 10 \
    --sample_log_n 6 \
    --eval_interval 50 \
    --save_interval 50 \
    --warmup_steps 10
done

# Ablation 4: different (minibatch_size, grad_accum_steps) = ((48, 1), (8, 6), (4, 12), (1, 48))
# ppo_epochs * (batch_size * group_size / minibatch_size) / grad_accum_steps = number of updates,
# so we keep this constant across all ablations to ensure a fair comparison.
for pair in "48 1" "8 6" "4 12" "1 48"; do
  read -r minibatch_size grad_accum_steps <<< "${pair}"
  uv run modal run --detach scripts/modal_train.py -- \
    --task format_copy \
    --algo grpo \
    --output_dir "/vol/runs/modal_format_copy_grpo_ablation_minibatch_${minibatch_size}_grad_accum_${grad_accum_steps}" \
    --steps 51 \
    --batch_size 8 \
    --group_size 6 \
    --min_new_tokens 1 \
    --max_new_tokens 24 \
    --lr 3e-5 \
    --ppo_epochs 2 \
    --minibatch_size "${minibatch_size}" \
    --grad_accum_steps "${grad_accum_steps}" \
    --clip_eps 0.2 \
    --kl_coef 0.05 \
    --max_grad_norm 0.5 \
    --wandb_enabled \
    --wandb_project llm-rl-hw4 \
    --wandb_name "format_copy_grpo_ablation_minibatch_${minibatch_size}_grad_accum_${grad_accum_steps}" \
    --sample_markdown_log_interval 1 \
    --sample_log_interval 10 \
    --sample_log_n 6 \
    --eval_interval 50 \
    --save_interval 50 \
    --warmup_steps 10
done
