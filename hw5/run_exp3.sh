#!/usr/bin/env bash

set -euo pipefail

# echo "Current time: $(date)"
# echo "Sleeping for 1 minute..."
# sleep 1m
# echo "Done waiting for 1 minute."

# sleep 3h

SEED=0

# CubeSingle
ALPHAS=(30 100 300 1000)
uv run modal run src/scripts/modal_run.py --njobs=4 \
  "JOB --run_group=q3 --base_config=fql --env_name=cube-single-play-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=cube-single-play-singletask-task1-v0 --seed=$((SEED + 3)) --alpha=${ALPHAS[3]}"

# ANTSOCCER
ALPHAS=(1 3 10 30)
uv run modal run src/scripts/modal_run.py --njobs=4 \
  "JOB --run_group=q3 --base_config=fql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=${SEED} --alpha=${ALPHAS[0]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 1)) --alpha=${ALPHAS[1]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 2)) --alpha=${ALPHAS[2]}" \
  "JOB --run_group=q3 --base_config=fql --env_name=antsoccer-arena-navigate-singletask-task1-v0 --seed=$((SEED + 3)) --alpha=${ALPHAS[3]}"
