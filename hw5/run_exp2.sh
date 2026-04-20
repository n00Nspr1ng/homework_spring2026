#!/usr/bin/env bash

set -euo pipefail

SEED=0

# CubeSingle
ALPHAS=(1 3 10)
uv run modal run src/scripts/modal_run.py --njobs=3 \
  "JOB --run_group=q2 --base_config=iql --env_name=cube-single-play-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q2 --base_config=iql --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q2 --base_config=iql --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}"

# ANTSOCCER
ALPHAS=(1 3 10)
uv run modal run src/scripts/modal_run.py --njobs=3 \
  "JOB --run_group=q2 --base_config=iql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q2 --base_config=iql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q2 --base_config=iql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}"
