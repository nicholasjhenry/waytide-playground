# Elixir data structures are chosen by the shape of the data

**Tags:** [elixir]

**Source:** the Data Structures section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

- **Use a struct where the shape is known:** `defstruct [:name, :age]`.
- **Use a keyword list for options:** `[timeout: 5000, retries: 3]`.
- **Use a map for dynamic key-value data.**
- **Prepend to a list with `[new | list]`, not `list ++ [new]`.**

**Why:** a struct names its fields, and the compiler refuses a key the struct does not define. A keyword list is the form Elixir's own functions take options in. A map holds keys that are not known until the code runs. Prepending to a list takes constant time, and `++` copies the whole left-hand list.

**How to apply:** define a struct for every value whose fields are known. Take options as a keyword list. Use a map where the keys come from the data. Build a list by prepending, and reverse it once at the end where the order matters.

Related:

- the state-follows-dynamic-consistency-boundary rule — the event data, which is an opaque payload rather than a shape this rule decides

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:31 PM EDT
