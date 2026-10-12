# Common Elixir mistakes are avoided

**Tags:** [elixir]

**Source:** the Common Mistakes to Avoid section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

**Each item below is a construct carried over from another language, or written where Elixir already supplies a clearer one.**

- **Elixir has no `return` statement and no early return.** The last expression in a block is its value. Where another language returns early, write separate clauses or a `with`.
- **Use `Stream` in place of `Enum` for a large collection where `Stream` is more appropriate.** Each `Enum` step builds a complete intermediate list, and a `Stream` builds none.
- **Do not nest `case` expressions.** Refactor them to one `case`, a `with`, or separate functions.
- **Do not call `String.to_atom/1` on user input.** Atoms are not garbage-collected, so each new value from a user is held for the life of the VM.
- **A list or an enumerable cannot be indexed with brackets.** Use pattern matching or an `Enum` function.
- **Prefer an `Enum` function such as `Enum.reduce/3` to recursion.**
- **Where recursion is necessary, detect the base case with pattern matching in a function head.**
- **Use of the process dictionary is usually a sign of unidiomatic code.**
- **Write a macro only where the engineer asks for one.**
- **Prefer a standard library function to a hand-written one where one exists.**

**Why:** each of these produces code that works and reads as foreign to an Elixir reader, or that fails in a way the code does not show. An unbounded atom table and an `Enum` pipeline over a large collection each fail under load rather than in a test. A macro, the process dictionary, and hand-written recursion each make the reader do work that a function, an argument, or an `Enum` call would not.

**How to apply:** check new Elixir code against each item before it is put to the engineer. Where a macro would serve, use a function unless the engineer asked for the macro.

Related:

- the elixir-code-uses-pattern-matching rule — clauses in place of conditional logic
- the elixir-failures-are-returned-as-tagged-tuples rule — `with` in place of nested `case` expressions
- the `language` package's solubility rule — the quality these items are judged against

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:29 PM EDT
