# Respect Best Practices

## What Are Best Practices?

Best practices are not opinions or preferences — they are the **distilled collective experience** of the
engineering community. They emerge from a simple, brutal process:

1. Developers face a problem.
2. They try different solutions — some obvious, some clever, some quick.
3. Most of those solutions cause pain later: bugs, outages, rewrites, wasted time.
4. A few solutions turn out to work reliably.
5. Those solutions are shared, discussed, and refined across the industry.
6. Eventually they become "best practices."

This means every best practice carries a hidden payload: the failures of everyone who didn't follow it.
When you adopt a best practice, you inherit that knowledge without having to pay the price personally.

---

## The Decision Point Problem

The most dangerous moment is **when you are making the decision**.

At that moment:

- The "shortcut" feels harmless or even smart.
- The technically correct approach may feel over-engineered or unnecessary.
- The consequences of the wrong choice are invisible — they only appear weeks, months, or years later.
- You don't know what you don't know.

This is why best practices must be applied proactively, not reactively. You don't wait to feel pain before
following them. You follow them because others already felt that pain for you.

> You don't need to know what can go wrong. You just need to know that something will.

---

## Why People Don't Follow Best Practices

Even experienced developers sometimes skip best practices. Research and industry experience consistently identify
these reasons:

### "It seems simple enough without it"

The most common trap. The shortcut works — right now, in this specific case, with this specific data.
The problem only becomes visible at scale, under high load, or when someone else touches the code.

### "I don't have time"

Pressure to ship creates the illusion that skipping best practices is faster. It is — once.
Every subsequent touch of that code costs more than the time "saved."

### "I don't understand how to apply it here"

Knowing a principle is not the same as knowing how to apply it in a specific context. This is a real
gap, and it is worth solving: study examples, ask for review, look at how established libraries do it.

### "It doesn't apply to my situation"

Generalizations can feel too abstract. But most best practices encode extremely specific failure modes
that are just expressed in general terms. The specifics are in the history.

### "This is how we've always done it here"

Organizational inertia. Existing codebase patterns become defaults, regardless of quality.
New code follows old patterns. Bad practices replicate.

### "I'll fix it later"

Later rarely comes. Technical debt compounds. The cost of fixing increases as the system grows around
the shortcut.

---

## What Happens When You Don't Follow Them

### You pay interest on debt you didn't choose to take

Every shortcut becomes a constraint. Every workaround limits future options. The codebase becomes
harder to change, and eventually even small modifications require significant effort.

### You lose predictability

Best practices make system behavior predictable. Without them, you introduce unexpected failure modes.
The more violations accumulate, the harder it is to reason about the system. This is especially painful when 
are planning or estimating work — you can't predict how long something will take when you don't know what can go wrong.
Often underestimate the effort required since it is hard to know what exact technical debt is buried in the code,
especially if it was written by other developers. 

### You repeat work

Ignoring best practices often means building something that works — then discovering the fundamental
flaw — then rebuilding it correctly. The second version usually looks like the best practice you
skipped in the first place. Another way of repeating is that you repeat the work that has been probably done
by other developers: with following the best practices you might just reuse it instead of reinventing the wheel.

---

## Python Stack Examples

### Not pinning or managing dependencies properly

#### Without best practice

Using `pip install` without pinning versions, or managing environments manually instead of using `uv` or `Poetry`.

**What goes wrong**:
- A transitive dependency releases a breaking change. (a package your dependency relies on, not one you chose directly)
- Your local environment and production diverge silently.
- A colleague clones the repo and gets different behavior.
- Debugging takes hours because the failure isn't in your code.

#### With best practice

Lock files (`uv.lock`, `poetry.lock`) make environments reproducible. The problem never happens.

---

### Not using a linter and formatter from the start

#### Without best practice

Skipping `Ruff` or not configuring `pre-commit` hooks early in the project.

**What goes wrong**:
- Style inconsistencies accumulate across contributors.
- Adding a linter later generates thousands of violations.
- Fixing them all at once produces a massive diff that makes the git history unreadable.
- Or worse: the violations stay, because it's "too disruptive to fix now."

#### With best practice

Linting and formatting from day one costs nothing. The codebase stays consistent
with zero effort.

---

### Using bare `except` or catching broad exceptions

#### Without best practice

```python
try:
    result = do_something()
except Exception:
    pass
```

**What goes wrong**:
- Silent failures that are impossible to debug.
- Errors swallowed at one layer surface as mysterious failures elsewhere.
- KeyboardInterrupt, SystemExit, and other critical signals get suppressed.

#### With best practice
Catch specific exceptions. Use `logger.exception()` to always log tracebacks
in `except` blocks. Failures become visible and diagnosable.

---

### Not using a proper logging setup

#### Without best practice

Using `print()` for debug output, or not configuring log levels.

**What goes wrong**:
- Debug output appears in production.
- No structured log levels means you can't filter noise.
- In production, `print()` statements either get left in (polluting logs) or removed (taking away
  the only diagnostics you had).

#### With best practice

`colorlog` and structured logging with levels. Debug output stays in
development. Production logs are clean and filterable.

---

### Not writing tests

#### Without best practice

Shipping features without `pytest` tests, relying only on manual testing.

**What goes wrong**:
- A refactoring that seems safe silently breaks existing behavior.
- Regressions are discovered by users, not developers.
- Adding tests later is harder because code was never written to be testable.
- Confidence in the codebase erodes. Every change feels risky.

#### With best practice

Tests give you confidence to change code. Regressions are caught before
deployment. `diff-cover` ensures new code is always tested.

See: [Unit testing](unit-testing.md)

---

### Not using Django REST framework's declarative ViewSet syntax

#### Without best practice

Implementing view logic imperatively — manually handling pagination, filtering, permission checks,
and serialization inside method bodies instead of declaring them as class attributes
(`serializer_class`, `queryset`, `filter_backends`, `permission_classes`, `pagination_class`,
`throttle_classes`, etc.).

**What goes wrong**:
- Third-party integrations (`django-filter`, DRF's `SearchFilter`, `OrderingFilter`) rely on
  declared attributes and don't plug in automatically. You either skip them or re-implement
  the same integration by hand.
- Pagination, throttling, and content negotiation must be wired manually in each view —
  and are easy to forget or apply inconsistently.
- Router-based URL generation breaks or requires manual routing, losing the consistency and
  the reduction in boilerplate that routers provide.
- OpenAPI/Swagger schema generation (`drf-spectacular`, `drf-yasg`) cannot introspect views that
  don't follow the expected structure, producing incomplete or incorrect API documentation.
- Permission and authentication logic scattered across method bodies is easy to miss during
  review and easy to accidentally omit on new endpoints.
- Code duplication accumulates fast. Logic that DRF handles generically gets reimplemented
  separately in each view, often slightly differently each time.
- Custom implementations are rarely as correct or as complete as the framework's. DRF's generic
  behavior has been implemented, tested, and refined over years of real-world use. Hand-rolled
  equivalents typically miss edge cases that only appear in production.

#### With best practice

Declare `serializer_class`, `queryset`, `permission_classes`, `filter_backends`,
`pagination_class`, `throttle_classes`, and related attributes on the ViewSet class.
Third-party libraries plug in automatically. Behavior is consistent across all endpoints.
Adding a new endpoint means declaring attributes, not reimplementing infrastructure.

---

## On Following Industry Standards

Standards exist for the same reason best practices do: accumulated experience across many teams,
many projects, many failures.

**PEP 8** is not arbitrary formatting preferences. It is the result of decades of Python community
experience about what makes Python code readable and maintainable.

**REST conventions** are not bureaucratic rules. They exist because teams that ignored them built
APIs that were confusing, inconsistent, and painful to consume and maintain.

**Django's opinionated structure** — apps, models, views, serializers — is not a constraint.
It is a shared vocabulary that lets any Django developer understand any Django project within minutes.
Deviating from it means building something that only you understand.

When you follow a standard, you gain the understanding of everyone who knows that standard.
When you deviate, you work alone — even on a team.

See: [Respect industry standards](industry-standards.md)

---

## The Core Principle

Best practices are not a set of rules to comply with. They are a body of pre-solved problems.

When you face a decision — about project structure, dependency management, error handling, testing,
API design — and there is an established best practice for it, **the decision is already made for you**.
You don't have to think, experiment, or discover the failure mode yourself.

Ignoring a best practice is not independence or pragmatism. It is choosing to re-run an experiment
that the industry already ran — and already knows the outcome of.

Follow best practices by default. Deviate only deliberately, with a documented reason, and with
full awareness of what you are trading away.

There is a saying: "Smart people learn from their mistakes. Wise people learn from other people's mistakes."

Let's be not just smart, but also wise.

[Back](../README.md)
