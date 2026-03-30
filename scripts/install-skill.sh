#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd "${script_dir}/.." && pwd)"
target_dir="${1:-${HOME}/.claude/skills/aiizer}"

"${repo_dir}/scripts/validate-skill.sh" "${repo_dir}" >/dev/null

mkdir -p "${target_dir}/references" "${target_dir}/examples" "${target_dir}/scripts"

cp "${repo_dir}/SKILL.md" "${target_dir}/SKILL.md"
cp "${repo_dir}/references/process.md" "${target_dir}/references/process.md"
cp "${repo_dir}/references/patterns.md" "${target_dir}/references/patterns.md"
cp "${repo_dir}/examples/complete-example.md" "${target_dir}/examples/complete-example.md"
cp "${repo_dir}/scripts/validate-skill.sh" "${target_dir}/scripts/validate-skill.sh"

printf '已安裝 AIizer 至 %s\n' "${target_dir}"
printf '可執行驗證：%s/scripts/validate-skill.sh %s\n' "${target_dir}" "${target_dir}"