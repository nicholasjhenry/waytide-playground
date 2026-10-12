# Elixir values are inspected with `dbg/1` while debugging

**Tags:** [elixir]

**Source:** the Debugging section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

**Use `dbg/1` to print a value while debugging.** It prints the formatted value, the code that produced it, and where that code is.

**Why:** one call shows the value with its expression and its location, which `IO.inspect/2` does not show without options. Appended to a pipeline, it prints the value after each step.

**How to apply:** while debugging, wrap the expression in `dbg/1` or append `|> dbg()` to a pipeline.

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:34 PM EDT
