# Elixir tests are run and selected with `mix test`

**Tags:** [elixir]

**Source:** the Testing section of [ash-project/usage_rules v1.2.8, `elixir.md`](https://github.com/ash-project/usage_rules/blob/v1.2.8/usage-rules/elixir.md).

- **Run the tests in one file** with `mix test test/my_test.exs`, and one test by its line number with `mix test path/to/test.exs:123`.
- **Limit the number of failed tests** with `mix test --max-failures n`.
- **Tag a test with `@tag`**, and run only the tagged tests with `mix test --only tag`.
- **Test an expected exception with `assert_raise`:** `assert_raise ArgumentError, fn -> invalid_function() end`.
- **Read `mix help test`** for the full documentation on running tests.

**A narrowed run is for speed while working, and it does not replace the full run.** The `git` package's run-suite-before-commit rule still requires the full automated suite to pass before a commit is weighed.

**Why:** `mix test` selects by file, by line, and by tag, so a run can be limited to the test under work. A short run keeps the wait at each implementation small. `assert_raise` states the exception class an actuation is expected to raise.

**How to apply:** while working on one test, run its file or its line. Use `--max-failures` where a change breaks many tests at once. Use `@tag` and `--only` to select a group. Run the full automated suite before weighing a commit.

Related:

- the `git` package's run-suite-before-commit rule — the full run before a commit
- the `testing` package's error-test-named-fails-condition-is-context rule — how an `assert_raise` test is named
- the `testing` package's assert-error-message-only-as-sole-discriminator rule — when the message is asserted as well as the class

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 2:52:33 PM EDT
