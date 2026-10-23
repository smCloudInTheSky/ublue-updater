//! Headless core of ublue-updater.
//!
//! This crate owns the domain model, the provider abstraction, process
//! orchestration, parsing, and locking (see `Design.md` §4). It must never
//! depend on a UI framework; the gpui shell lives in the `ublue-updater`
//! binary crate (`crates/gui`), and this rule is enforced by
//! `scripts/check-core-no-gpui.sh` in CI.
