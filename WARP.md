# WARP.md

這份文件提供 WARP（warp.dev）在此儲存庫中處理程式碼時所需的指引。

## 這個儲存庫是什麼
這個儲存庫是一個以 Markdown 與 Bash 為主的 **Claude Code / Copilot skill**。

它的功能是將人類自然書寫的文本注入典型 AI 寫作風格。基於維基百科「AI 寫作特徵」與 stop-slop 規則集，涵蓋 7 大類共 35 項 AI 寫作子模式。

## 主要檔案（以及彼此的關係）
- `SKILL.md`
  - 實際的 skill 入口檔。
  - 檔案開頭是 YAML frontmatter（`---` … `---`），包含 `name`、`version`、`description` 與 `allowed-tools`。
  - frontmatter 之後是精簡的任務說明，並導向支援檔案。
- `references/process.md`
  - 流程、密度規則、可讀性微調、評分方式與輸出格式。
- `references/patterns.md`
  - 35 項 AI 寫作模式的詳細注入規則與範例。
- `examples/complete-example.md`
  - 完整轉換示例與修改摘要示例。
- `scripts/install-skill.sh`
  - 將必要檔案安裝到 Claude Code 的 skills 目錄。
- `scripts/validate-skill.sh`
  - 驗證必要檔案、引用關係與 `SKILL.md` 行數上限。
- `README.md`
  - 安裝與使用說明。
  - 內含精簡版的「35 個模式」表格與簡短的版本歷程。

當你要變更行為或內容時，請將 `SKILL.md` 視為入口，並同步檢查相關支援檔案與 `README.md` 是否仍一致。

## 常用指令
### 將 skill 安裝到 Claude Code
建議方式（直接 clone 到 Claude Code 的 skills 目錄）：
```bash
mkdir -p ~/.claude/skills
git clone https://github.com/lazyjerry/aIizer ~/.claude/skills/aIizer
```

從本地儲存庫重新安裝或更新：
```bash
./scripts/install-skill.sh
```

驗證技能結構：
```bash
./scripts/validate-skill.sh
```

## 如何「執行」它（Claude Code）
呼叫這個 skill：
- `/aIizer`，然後貼上文字

## 安全地進行變更
### 版本管理（保持同步）
- `SKILL.md` 的 YAML frontmatter 內有 `metadata.version` 欄位（目前為 3.1.0）。
- `README.md` 內有「版本紀錄」章節。

如果你提高版本號，請同步更新這兩個檔案。

### 編輯 `SKILL.md`
- 保持 YAML frontmatter 的格式與縮排有效。
- 盡量讓 `SKILL.md` 維持精簡，詳細規則優先放到 `references/` 與 `examples/`。
- 除非你是刻意重新編號，否則請維持模式編號穩定不變（因為 README 的表格與範例會參照相同編號）。
- 若新增支援檔案，記得同步更新 `SKILL.md` 的導覽段落與 `scripts/validate-skill.sh`。

### 記錄不明顯的修正
如果你修改提示詞來處理棘手的失敗情境（例如重複發生的錯誤編修，或不預期的語氣偏移），請在 `README.md` 的版本歷程中補上一段簡短說明，交代修正了什麼以及原因。