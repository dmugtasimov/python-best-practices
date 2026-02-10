# Write Code to Be Read

> "Any fool can write code that a computer can understand. Good programmers write code that humans
> can understand." — Martin Fowler

---

## The Core Distinction

Beginners — and even some experienced developers — write code for the computer to execute. The code
works. It satisfies the functional requirements. They ship it.

Best developers write code for humans to read. The computer still executes it, and it still satisfies
the requirements. But a person encountering it for the first time — including the author, a week or more later
— can understand it without significant effort.

This gap separates moderate developers from genuinely good ones. It is one of the most impactful
differences in software quality, yet it is rarely taught explicitly.

---

## Why Readable Code Matters

### Code is maintained far longer than it is written

Writing a feature takes hours or days. That code may be read, debugged, modified, and extended for
years. Every hour spent making code clearer pays forward to every future reader of that code.

### You will be that future reader

Even within the same sprint, you will return to code you wrote last week and may struggle to understand
it. If you find yourself rereading your own code trying to figure out what it does, it needs to be
refactored — not because it's broken, but because it failed the purpose of being readable.

### Business requirements are not preserved elsewhere

In fast-moving environments — especially startups — requirements arrive as tasks, conversations, and
documents that contradict and override each other. They are rarely maintained as a single accurate
source of truth. The code becomes the most reliable record of what the system actually does and why.

If the code doesn't clearly communicate the business intent behind it, you lose that information.
The next time someone needs to change that behavior — or even just understand it — they either have
to reverse-engineer it from the code, or ask a product manager who may no longer remember specific details, may not
be available, or may no longer work there.

### Code that doesn't communicate its intent becomes a liability

Opaque code doesn't cause problems while it sits untouched. The cost appears when you need to
implement a related feature, work around a conflict, or fix a related bug — and you can't tell
what requirements the existing code was built for.

At that point you face a difficult choice: keep the code as-is without understanding it, or invest
time reverse-engineering what the original requirements were. Neither is acceptable.
Keeping it as-is may block the work you need to do. Changing it without understanding the original
requirements risks breaking behavior that was intentional — in ways that won't be obvious until
something fails in production. Reverse-engineering it costs time that shouldn't have been
necessary — and sometimes the person who knew the original requirements is no longer available.

The result: code becomes an obstacle rather than an asset. Not just for the team maintaining it,
but for the business that depends on the system working correctly and being able to evolve.

---

## Readable Code in the Age of AI

AI coding assistants have shifted a large part of code generation to machines. This raises a
reasonable question: if AI can write and read code, does readability still matter?

It matters more, not less.

- AI-generated code tends to be verbose. Two to three times longer than necessary is common.
  The longer the code, the harder it is for both humans and AI to reason about it.
- AI fails at complex, unfamiliar codebases. For subtle bugs, complex algorithms, and deeply
  coupled logic, AI assistance degrades significantly. A human has to step in — and that human
  needs to understand the code.
- AI-generated code needs to be reviewed. You cannot deploy code you don't understand. If you
  can't read the code the AI produced, you have no basis for knowing whether it is correct.

The practical workflow: generate with AI, refactor for clarity, understand what you ship.

See also:
- [Less Code is Better](less-code.md)
- [Continuous refactoring](continuous-refactoring.md)

---

## What "Readable" Actually Means

### Names communicate intent
Variable, function, and class names should describe what something *is* or *does* in business terms,
not implementation terms. A name that requires a comment to explain it is a name that should be
changed.

```python
# Hard to read: what is "d"? what does "proc" do?
d = proc(rec)

# Clear: the intent is self-evident
delivery_cost = calculate_shipping(order)
```

### Structure reflects logic
Code that is organized to match the way the problem is decomposed is easier to follow than code that
reflects the order in which it was written. Functions should do one thing. Related things should be
together. Unrelated things should be separate.

### Short is usually clearer
In most cases, shorter code is more readable — not less. Every extra line is something the reader
must parse and hold in working memory. Eliminate lines that don't add meaning.

The exception: do not shorten code at the cost of readability. Clarity is the goal; brevity is
usually a consequence of clarity, not a substitute for it.

See: [Less Code is Better](less-code.md)

---

## Readability as a Continuous Practice

Whenever you return to code and find it harder to follow than it should be, treat that as a signal
to refactor. This applies the next day during a multi-day task, a week later when extending a
feature, or while passing through code on the way to implementing something else. If you — the
author — find it difficult to read, someone else certainly will. Don't add a comment to paper over
the confusion. Rewrite the code so it doesn't need one. The bar isn't "I don't understand this at
all." If you find yourself thinking "this could be clearer," that's enough. Refactor when you
encounter confusion, not only when you plan to. That's how a codebase improves continuously rather
than degrading continuously.

---

## The Standard to Aim For

A developer encountering a function for the first time should be able to answer the following without
reading anything other than the code itself:

- What does this do?
- Why does it exist?
- What business rule or requirement does it reflect?

If those questions require checking a task tracker or asking a colleague the code is not yet readable enough.

[Back](../README.md)
