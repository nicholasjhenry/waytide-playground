# Loop record — subscription-plan

A user has a subscription plan, free or pro. Free is the default, and the user can upgrade to pro. An upgrade of a user who already has pro fails.

**Mode:** unattended. The agent determined and decided each hinge. No options were put to the engineer, so no cycle carries an Options or a Decision / chat line.

## Cycle 1 — actuation

- **Hinge** — how the use site reads a plan and asks for an upgrade.
- **Decided** — `Subscription.plan(user_id)`, which gives `:free` or `:pro`, and `Subscription.upgrade(user_id)`, which gives `:ok`. The plan is a bare atom because reading it cannot fail. A plan struct was the alternative, and two plans with no attributes give it nothing to hold.

## Cycle 2 — observation (root test)

- **Hinge** — what the root test reads.
- **Decided** — `Subscription.plan(control_user_id)` is `:free` for a user with no events. The free default is the unit's central behavior, so it is the root test, at `test/automated/subscription_test.exs`.

## Cycle 3 — controls

- **Hinge** — how the users are made.
- **Decided** — a new control, `Controls.UserID.unique_example`, gives `"some-user-<n>"` with a different `n` each time. All tests share one event store, so a fixed user ID upgraded in one test would make the free default fail in another, depending on the order the tests run in.

## Cycle 4 — implementation (root test)

- **Hinge** — how the implementation comes about.
- **Decided** — the working implementation, directly: `plan/1` gives `:free`. The red/green/refactor cycle adds nothing, because the test's discrimination is not in doubt.

## Cycle 5 — observation (upgrade)

- **Hinge** — what the upgrade test reads.
- **Decided** — the plan after `Subscription.upgrade(control_user_id)` is `:pro`, in `test/automated/subscription/upgrade_test.exs`. The test reads the plan, not the event, so it reads the effect a use site sees.

## Cycle 6 — implementation (upgrade)

- **Hinge** — what records an upgrade, and how the plan is derived.
- **Decided** — `upgrade/1` appends one `plan upgraded` event tagged `user:<id>`, with the user ID and the plan in its data. `plan/1` reads the `plan upgraded` events of that user, and gives `:pro` where there is one. The free default is the absence of an event, so nothing is recorded for a new user. This is the DCB local rule's tag model, and the `user:<id>` tag is the one short URLs already use.

## Cycle 7 — observation (exceptional path)

- **Hinge** — what an upgrade of a pro user reads, and where the test lives.
- **Decided** — the second `Subscription.upgrade(control_user_id)` is `:error`, in its own file, `test/automated/subscription/upgrade/already_pro_test.exs`, per the normal-path-and-exceptional-paths-are-separate-files rule. It is not green on arrival: before the implementation it gave `:ok`.

## Cycle 8 — implementation (exceptional path)

- **Hinge** — where the invariant that a user is upgraded once is enforced.
- **Decided** — `upgrade/1` reads the user's `plan upgraded` events as its decision model, gives `:error` where there is one, and otherwise appends with that query as the append condition. The event store accepts the append condition and does not check it yet, so the decision model is what enforces the invariant today. The append condition is written so that it holds the invariant against a concurrent upgrade once the store checks it.

## Cycle 9 — naming

- **Hinge** — the names of the three tests.
- **Decided** — `is free by default`, `is pro`, and `fails` inside `describe "when already pro"`. The first two are value-equals assertions, so they take `is …` per the test-name-is-prefix rule. The third follows the error-test-named-fails-condition-is-context rule. All three start lower case, per the local rule.

## Outcome

A user has a subscription plan: free by default, and pro after an upgrade. A second upgrade fails. The automated suite is verified: 8 passed (1 doctest, 7 tests). The commit is not made yet, because commit signing failed.

---

Authored by Nicholas Henry on Sun Oct 11 2026 at 1:46:03 PM EDT
