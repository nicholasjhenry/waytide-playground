# The implementation keeps its state as events, under a Dynamic Consistency Boundary

**Tags:** [design]

**The implementation follows [Dynamic Consistency Boundary (DCB)](https://dcb.events), to [its specification](https://dcb.events/specification/).** State is recorded as events in one event store per bounded context. A decision reads the events it needs by a query, and its write is accepted only if no event matching that query was appended after it read.

**As the engineer stated it:** the implementation should follow https://dcb.events.

## What is recorded

- **An event carries an event type, event data, and tags.** The type names the fact (`url shortened`). The data is an opaque payload. The tags name the things the fact concerns (`short-url:<code>`), and an event may carry several.
- **There is one event stream for the bounded context**, not a stream per entity. An event concerns every entity its tags name.
- **Each stored event takes a sequence position**, unique in the store and in a fixed, deterministic order.

## How a decision is made

1. **Read** the events matching a query. A query is one or more query items, combined with OR. An event matches an item when its type is one of the item's types and its tags include all of the item's tags.
2. **Build the decision model** from those events, in memory, and note the position of the last event read.
3. **Decide**, and produce the new events. An empty set of events is never appended.
4. **Append** the new events with an append condition: `failIfEventsMatch` is the query from step 1, and `after` is the position from step 2. The store appends the events atomically, or fails if an event matching the query was appended after that position.

**A failed append is a concurrency conflict, not a defect.** The decision is made again from a fresh read, or the conflict is returned to the use site, whichever the outcome calls for.

**An invariant is enforced by the append condition, not by a lock or a separate index.** That a short code is not issued twice is a query on `short-url:<code>` with no `after`, so any matching event fails the append.

## What the event store provides

- **Filtering by event type and by tag** (required), and reading from a given sequence position (expected).
- **Atomic append of one or more events**, failing where the append condition matches.

**Read models are projections of the events.** A lookup such as short code to URL is derived from the events, and the events stay the record.

**Why:** DCB places the consistency boundary around each decision rather than around a fixed aggregate. A rule that spans several entities is then enforced with one append, and an entity is not forced into one stream to make that possible.

**How to apply:** record state changes as tagged events in the bounded context's one stream. For each decision, read by a query, build the decision model, decide, and append with that query and the last position read as the append condition. Enforce an invariant with an append condition. Derive lookups from the events as projections. Follow the specification's MUST requirements for the event store, the query, the append condition, and the event.

Related:

- the `foundation` vocabulary — the projection term
- the `design-by-efferent` hinge-cycle rule — the implementation hinge, where this decides what the candidates are built from

---

Authored by Nicholas Henry on Sat Oct 10 2026 at 1:42:59 PM EDT
