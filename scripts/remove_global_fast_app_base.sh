#!/usr/bin/env bash
set -euo pipefail

PKG="fast_app_base"
PUB_CACHE_DEFAULT="$HOME/.pub-cache"
PUB_CACHE="${PUB_CACHE:-$PUB_CACHE_DEFAULT}"
BIN_DIR="$PUB_CACHE/bin"
GLOBAL_DIR="$PUB_CACHE/global_packages/$PKG"

confirm() {
  if [[ "${FORCE:-}" == "1" || "${1:-}" == "--yes" ]]; then
    return 0
  fi
  read -r -p "This will remove global $PKG from $PUB_CACHE. Continue? [y/N] " reply
  [[ "$reply" == "y" || "$reply" == "Y" ]]
}

usage() {
  cat <<EOF
Usage: $(basename "$0") [--yes]

Actions performed:
- dart pub global deactivate $PKG (best-effort)
- Remove $GLOBAL_DIR
- Remove matching executables in $BIN_DIR (fast_app_base*)

Environment variables:
- PUB_CACHE: override path to pub cache (default: $PUB_CACHE_DEFAULT)
- FORCE=1: skip confirmation
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if ! confirm "${1:-}"; then
  echo "Aborted."
  exit 1
fi

echo "Deactivating via dart pub (if present)..."
if command -v dart >/dev/null 2>&1; then
  dart pub global deactivate "$PKG" || true
else
  echo "Warning: 'dart' not found on PATH; skipping deactivate."
fi

# Also try through flutter's bundled dart if available
if command -v flutter >/dev/null 2>&1; then
  echo "Also attempting deactivate via flutter's dart..."
  flutter dart pub global deactivate "$PKG" || true
fi

echo "Removing global package directory: $GLOBAL_DIR"
rm -rf "$GLOBAL_DIR" || true

if [[ -d "$BIN_DIR" ]]; then
  echo "Removing executables in $BIN_DIR:"
  # List and remove matching files safely
  found=0
  for f in "$BIN_DIR"/fast_app_base*; do
    if [[ -e "$f" ]]; then
      echo "  - $f"
      rm -f "$f"
      found=1
    fi
  done
  if [[ $found -eq 0 ]]; then
    echo "  (none found)"
  fi
else
  echo "Bin directory not found: $BIN_DIR"
fi

rm -f .dart_tool/pub/bin/fast_app_base/fast_app_base.dart-3.9.2.snapshot

echo "Done. Verify with:"
echo "  dart pub global list | grep $PKG || true"
echo "  which fast_app_base || echo 'no fast_app_base on PATH'"
