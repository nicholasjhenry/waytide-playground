# A Mix task's documentation is read before the task is run

**Tags:** [elixir]

**Source:** the Mix Tasks section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

- **`mix help` lists the available tasks.**
- **`mix help <task>` shows the documentation for one task.**
- **Read a task's documentation and options fully before running it.**

**Why:** a Mix task can write files, change dependencies, and change a database. What it does is decided by its options, and an option guessed from another tool's convention can do something other than what was intended.

**How to apply:** before running a Mix task for the first time in a session, run `mix help <task>` and read all of it. Run `mix help` to find a task rather than guessing its name.

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:32 PM EDT
