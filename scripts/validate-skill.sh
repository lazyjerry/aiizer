#!/usr/bin/env bash

set -euo pipefail

skill_root="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

required_files=(
  "SKILL.md"
  "references/process.md"
  "references/patterns.md"
  "examples/complete-example.md"
  "scripts/validate-skill.sh"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "${skill_root}/${file}" ]]; then
    printf '缺少必要檔案：%s\n' "${skill_root}/${file}" >&2
    exit 1
  fi
done

line_count="$(wc -l < "${skill_root}/SKILL.md" | tr -d ' ')"
if (( line_count > 500 )); then
  printf 'SKILL.md 行數過多：%s 行\n' "${line_count}" >&2
  exit 1
fi

grep -q '\[process.md\](\./references/process.md)' "${skill_root}/SKILL.md" || {
  printf 'SKILL.md 未引用 references/process.md\n' >&2
  exit 1
}

grep -q '\[patterns.md\](\./references/patterns.md)' "${skill_root}/SKILL.md" || {
  printf 'SKILL.md 未引用 references/patterns.md\n' >&2
  exit 1
}

grep -q '\[complete-example.md\](\./examples/complete-example.md)' "${skill_root}/SKILL.md" || {
  printf 'SKILL.md 未引用 examples/complete-example.md\n' >&2
  exit 1
}

printf 'aIizer 技能結構驗證通過：%s\n' "${skill_root}"