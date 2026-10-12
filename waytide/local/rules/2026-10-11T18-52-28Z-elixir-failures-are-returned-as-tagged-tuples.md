# An Elixir operation that can fail returns a tagged tuple, and does not raise for control flow

**Tags:** [elixir]

**Source:** the Error Handling section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

**An operation that can fail returns `{:ok, result}` or `{:error, reason}`.** The use site then sees the failure in the return value and handles it there.

**Do not raise an exception for control flow.** An exception that selects a path through ordinary code moves that path out of the code the reader reads.

**Chain operations that return `{:ok, _}` or `{:error, _}` with `with`.** The `with` reads as the normal path, and it returns the first `{:error, _}` unchanged.

```elixir
with {:ok, user} <- fetch_user(user_id),
     {:ok, plan} <- fetch_plan(user) do
  {:ok, plan}
end
```

**Why:** a tagged tuple makes failure part of the function's interface, so the efferent cannot overlook it. A raised exception used as a branch is invisible at the use site until it is raised. `with` keeps a chain of fallible operations flat, where nested `case` expressions would indent once for each step.

**How to apply:** give every operation that can fail an `{:ok, result}` or `{:error, reason}` return. Raise only where a failure is not a path the use site is expected to take. Chain fallible operations with `with`, not with nested `case` expressions.

Related:

- the state-follows-dynamic-consistency-boundary rule — a failed append, which is a concurrency conflict returned to the use site
- the elixir-common-mistakes-are-avoided rule — nested `case` expressions
- the `testing` package's error-test-named-fails-condition-is-context rule — how a raised error is tested

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:28 PM EDT
