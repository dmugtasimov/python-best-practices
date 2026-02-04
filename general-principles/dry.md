# DRY Principle

YouTube: [DRY Principle Explained: Stop Repeating Code & Data in Real Projects](https://youtu.be/5QIXj-B3cDo)

The **DRY (Don’t Repeat Yourself)** principle is one of the most valuable habits I’ve built during my career.
It consistently leads to cleaner code, fewer bugs, and easier maintenance.

## DRY Applies to Code *and* Data

DRY isn’t just about functions and classes:

- Avoid duplicating business logic.
- Avoid duplicating the same data across entities or tables.
- Extract shared logic and model shared data properly.

## Copy-Paste Creates Hidden Debt

Copying code feels fast, but:

- Bugs get fixed in one place and missed in others.
- Features become partially implemented.
- Duplicated logic slowly diverges.

Small changes eventually become expensive refactors.

## Two Copies Are Already Too Many

I no longer follow the “rule of three.”
Even two copies can diverge. If something repeats, extract it early.

## Less Duplication = Less Maintenance

Non-DRY code means:

- More code to read, test, and change.
- More places where bugs can hide.

DRY code allows you to test core logic once and reuse it everywhere.

## Better Navigation & Understanding

Centralized logic makes it easy to:

- Find all usages.
- Understand system behavior.
- Maintain consistent abstractions.

## DRY Is Easier Than Ever with AI

AI tools make refactoring simpler and faster.
With less time spent typing, you can focus more on improving design and structure.

## References

- [DRY Principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) - Wikipedia

[back](../README.md)
