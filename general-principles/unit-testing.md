# Unit Testing

Some developers and managers don't see the full value of writing tests. The value isn't just in
verifying the feature you're building — though that matters, and I do find bugs through tests
regularly. For sophisticated algorithms especially, tests are essential. But that's not where most
of the value comes from.

---

## Why I Write Tests

### To verify what I just built works — and catch bugs early

When I finish implementing something, tests give me confidence it actually does what I intended.
For complex logic, this is indispensable. Bugs found here cost almost nothing to fix.

### To make future changes safe

This is where tests pay off most. When I — or another developer — later need to touch code to add
a feature or change behavior, tests make it possible to do that without manually re-verifying
everything. Without tests, every change requires either extensive manual testing or just hoping
nothing broke. Neither is acceptable.

The payoff comes fast. Often the very next task, or the one after, I'm already relying on tests I
wrote two weeks ago.

### To enable continuous refactoring

Without automated tests, refactoring is nearly impossible in practice. You avoid changes because
you don't know what you'll break. Technical debt accumulates. You start duplicating code instead
of generalizing it — because generalization requires touching things, and touching things is
risky. More code, more duplication, more places for bugs. Tests are what make refactoring safe.

See: [Continuous refactoring](continuous-refactoring.md).

### To describe how the system is supposed to work

This matters especially in a team. When I have to change code I didn't write, I often don't know
the business requirements behind it. Tests tell me. They show what the expected behavior is, what
edge cases were considered, what inputs are valid. Without tests, I have to either dig through
history and ask people, or guess. Both are slow and error-prone.

---

## The Cost of Not Testing

A codebase without tests tends to develop a particular character: hard to read, hard to change,
full of duplication, accumulating bugs in corners nobody dares touch. Every new feature becomes
more expensive than the last because the foundation keeps getting weaker. Tests aren't the only
thing that prevents this, but they're one of the most reliable.

---

## Writing Tests in the AI Era

Writing tests used to take roughly as long as writing the code itself. That was the honest cost,
and some teams decided it wasn't worth it. That tradeoff no longer exists.

AI generates tests fast. I still review them — check what they actually test, refactor where
needed — but the time is now maybe 20–30% of what it used to be. The effort is low enough that
I don't accept "it takes too long" as a reason to skip tests anymore.

---

## Unit Tests Don't Replace Manual Testing

Unit tests are not a substitute for manual testing. I still test every feature I ship by hand.

Unit tests work in isolation — dependencies are mocked, environments are simulated. Real
environments are different. Authentication flows, third-party integrations, infrastructure
configuration, subtle differences between local development and deployed environments — these all may introduce bugs
that unit test may not catch, because unit tests never exercise them.

There are also integration issues that only surface when components interact, and UI behavior that
only becomes apparent when a human actually uses it. A form that submits correctly in a test can
still be confusing or broken in a browser.

The key is selectivity. I don't manually re-test everything on every change — that's what
automated tests are for. But whenever I develop or touch a feature, I test it manually before
shipping. Thoroughly enough to catch what the tests can't see.

---

## The Rule I Follow

If the code is worth writing, it's worth testing. The time spent writing tests is not overhead —
it's investment that pays back starting with the current task and gaining most value in the subsequent tasks.

[Back](../README.md)
