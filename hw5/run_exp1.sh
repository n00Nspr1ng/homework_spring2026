#!/usr/bin/env bash

set -euo pipefail

SEED=0

# CubeSingle
ALPHAS=(30 100 300 1000)
uv run modal run src/scripts/modal_run.py --njobs=4 \
  "JOB --run_group=q1 --base_config=sacbc --env_name=cube-single-play-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 3)) --alpha=${ALPHAS[3]}"

# ANTSOCCER
ALPHAS=(1 3 10 30)
uv run modal run src/scripts/modal_run.py --njobs=4 \
  "JOB --run_group=q1 --base_config=sacbc --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}" \
  "JOB --run_group=q1 --base_config=sacbc --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 3)) --alpha=${ALPHAS[3]}"
