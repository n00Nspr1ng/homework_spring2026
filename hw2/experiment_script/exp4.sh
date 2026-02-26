# Default
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 100 -b 5000 -eb 1000 \
--exp_name pendulum

# First try
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 100 -b 1000 -eb 1000 \
  -rtg --use_baseline -na --gae_lambda 0.97 \
  --discount 0.99 -lr 0.003 -blr 0.001 -bgs 5 \
  -l 2 -s 64 --exp_name pendulum_gae097_b1000_lr3e3

# Lower-variance batch
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 50 -b 2000 -eb 1000 \
  -rtg --use_baseline -na --gae_lambda 0.95 \
  --discount 0.99 -lr 0.002 -blr 0.001 -bgs 5 \
  -l 2 -s 64 --exp_name pendulum_b2000_lr2e3_gae095

# Smaller batch, faster updates
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 125 -b 800 -eb 1000 \
  -rtg --use_baseline -na --gae_lambda 0.98 \
  --discount 0.99 -lr 0.003 -blr 0.001 -bgs 5 \
  -l 2 -s 64 --exp_name pendulum_b800_lr3e3_gae098

# Conservative learning rate
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 100 -b 1000 -eb 1000 \
  -rtg --use_baseline -na --gae_lambda 0.97 \
  --discount 0.995 -lr 0.001 -blr 0.001 -bgs 10 \
  -l 2 -s 32 --exp_name pendulum_conservative_lr1e3

# No GAE sanity check
uv run src/scripts/run.py --env_name InvertedPendulum-v4 -n 100 -b 1000 -eb 1000 \
  -rtg --use_baseline -na \
  --discount 0.99 -lr 0.003 -blr 0.001 -bgs 5 \
  -l 2 -s 64 --exp_name pendulum_no_gae_baseline
