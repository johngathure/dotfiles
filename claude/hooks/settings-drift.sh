#!/bin/sh
# Warn when the shared Claude settings (~/.claude/settings.json, a symlink into
# dotfiles) differ from the last commit in anything other than model or effort.
# Those changes were likely made inside Claude Code and may be machine-specific,
# so they belong in ~/.claude/settings.work.json or settings.personal.json.
# Notifies once per distinct change; silent again once committed or reverted.

cat >/dev/null # hook input is not needed

file=$(readlink -f "${CLAUDE_SETTINGS_FILE:-$HOME/.claude/settings.json}" 2>/dev/null) || exit 0
repo=$(git -C "$(dirname "$file")" rev-parse --show-toplevel 2>/dev/null) || exit 0
rel=${file#"$repo/"}

# Preferences Claude Code saves from its own UI (/model, /effort, /config, /tui,
# /fast, /output-style, /theme ...). Fine in either file, so not worth a warning.
# Anything else (plugins, marketplaces, permissions, hooks, env, MCP, status
# line, sandbox) still warns.
ignore='del(
  .model, .effortLevel, .modelSettings, .alwaysThinkingEnabled,
  .fastMode, .fastModePerSessionOptIn, .outputStyle, .tui, .theme, .verbose,
  .spinnerTipsEnabled, .showTurnDuration, .prefersReducedMotion,
  .terminalProgressBarEnabled, .autoUpdatesChannel, .language
)'
committed=$(git -C "$repo" show "HEAD:$rel" 2>/dev/null | jq -S "$ignore" 2>/dev/null) || exit 0
current=$(jq -S "$ignore" "$file" 2>/dev/null) || exit 0

state="${CLAUDE_SETTINGS_DRIFT_STATE:-$HOME/.claude/.settings-drift}"
if [ "$committed" = "$current" ]; then
  rm -f "$state"
  exit 0
fi

sig=$(printf '%s' "$current" | shasum | cut -c1-40)
[ "$(cat "$state" 2>/dev/null)" = "$sig" ] && exit 0
echo "$sig" >"$state"

keys=$(jq -rn --argjson a "$committed" --argjson b "$current" \
  '[($a | keys[]), ($b | keys[])] | unique | map(select($a[.] != $b[.])) | join(", ")')

osascript -e "display notification \"Changed: $keys\" with title \"Claude settings changed\"" >/dev/null 2>&1
jq -n --arg m "Shared Claude settings changed: $keys. Move machine-specific ones to ~/.claude/settings.work.json or settings.personal.json, or commit them to dotfiles." \
  '{systemMessage: $m}'
