# Loop record — user-scoped-short-url

A short URL belongs to the user who shortened it. Shortening and expansion each take a user ID, and only that user expands the short URL.

**Mode:** unattended. The agent determined and decided each hinge. No options were put to the engineer, so no cycle carries an Options or a Decision / chat line.

## Cycle 1 — actuation

- **Hinge** — how the user reaches the unit, and what "scoped to a user" means at the use site.
- **Decided** — `ShortURL.shorten(url, user_id)` and `ShortURL.expand(short_url, user_id)`. The user ID is an argument to the two actuations. The short URL text carries no user. The intent says a short URL is scoped to a user, which reads as ownership and visibility, not as a per-user namespace in the URL. A user segment in the URL was the alternative, and it would make the user public in every link.

## Cycle 2 — observation (normal path)

- **Hinge** — what the root test reads.
- **Decided** — the root test keeps its one observation, the expanded URL equals the original, with the same user ID sent to the two actuations. It is the normal path of the changed interface.

## Cycle 3 — controls

- **Hinge** — how the users are made.
- **Decided** — `Controls.UserID`, with `example` as `"some-user"` and `other_example` as `"some-other-user"`. Two distinct values are what make the exceptional path discriminate.

## Cycle 4 — implementation (normal path)

- **Hinge** — how the implementation comes about.
- **Decided** — the working implementation, directly: the two functions take the user ID and do not read it yet. The red/green/refactor cycle adds nothing here, because the test's discrimination is not in doubt.

## Cycle 5 — observation (exceptional path)

- **Hinge** — what another user's expansion reads, and where the test lives.
- **Decided** — `ShortURL.expand(short_url, control_other_user_id)` is `:error`, in its own file, `test/automated/short_url/another_user_test.exs`, per the normal-path-and-exceptional-paths-are-separate-files rule. It is not green on arrival: before the implementation it returned `{:ok, url}`.

## Cycle 6 — implementation (exceptional path)

- **Hinge** — where the user is recorded, and how the scope is enforced.
- **Decided** — the `url shortened` event carries a second tag, `user:<id>`, and the user ID in its data. `expand` queries the two tags, which the query semantics combine with AND. The append condition stays on the code tag alone, so a code is unique across all users, because the short URL text has no user in it. This is the DCB local rule's tag model, and it needs no index or second stream.

## Cycle 7 — naming

- **Hinge** — the names of the two tests.
- **Decided** — the root test keeps `expands to the original URL`. The exceptional test is `fails` inside `describe "when expanded by another user"`, per the error-test-named-fails-condition-is-context rule and the local lower-case rule.

## Outcome

Short URLs are scoped to a user. The automated suite is verified: 5 passed (1 doctest, 4 tests). Commit `e9b8d16` on `feature/user-scoped-short-url`.

---

Authored by Nicholas Henry on Sat Oct 10 2026 at 2:00:41 PM EDT
