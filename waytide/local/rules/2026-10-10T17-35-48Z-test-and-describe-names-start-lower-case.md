# Test and describe names start lower case

**The name given to a `test` or a `describe` block starts with a lower-case letter.** Write `test "expands to the original URL"`, not `test "Expands to the original URL"`, and `describe "when the URL is invalid"`, not `describe "When the URL is invalid"`.

**As the engineer stated it:** all test descriptions should start lower case.

**Only the first character changes.** A proper noun, an acronym, or a module name later in the name keeps its own case, as `URL` does above. A name that starts with one of these, such as `URL` or a module name, keeps its case, because lower-casing it would make it a different word.

**This overrides the capitalized forms in the `testing` package for this project.** Its error-test-named-fails-condition-is-context rule names an error test `Fails` or `Doesn't fail`, and here they are `fails` and `doesn't fail`. Its test-name-is-prefix rule reserves an `Is …` name for a value-equals assertion, and here that name is `is …`. What each of those rules decides about the name is unchanged, and only the case of its first letter is different.

**Why:** ExUnit prints a test as `test <name>`, so the name reads as the second part of one phrase. A lower-case start reads as that phrase continuing. A capital in the middle of it reads as a new sentence.

**How to apply:** start every `test` and `describe` name in this project with a lower-case letter, unless its first word is a proper noun, an acronym, or a module name. Apply the `testing` package's naming rules as they are written, with that one change of case.

Related:

- the `testing` package's error-test-named-fails-condition-is-context rule — `fails` and `doesn't fail`
- the `testing` package's test-name-is-prefix rule — `is …`
- the `testing` package's a-high-level-context-names-a-behavior-not-a-method rule — what the name says, which this does not change

---

Authored by Nicholas Henry on Sat Oct 10 2026 at 1:35:48 PM EDT
