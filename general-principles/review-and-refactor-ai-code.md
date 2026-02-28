# Review and Refactor AI-Generated Code

AI coding assistants are genuinely useful. They accelerate code generation, handle boilerplate,
and can produce a working implementation faster than writing it by hand. I use them regularly and
they've become a real part of how I work.

But working AI-generated code and production-ready code are not the same thing. Every piece of
AI-generated code I've used has needed review and refactoring before it belonged in a codebase.

---

## What AI Gets Wrong Consistently

### It produces too much code

AI output is typically two to three times longer than it needs to be. It reaches for explicit,
step-by-step implementations where a more experienced developer would use a built-in, a shorter
construct, or an existing abstraction. More code means more surface area to read, understand,
test, and maintain.

### It doesn't generalize

AI generates code for the specific case you described. It doesn't notice that similar logic
already exists elsewhere in the codebase, and it doesn't extract shared patterns. The result is
duplication — sometimes subtle, sometimes obvious — that violates [DRY](dry.md) and makes the
codebase harder to change.

### It doesn't follow your project's best practices

AI has no inherent knowledge of this codebase's conventions, naming patterns, architectural
decisions, or the best practices documented here. Even when instructed, it applies them
inconsistently. The generated code works, but it doesn't always fit.

### It optimizes for correctness, not readability

AI-generated code is written for the computer to execute, not for a human to read. Variable names
are often generic, logic is often inlined when it should be extracted, and the structure reflects
how the AI reasoned through the problem rather than how a developer would naturally organize it.

See: [Write Code to Be Read By Humans](write-code-to-be-read.md)

### It can't be trusted without review

AI sometimes make mistakes — wrong assumptions, misunderstood requirements, subtle logic errors, outdated
API usage. You cannot deploy code you haven't read and understood. Skipping review means shipping
bugs you never saw.

---

## My Workflow

1. **Use AI for generation.** Describe what's needed, get a working implementation quickly.
2. **Read every line.** Not to rubber-stamp it — to actually understand it. If I can't understand
   it, I refactor it until I can.
3. **Refactor for fit.** Make the code match the codebase's structure, naming conventions, and
   patterns. Extract duplication. Remove unnecessary length. Apply the best practices AI didn't.
4. **Verify correctness.** Understand what the code does well enough to be confident it handles
   the cases that matter.

The AI does the bulk generation. I do the quality. The combination is faster than writing
everything from scratch and more reliable than shipping AI output without review.

I'm continuously trying to reduce how much refactoring is needed — through better prompts, better
context, more specific instructions. But right now, refactoring AI output is a standard step, not
an exception.

---

## The Risk of Skipping This

If you accept AI-generated code without review:

- Duplication accumulates silently across the codebase.
- Conventions diverge. Different parts of the system start to feel like they were written by
  different teams — because effectively, they were.
- The codebase becomes harder to work in over time, not easier, despite the productivity gains
  that looked real in the short term.

The time saved generating code gets consumed paying back the debt of unreviewed output.

---

## The Standard

Treat AI-generated code the way you would treat code submitted by a junior developer in a pull
request: read it, understand it, and hold it to the same standard as any other code before it
merges.

See also:
- [Continuous Refactoring](continuous-refactoring.md)
- [Less Code is Better](less-code.md)
- [DRY](dry.md)

[Back](../README.md)
