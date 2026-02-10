# YAGNI (You Aren't Gonna Need It)

YAGNI is one of my favorite principles — it gives you explicit permission to not do unnecessary
work. The temptation it guards against is real: a developer thinks "this will be useful later"
and implements something nobody asked for. The problem is that the future they're imagining often
never arrives. The same applies to product management level when unnecessary features are added to
a roadmap based on assumptions about what users will want.

We live in a dynamic environment. Products pivot. Features get dropped. A new requirement emerges
that constrains what you can do with something you're building right now. The future is genuinely
hard to predict, and optimizing for it prematurely is usually a losing bet.

---

## The Hidden Cost of Unused Code

When you implement something you don't currently need, you're not just spending time now — you're
creating ongoing overhead:

- **You have to support it.** Tests to write, tests to fix when they fail, changes to make when
  related features evolve.
- **It creates confusion later.** When implementing a feature that conflicts with something
  unused, you don't know what you can sacrifice. You don't know the constraints because the code
  was never actually in use. You can't reason about the tradeoffs.
- **It usually gets removed anyway.** Code that was never used tends to either rot unmaintained
  or get deleted when it gets in the way. At that point, you've paid the implementation cost and
  gotten nothing for it.

---

## What to Do Instead

Even if you're fairly confident something will be needed in the next task — unless the change is
genuinely complex and tightly coupled to what you're doing now — implement it then. Tomorrow's
task may never come, or it may come with different requirements than you expected today.

The goal isn't to predict the future and hard-code for it. The goal is to produce code that is
easy to change into whatever the future actually turns out to be:

- Code that is clean and readable, so the next developer (or you, six months later) understands
  it quickly
- Code covered with tests, so it can be changed safely — see [Unit testing](unit-testing.md)
- Code that is continuously refactored, so it stays malleable — see
  [Continuous refactoring](continuous-refactoring.md)
- Code that follows consistent standards and best practices throughout

A flexible, well-maintained codebase adapts. A rigid codebase loaded with speculative features
resists change and accumulates debt. YAGNI is part of how you keep the codebase flexible.

---

[Back](../README.md)
