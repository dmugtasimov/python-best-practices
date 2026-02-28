# Continuous Refactoring

Refactoring is not a phase or a scheduled activity. For me, it is a continuous habit — something that
happens throughout a task, across tasks, and whenever I encounter code that resists understanding.

---

## When I Refactor

### While implementing the same task

I often start writing code, then hit a new constraint, discover an additional requirement, or realize
a design decision was wrong. I don't push through — I stop and refactor. The code I just wrote is
still fresh, and fixing it now costs far less than carrying the problem forward.

### The next day, reading yesterday's code

I'll open code I wrote the previous day and find it hard to follow. That's a signal. I refactor
before continuing. It's not a detour — it's part of the work.

### Before implementing a task

Most of the time, when I pick up a task in an unfamiliar area, I refactor the relevant code first.
I can't confidently change something I don't understand. Refactoring allows me to understand it, and
it makes the actual implementation cleaner and faster. This is why my PRs often contain refactoring
alongside feature work — it's not scope creep, it's how I work.

### Whenever I encounter code I can't easily read

If I'm passing through some code on the way to implementing something else and I find it confusing,
I refactor it then. I don't schedule it for later. Later rarely comes, and the confusion compounds.

### After AI generates code

I always refactor AI-generated code before it goes anywhere near production. AI assistants are
genuinely useful for generating new code quickly, but they consistently produce two to three times
more code than necessary. They don't generalize well — similar logic gets duplicated instead of
extracted. They often don't follow the best practices in this codebase. They optimize for getting
something that works, not for something a human can maintain.

The workflow I use: AI generates the code, I refactor it into something production-ready. The AI
handles the bulk generation; I handle the quality. I'm continuously trying to reduce how much
refactoring is needed — better prompts, better context, more specific instructions — but for now,
refactoring AI output is a standard part of my process, not an exception.

And I use AI to do the refactoring itself when possible. I ask it to extract functions, rename variables,
remove duplication, and apply other changes I specifically describe in a prompt. And then I review and sometimes 
adjust the AI's refactored code.

See also:
- [Write Code to Be Read](write-code-to-be-read.md)
- [Review and Refactor AI Code](review-and-refactor-ai-code.md)

---

## What Refactoring Reveals

This is the most underappreciated benefit. Refactoring is not just about making code cleaner — it
actively surfaces problems that were previously invisible.

### Similarities and differences become obvious

When code is tangled or duplicated, you can't easily see which parts are truly the same and which
are intentionally different. Refactoring — especially extracting duplication into shared functions —
forces that question. Often the answer reveals an inconsistency or a bug.

### Issues that were hidden in complexity become obvious

When you simplify complex logic — breaking up a long function, renaming vague variables, flattening
nested conditions — you suddenly see what the code is actually doing. Edge cases that were buried in
noise become visible. I've found real bugs this way regularly.

### Refactoring resistance is diagnostic

Sometimes you start refactoring and the code pushes back. You try to extract a function and the
logic doesn't generalize cleanly. You try to rename a variable and the name doesn't hold in some
call sites. You try to remove duplication and realize the two similar-looking blocks are actually
doing subtly different things for reasons you can't explain. That resistance is a signal. It often
means the code has a real problem — an inconsistency, a missing guard, a logic error — that was
hidden by the complexity around it.

Concrete examples of bugs that surface this way:

- You extract a validation function and realize one call site passes arguments in a different order
  than the others — a latent bug that only manifests under specific inputs.
- You rename a flag from `is_active` to `is_published` to match what it actually means, and
  discover it's also used in a completely unrelated context where the semantics don't apply.
- You simplify a date comparison and notice the logic cuts off at midnight rather than end of day —
  a business logic error that caused edge-case failures no one had traced back to this code.
- You inline a helper to understand what it does and find it silently swallows an exception that
  callers assumed would propagate.

The act of making code clearer forces you to understand it precisely. Precise understanding reveals
assumptions that were never validated.

---

## Why It's Worth It

It takes more time in the short term. That's true. But the payoff comes quickly and compounds.

- Code that has been continuously refactored is faster to work in. You spend less time re-understanding
  things you've already understood.
- Bugs found during refactoring are found before they cause problems in production.
- New team members and AI tools can navigate clean code more effectively than tangled code.
- Features built on well-structured code tend to be cleaner themselves. The quality propagates.

The alternative — deferring refactoring — means the cost accumulates silently. Each new feature
built on unclear code adds more confusion. Eventually you have a codebase where every task requires
significant archaeology before any progress can be made.

---

## Additional Benefits

### Reduces technical debt continuously

Regular small refactorings prevent the accumulation of structural debt. The cost of fixing something
small now is orders of magnitude less than fixing something large later, after years of code have
been built on top of it.

### Improves extensibility
Well-structured code can be extended without being rewritten. Code that was never refactored tends
to resist change — every addition becomes a workaround.

### Lowers the cost of onboarding

A codebase that has been continuously refactored is significantly easier for new developers to learn.
The intent is visible in the structure and names, not buried in accretion layers of historical
workarounds.

### Reinforces good habits across the team

When refactoring is normalized — when PRs regularly include it, when it's seen as part of delivering
a task rather than a distraction from it — the whole team's code quality improves. It sets a
standard that the codebase is worth caring about.

---

## The Rule I Follow

If I do not understand code easily, I do not leave it. I refactor it until I do.

[Back](../README.md)
