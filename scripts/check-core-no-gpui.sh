#!/bin/sh
# CI guard (Issues.md M0-01): `ublue-updater-core` must never depend on gpui,
# directly or transitively. Exits non-zero if gpui shows up anywhere in the
# core crate's dependency tree (normal, dev, and build edges included).

set -eu

# Capture the tree first: if `cargo tree` itself fails, the script must fail
# rather than silently treating the empty output as "no gpui found".
tree=$(cargo tree -p ublue-updater-core -e normal,dev,build)

if printf '%s\n' "$tree" | grep -q 'gpui'; then
    echo "ERROR: ublue-updater-core must not depend on gpui (Design.md section 4.2)" >&2
    exit 1
fi

echo "OK: no gpui in ublue-updater-core dependency tree"
