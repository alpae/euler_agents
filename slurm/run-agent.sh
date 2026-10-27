#!/usr/bin/env bash
#SBATCH --job-name=euler-agent
#
# Usage: sbatch slurm/run-agent.sh [--agent codex|claude] [--task "..."] [--repo URL] [--model MODEL]
# Submit via euler-agent-submit, which sets resources, partition and --output/--error from
# config/settings.json and the site profile. Site modules (a proxy, the container runtime)
# are loaded by euler-agent-run, so this script stays cluster-neutral.
set -euo pipefail

REPO_DIR="${EULER_AGENTS_DIR:?EULER_AGENTS_DIR not set — submit via euler-agent-submit}"

echo "SLURM job $SLURM_JOB_ID on $(hostname)"
exec "$REPO_DIR/bin/euler-agent-run" "$@"
