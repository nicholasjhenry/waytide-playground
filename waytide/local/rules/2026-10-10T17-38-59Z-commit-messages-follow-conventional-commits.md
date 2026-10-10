# Commit messages follow Conventional Commits 1.0.0, with a subject-first description

**Every commit message in this project follows [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).** The subject is `<type>[(<scope>)][!]: <description>`. A body may follow after one blank line, and footers after another.

**As the engineer stated it:** follow [git conventions](https://www.conventionalcommits.org/en/v1.0.0/).

## The type

- **`feat`** — a capability is added.
- **`fix`** — a defect is corrected.
- **`spec(waytide)`** — a commit that carries only Waytide records: a log entry, a rule, an idea, an implementation record, a vocabulary entry. It replaces the decision-log-convention's `Log:` prefix in this project.
- **The other common types** — `refactor`, `test`, `docs`, `build`, `ci`, `perf`, `style`, `chore` — are used with their usual meanings where one fits better than the above.

**A scope is optional** and names the part of the code the change touches, as `feat(short-url): …` does.

**A breaking change is marked** with `!` after the type or scope, and with a `BREAKING CHANGE:` footer saying what a user of the code has to change.

## The description keeps the subject-first grammar

**The description is written to the `git` package's subject-first-commit-messages rule.** It names the software that changed and its new state, in passive voice and indicative mood, and never leads with a verb. This rule adds the prefix in front of it and changes nothing after it.

```
feat: URL shortening, with expansion
fix: Short URL expansion is corrected for unknown codes
spec(waytide): test names start lower case
```

**The prefix counts against the 50-character subject** that the `git` package's commit-message-widths rule sets. Where the subject will not fit, that rule's remedies apply: split the commit, or move the detail to the body.

**A commit message already written is not rewritten.** Commits before this rule keep their messages.

**Why:** Conventional Commits makes the kind of each change readable by a machine and by a person scanning the log, and it is what release and changelog tooling expects. The engineer kept the subject-first grammar inside the description, so the structure is the standard's and the wording is the house style.

**How to apply:** start every commit subject with a Conventional Commits type, an optional scope, and `!` for a breaking change. Write the description subject-first, in passive voice. Use `spec(waytide):` for a commit that carries only Waytide records. Keep the whole subject to 50 characters and wrap the body at 72.

Related:

- the `git` package's subject-first-commit-messages rule — the description's grammar, kept
- the `git` package's commit-message-widths rule — the 50 and 72 budgets, which include the prefix
- the `foundation` decision-log-convention — the `Log:` prefix this replaces with `spec(waytide):`

---

Authored by Nicholas Henry on Sat Oct 10 2026 at 1:38:59 PM EDT
