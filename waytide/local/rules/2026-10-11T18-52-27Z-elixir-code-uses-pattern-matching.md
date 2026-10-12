# Elixir code uses pattern matching in place of conditional logic

**Tags:** [elixir]

**Source:** the Pattern Matching section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

**Use pattern matching in place of conditional logic where a pattern can do the work.** A pattern states the shape of the value a branch takes. An `if`/`else` or a `case` in a function body states the same thing inside the implementation.

**Match on function heads before writing `if`/`else` or `case` in a function body.** Each clause then handles one scenario, and its pattern names that scenario.

**`%{}` matches any map, not only an empty map.** To match an empty map, use the guard `map_size(map) == 0`.

```elixir
def describe(map) when map_size(map) == 0, do: :empty
def describe(%{}), do: :not_empty
```

**Why:** a pattern in a function head is read before the body, where the scenario is decided. The reader sees which values a clause takes without reading its implementation. The `%{}` pattern reads as more specific than it is, and a clause written on that reading matches every map.

**How to apply:** where a function branches on the shape or the value of an argument, write one clause per scenario and match in the head. Keep `if`/`else` and `case` for a branch that a pattern cannot express. To match an empty map, guard on `map_size/1`, never on `%{}` alone.

Related:

- the elixir-functions-are-designed-with-clauses-guards-and-descriptive-names rule — multiple clauses and guards
- the elixir-common-mistakes-are-avoided rule — base cases matched in function heads

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:27 PM EDT
