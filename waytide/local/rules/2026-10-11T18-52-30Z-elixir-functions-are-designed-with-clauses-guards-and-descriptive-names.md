# Elixir functions are designed with clauses, guards, and descriptive names

**Tags:** [elixir]

**Source:** the Function Design section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

**Use guard clauses** to state what a clause accepts: `when is_binary(name) and byte_size(name) > 0`.

**Prefer multiple function clauses to complex conditional logic.**

**Name a function descriptively.** Write `calculate_total_price/2`, not `calc/2`.

**A predicate function's name ends in a question mark and does not start with `is_`.** Write `valid?/1`, not `is_valid/1` and not `is_valid?/1`.

**A name of the form `is_thing` is reserved for a guard**, as `is_binary/1` and a `defguard` are.

**Why:** a clause and its guard state at the function head what the clause takes, and the body then does one thing. A descriptive name is read at every use site, and an abbreviation there makes every reader decode it. The two predicate forms are Elixir's own convention. An `is_` prefix tells the reader the function is permitted in a guard. A `?` suffix tells them it returns a boolean and is not necessarily permitted there.

**How to apply:** write one clause per scenario, with a guard where the pattern alone does not state what the clause takes. Name each function for what it does, in full words. Name a predicate `thing?`. Use `is_thing` only for a guard.

Related:

- the elixir-code-uses-pattern-matching rule — matching in function heads
- the `language` package's expand-abbreviations-on-first-use and name-literally-not-by-analogy rules — the same standard for names in general
- the `testing` package's predicate-context-name rule — how a `thing?` predicate's test context is named

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:30 PM EDT
